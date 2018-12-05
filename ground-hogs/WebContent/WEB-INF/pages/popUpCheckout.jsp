     
<%@ page import="java.util.*" %> 
<%@ page import="model.Cart" %>  
<%@ page import="model.CartItem" %> 
<%@ page import="utility.Helper" %> 
<%@ page import="java.util.Enumeration" %> 
<%!Enumeration<CartItem> cartItems;%>
<%!Cart myCart=new Cart();%>
<% 	
	boolean isCartEmpty=true;
	if(request.getSession().getAttribute("myCart")!=null){
		myCart=(Cart)request.getSession().getAttribute("myCart");
		isCartEmpty=myCart.getTotalItems()<=0;
	}
%>

   
   
   
   <form class="popUpForm" ACTION="submitCheckout.do" METHOD="POST">
     
     <div id="popUpCheckoutArea">			
		
		<!-- BEGIN SHIPPMENT INFO -->
		<div id="shippingInfo"> 
			<h3 class="cartOrderSummaryH3">Shipping Information</h3> 
		</div>
		
		
		<!-- BEGIN PAYMENT INFO -->
		
		<div id="paymentInfo"> 
			<h3 class="cartOrderSummaryH3">Payment Information</h3> 
			
		</div>
		
		
		<!-- BEGIN CART INFO -->
		<div id="cartInfo"> 
			<h3 class="cartOrderSummaryH3">My Cart</h3>

	    </div>
	
		
		<!-- END CART INFO -->
		
      		
   </form>