package coreservlets;

import java.util.ArrayList;

import javax.servlet.http.*;
import org.apache.struts.action.*;

import database.DBAccess;
import utility.Helper;

public class SubmitCustomerSupport extends Action {
  public ActionForward execute(ActionMapping mapping,
                               ActionForm form,
                               HttpServletRequest request,
                               HttpServletResponse response)
      throws Exception {
	  
	   ArrayList<String> responses= new ArrayList<String>(); 
       
	   request.getSession().setAttribute("responses", responses);
	   String selection=request.getParameter("contactUsReason");
	   
	   if(selection.equalsIgnoreCase("justAQuickQuesiton")) {
		   if(Helper.validateDataAndManageSession(request, Helper.quickQuestionValidation)) {
				DBAccess.SP_AddFAQ(request.getParameter("txtAreaMessage"));
				responses.add("We received your question. We will try to post the answer as soon as possible.");
				setResponseInSession(request.getSession(),"Thank you!",responses,"success","popUpMessages");
				Helper.resetDataValidation(request);
		   }
		   else {
			   setResponseInSession(request.getSession(),"Customer Support",responses,"success","popUpContactUsForm");
		   }
		}
		else if(Helper.validateDataAndManageSession(request, Helper.customerSupportFormDataValidation)) {
			responses.add("We have received your message. One of our team members will reach out to you shortly.");
			setResponseInSession(request.getSession(),"Thank you! "+request.getParameter("fname"),responses,"success","popUpMessages"); 
			Helper.resetDataValidation(request);
		}else {
			setResponseInSession(request.getSession(),"Customer Support",responses,"success","popUpContactUsForm");
		}
	  	
	   return(mapping.findForward("returnToLastPage"));
  }
  
  private  void setResponseInSession(HttpSession session, String popUpTitle, ArrayList<String> responses, String responseType, String popUpContent) {
	  session.setAttribute("popUpTitle", popUpTitle);
	  session.setAttribute("responses", responses);
	  session.setAttribute("responseType", responseType);
	  session.setAttribute("hasResponse", true);
	  session.setAttribute("popUpContent", popUpContent);
  }
}
