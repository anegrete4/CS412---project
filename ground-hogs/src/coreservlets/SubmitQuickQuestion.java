package coreservlets;

import java.util.ArrayList;

import javax.servlet.http.*;
import org.apache.struts.action.*;

import database.DBAccess;

public class SubmitQuickQuestion extends Action {
  public ActionForward execute(ActionMapping mapping,
                               ActionForm form,
                               HttpServletRequest request,
                               HttpServletResponse response)
      throws Exception {
	  
	  ArrayList<String> responses= new ArrayList<String>();
	   request.getSession().setAttribute("responses", responses);
	   DBAccess.SP_AddFAQ(request.getParameter("quickQuestion"));
	   responses.add("We have got your question, and we will provide the answer as soon as possible.");
	   setResponseInSession(request.getSession(),"Thank you!",responses,"success","popUpDisplay");
	   return(mapping.findForward("returnToLastPage"));
  }
  
  private  void setResponseInSession(HttpSession session, String popUpTitle, ArrayList<String> responses, String responseType, String returnToPageContent) {
	 if(returnToPageContent.isEmpty()) {
		 returnToPageContent="popUpMessages";
	 }
	  session.setAttribute("popUpTitle", popUpTitle);
	  session.setAttribute("responses", responses);
	  session.setAttribute("responseType", responseType);
	  session.setAttribute("hasResponse", true);
	  session.setAttribute("popUpContent", returnToPageContent);
  }
}
