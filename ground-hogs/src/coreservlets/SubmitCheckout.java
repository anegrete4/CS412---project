package coreservlets;

import java.util.ArrayList;

import javax.servlet.http.*;
import org.apache.struts.action.*;

import database.DBAccess;

public class SubmitCheckout extends Action {
  public ActionForward execute(ActionMapping mapping,
                               ActionForm form,
                               HttpServletRequest request,
                               HttpServletResponse response)
      throws Exception {
	  
	  ArrayList<String> responses= new ArrayList<String>();
	  request.getSession().setAttribute("responses", responses);
	  DBAccess.SP_AddFAQ(request.getParameter("quickQuestion"));
	   responses.add("Thank you for your business. Please revisit.");
	   setResponseInSession(request.getSession(),"Thank you!",responses,"success");
	   return(mapping.findForward("returnToLastPage"));
  }
  
  private  void setResponseInSession(HttpSession session, String popUpTitle, ArrayList<String> responses, String responseType) {
	  session.setAttribute("popUpTitle", popUpTitle);
	  session.setAttribute("responses", responses);
	  session.setAttribute("responseType", responseType);
	  session.setAttribute("hasResponse", true);
	  session.setAttribute("popUpContent", "popUpMessages");
  }
}
