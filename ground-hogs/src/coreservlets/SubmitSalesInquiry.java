package coreservlets;

import java.util.ArrayList;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class SubmitSalesInquiry extends Action {
  public ActionForward execute(ActionMapping mapping,
                               ActionForm form,
                               HttpServletRequest request,
                               HttpServletResponse response)
      throws Exception {
	  
	  ArrayList<String> responses= new ArrayList<String>();
	  request.getSession().setAttribute("messages", responses);
	  
	   responses.add("Thank you for your complaint, It will help us to improve ourselves moving forward.");
	   setResponseInSession(request.getSession(),"We've received your Inquiary",responses,"success");
	   return(mapping.findForward("returnWithResponse"));
  }
  
  private  void setResponseInSession(HttpSession session, String responseTitle, ArrayList<String> responses, String responseType) {
	  session.setAttribute("responseTitle", responseTitle);
	  session.setAttribute("responses", responses);
	  session.setAttribute("responseType", responseType);
  }
}
