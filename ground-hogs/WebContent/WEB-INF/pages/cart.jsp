<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 
     
<%@ page import="java.util.*" %> 
<%@ page import="model.Cart" %>  
<%@ page import="model.CartItem" %> 
<%@ page import="utility.Helper" %> 
<%@ page import="java.util.Enumeration" %> 
<%!Enumeration<CartItem> cartItems;%>
<%!Cart myCart=new Cart();%>
<% 	
	if(request.getSession().getAttribute("myCart")!=null){
		myCart=(Cart)request.getSession().getAttribute("myCart");
	}
%>

 
 
<div class="CartWrapper" id="CartBox">
   <div class="CartContainer">
      <div class="CartHeader">
      	<h3>Cart Items</h3>
  			<div class="popUpCloseButton crossButton" onClick="toggleCart('false')"></div>
        </div>
      
      		<% 
      			Enumeration<CartItem> e=myCart.getCartItems();
      			while(e.hasMoreElements()){
      				CartItem i=(CartItem)e.nextElement();
      				%>
      					<div class="cartItemRow">
      							<div class="cartItemCol1">
      								<div class="cartItemImage"><img src="images/products/<%=i.getImagePath()%>" alt="Product Image"></div>
      								<div class="cartItemRating"><img src="images/icons/<%=Helper.getClassNameForRating(i.getRating()) %>.png" alt="rating"><%=i.getRating() %></div>
      							</div>
	      						<div class="cartItemCol2">
	      							<div class="cartItemName"><%=i.getItemName() %></div>
	      							<div class="cartItemUnitPrice"><span>Price</span><%=Helper.getFormattedAmount(i.getItemPrice())%></div>
	      							<div class="cartItemCount"><span>Quantity</span><%=i.getItemCount() %></div>
	      							<div class="cartItemTotal"><span>Total</span><%=Helper.getFormattedAmount(i.getTotalPrice()) %></div>
      							</div>
      					</div>
      				<%
      			}
      		
      		%>
 
      </div>
      <div class="CartTotal">
      		<div ><%= myCart.getTotalItems()%></div>
      		<div ><%=myCart.getSubTotal() %></div>
      		<div><%=myCart.getShippmentAmount() %>
      		
      		<div ><%=myCart.TAX_PERCENT*100 %>%</div>
      		
      		
      </div>
    	<form class="InputForm ComplaintForm" ACTION="popUpDisplay.do" METHOD="POST">
               <input type="hidden" value="Checkout" name="popUpTitle" />
               <input type="hidden" value="popUpCheckout" name="popUpContent" />
               <input type="submit" onClick="toggleCart('false')" value="Checkout" class="hoverTransparentBg">  
        </form>
  
   </div>
</div>