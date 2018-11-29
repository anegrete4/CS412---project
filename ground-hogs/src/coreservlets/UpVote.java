package coreservlets;

import java.util.ArrayList;

import javax.servlet.http.*;
import org.apache.struts.action.*;

import database.DBAccess;

public class UpVote extends Action {
  public ActionForward execute(ActionMapping mapping,
                               ActionForm form,
                               HttpServletRequest request,
                               HttpServletResponse response)
      throws Exception {
	  ArrayList<String> responses= new ArrayList<String>();
	  request.getSession().setAttribute("messages", responses);
	  DBAccess.SP_AddAVote(Integer.parseInt(request.getParameter("questionId")));
	  return null;
  }
}
