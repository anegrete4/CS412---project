package coreservlets;

import java.util.ArrayList;

import javax.servlet.http.*;
import org.apache.struts.action.*;

import database.DBAccess;
import model.Cart;
import model.SalesItem;

public class SubmitAddToCart extends Action {
  public ActionForward execute(ActionMapping mapping,
                               ActionForm form,
                               HttpServletRequest request,
                               HttpServletResponse response)
      throws Exception {
	  SalesItem item= new SalesItem();
	  Cart myCart;
	  
	  if(request.getSession().getAttribute("myCart")==null) {
		  myCart=new Cart();
	  }else {
		  myCart=(Cart)request.getSession().getAttribute("myCart");
	  }
	  int prevVal=myCart.getTotalItems();
	  if(request.getSession().getAttribute("itemToAdd")!=null) {
		  item=(SalesItem)request.getSession().getAttribute("itemToAdd");
		  if(request.getParameter("quantity")!=null) {
			 myCart.addItem(Integer.parseInt(request.getParameter("quantity")),item);
			 request.getSession().setAttribute("myCart", myCart);
		  }
		  request.getSession().setAttribute("hasResponse", false);
		  request.getSession().removeAttribute("itemToAdd");
	  }
	  return(mapping.findForward("returnToLastPage"));
  }
}
