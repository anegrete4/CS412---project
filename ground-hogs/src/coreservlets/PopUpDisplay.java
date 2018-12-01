package coreservlets;

import java.util.ArrayList;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class PopUpDisplay extends Action {
  public ActionForward execute(ActionMapping mapping,
                               ActionForm form,
                               HttpServletRequest request,
                               HttpServletResponse response)
      throws Exception {
	  ArrayList<String> responses= new ArrayList<String>();
	  request.getSession().setAttribute("messages", responses);
	  responses.add("Thank you for your complaint, It will help us to improve ourselves moving forward.");
	  String responseType=request.getParameter("responseType")==null?"error":request.getParameter("responseType");
	  setResponseInSession(request.getSession(),request.getParameter("popUpTitle"),request.getParameter("popUpContent"),responseType);
	  return(mapping.findForward("returnToLastPage"));
  }
  
  private  void setResponseInSession(HttpSession session, String popUpTitle, String popUpContent, String responseType) {
	 
	  session.setAttribute("hasResponse", true);
	  session.setAttribute("popUpTitle", popUpTitle);
	  session.setAttribute("popUpContent", popUpContent);
	  session.setAttribute("responseType", responseType);
  }
}
