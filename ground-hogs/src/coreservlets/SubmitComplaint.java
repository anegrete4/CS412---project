package coreservlets;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class SubmitComplaint extends Action {
  public ActionForward execute(ActionMapping mapping,
                               ActionForm form,
                               HttpServletRequest request,
                               HttpServletResponse response)
      throws Exception {
	  String orderNo = request.getParameter("email");
	    String password = request.getParameter("password");
	    if ((orderNo == null) ||
	        (orderNo.trim().length() < 3)) {
	      return(mapping.findForward("bad-address"));
	    } 
	    else{
	      return(mapping.findForward("success"));
	    }
	  
	 /*
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    if ((email == null) ||
        (email.trim().length() < 3) ||
        (email.indexOf("@") == -1)) {
      return(mapping.findForward("bad-address"));
    } else if ((password == null) ||
               (password.trim().length() < 6)) {
      return(mapping.findForward("bad-password"));
    } else {
      return(mapping.findForward("success"));
    }
    */
  }
}
