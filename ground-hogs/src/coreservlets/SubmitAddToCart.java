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
	  int val=0;
	  SalesItem item= new SalesItem();
	  ArrayList<String> responses= new ArrayList<String>();
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
			 responses.add("Item is added"+item.getItemName());
			 responses.add(prevVal+"Total Items: "+myCart.getTotalItems());
			 request.getSession().setAttribute("myCart", myCart);
		  }
		  
		  setResponseInSession(request.getSession(),"Thank you!",responses,"success");
	  }
	  responses.add("Thank you for your registration, See you on.."+val);
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
