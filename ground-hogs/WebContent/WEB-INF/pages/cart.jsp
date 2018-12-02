<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 
     
<%@ page import="java.util.*" %> 
<%@ page import="model.Cart" %>  
<%@ page import="model.CartItem" %> 
<%!Enumeration<CartItem> cartItems;%>
<%!Cart cart=new Cart();%>
<% 	
	if(request.getSession().getAttribute("CartItems")!=null){
		cart.setStringData((String)request.getSession().getAttribute("CartItems"));
	}
%>

 
 
<div class="CartWrapper" id="CartBox">
   <div class="CartContainer">
      <div class="CartHeader">
      	<h3>Cart Items</h3>
  			<div class="popUpCloseButton crossButton" onClick="toggleCart('false')"></div>
        </div>
      <div class="CartItems">
      </div>
      <div class="CartTotal">
      </div>
    	<form class="InputForm ComplaintForm" ACTION="popUpDisplay.do" METHOD="POST">
               <input type="hidden" value="Checkout" name="popUpTitle" />
               <input type="hidden" value="popUpCheckout" name="popUpContent" />
               <input type="submit" onClick="toggleCart('false')" value="Checkout" class="hoverTransparentBg">  
        </form>
  
   </div>
</div>