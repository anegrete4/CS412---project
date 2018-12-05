package coreservlets;

import java.util.ArrayList;

import javax.servlet.http.*;
import org.apache.struts.action.*;

import database.DBAccess;
import utility.Helper;

public class Shopping extends Action {
  public ActionForward execute(ActionMapping mapping,
                               ActionForm form,
                               HttpServletRequest request,
                               HttpServletResponse response)
      throws Exception {
  
	  // String selection=request.getParameter("contactUsReason");
	   
	  	
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
