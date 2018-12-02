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
      
  <form class="InputForm ComplaintForm" ACTION="popUpDisplay.do" METHOD="POST"> 
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
 
   


<h3 class="cartOrderSummaryH3">Order Summary</h3>                         
<div id="cartTableWrapper">
   <table class="cartTable">
        <tbody >
          
            <tr class="orderSummaryRow"> 
              <td class="leftAlign">Items (9):</td>  
              <td class="">$1,190.16</td>
            </tr>
            <tr class="orderSummaryRow"> 
              <td class="leftAlign">Shipping &amp; handling:</td>  
              <td class="">$9.59</td>
            </tr>
            <tr class="orderSummaryRow">
              <td colspan="2" class="orderSummaryRow"><hr class="a-spacing-none"></td>
            </tr>
            <tr class="orderSummaryRow"> 
              <td class="leftAlign">Total before tax:</td>  
              <td class="">$1,199.75</td>
            </tr>
            <tr class="orderSummaryRow"> 
              <td class="leftAlign">Tax:</td>  
              <td class="">$120.56</td>
            </tr>
            <tr class="orderSummaryRow">
              <td colspan="2"><hr></td>
            </tr>
            <tr class="orderTotalRow">
                <td><strong>Order total:</strong></td>
                <td ><strong>$1,320.31</strong></td>
            </tr>
            <tr class="orderBtnRow">
            	<td class="continueShoppingBtnWrapper">
            		   		<input class="continueShoppingBtn" onClick="toggleCart('false')" title="Continue Shopping" class="continueShopppingBtn" value="Continue shopping" name="placeYourOrder">
            	</td>
            	<td class="checkoutButtonWrapper">
                 <input class="checkoutButton" type="submit" onClick="toggleCart('false')" value="Proceed to checkout" class="hoverTransparentBg">  
          	</td>
            </tr>
        </tbody>
      </table>
    </div>
    
      
    	
               <input type="hidden" value="Checkout" name="popUpTitle" />
               <input type="hidden" value="popUpCheckout" name="popUpContent" />
        </form>
  
   </div>
</div>