package coreservlets;

import javax.servlet.http.*;
import org.apache.struts.action.*;

import model.Cart;

public class SubmitUpdatedQuantity extends Action {
  public ActionForward execute(ActionMapping mapping,
                               ActionForm form,
                               HttpServletRequest request,
                               HttpServletResponse response)
      throws Exception {
	  Cart myCart;
	  HttpSession session=request.getSession();
	  if(session.getAttribute("myCart")==null) {
		  myCart=new Cart();
	  }else {
		  myCart=(Cart)session.getAttribute("myCart");
	  }
  	  if(myCart!=null && request.getParameter("quantity")!=null && request.getParameter("itemId")!=null) {
		  int itemId=Integer.parseInt(request.getParameter("itemId").toString());
		  int quantity= Integer.parseInt(request.getParameter("quantity").toString());
		  myCart.updateQuantity(itemId, quantity);
		  session.setAttribute("myCart", myCart);
	  }
	  session.setAttribute("hasResponse", false);
	  return(mapping.findForward("returnToLastPage"));
  }
}
