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
	boolean isCartEmpty=true;
	if(request.getSession().getAttribute("myCart")!=null){
		myCart=(Cart)request.getSession().getAttribute("myCart");
		isCartEmpty=myCart.getTotalItems()<=0;
	}
%>

 
 
<div class="CartWrapper" id="CartBox" >
      <div class="CartHeader">
      	<h3>My Cart</h3>
  			<div class="popUpCloseButton crossButton" onClick="toggleCart('false')"></div>
        </div>
      	<%
      		if(!isCartEmpty){
      	%>
  		  <div class="cartItemsWrapper invisibleScrollBg adjustCartItems">
  		   <table>
        		<tbody class="cartItems" >
      		<% 
      			Enumeration<CartItem> e=myCart.getCartItems();
      			while(e.hasMoreElements()){
      				CartItem i=(CartItem)e.nextElement();
      				%>
      					<tr class="itemRow cartProductImage"><td rowSpan="6" class="parentHover"><a href="<%=i.createHtmlAnchorHref()%>"><img class="clickableImage childMagCart imgCartAdjust" src="images/products/<%=i.getImagePath()%>" alt="Product Image"></a></td><td colSpan="2"><span class="cartItemName"><%=i.getItemName() %></span></td></tr>
      					<tr class="itemRow"><td colSpan="2" class="cartItemRating"><img src="images/icons/<%=Helper.getClassNameForRating(i.getRating()) %>.png" alt="rating"><%=i.getRating() %></td></tr>
      					<tr class="itemRow"><td class="leftAlign">Unit cost:</td><td class="rightAlign"><%=Helper.getFormattedAmount(i.getItemPrice())%></td></tr>	
      					<tr class="itemRow"><td class="leftAlign">Quantity:</td><td class="rightAlign"><%=i.getItemCount() %></td></tr>
      					<tr class="itemRow"><td class="leftAlign">Cost for this item:</td><td class="rightAlign"><span class="cartItemTotal"><%=Helper.getFormattedAmount(i.getTotalPrice()) %></span></td></tr>
      					
      					<tr class="itemRow"><td colSpan="2" class="removeItemButtonWrapper" rowSpan="2">
	      					<form class="InputForm" ACTION="submitUpdatedQuantity.do" METHOD="POST"> 
	      						<input type="hidden" value="<%=i.getItemId() %>" name="itemId" />
	      						<input type="hidden" value="0" name="quantity" />
                    			<input type="hidden" value="popUpCheckout" name="popUpContent" />
			                	<input class="tButton colorRed redGlow" type="submit" value="Remove this item">  
			              </form>
      					</td></tr>		
      					<tr><td colSpan="3"><div class="line"></div></td></tr>
      				<%
      			}
      		
      		%>
 
   			</tbody>
   		</table>
   		</div>

	                        
	<div id="cartTableSummary" class="orderBoxWrapper">
		<h3 class="cartOrderSummaryH3">Order Summary</h3> 
	   <table class="cartTableSummary">
	        <tbody >  
	            <tr class="orderSummaryRow"> 
	              <td class="leftAlign">Items (<%=myCart.getTotalItems() %>):</td>  
	              <td class="rightAlign"><%=Helper.getFormattedAmount(myCart.getSubTotal()) %></td>
	            </tr>
	            <tr class="orderSummaryRow"> 
	              <td class="leftAlign">Shipping &amp; handling:</td>  
	              <td class="rightAlign"><%=Helper.getFormattedAmount(myCart.getShippmentAmount()) %></td>
	            </tr>
	            <tr class="orderSummaryRow">
	              <td colspan="2" class="orderSummaryRow"><hr class="a-spacing-none"></td>
	            </tr>
	            <tr class="orderSummaryRow"> 
	              <td class="leftAlign">Total before tax:</td>  
	              <td class="rightAlign"><%=Helper.getFormattedAmount(myCart.getTotalBeforeTax()) %></td>
	            </tr>
	            <tr class="orderSummaryRow"> 
	              <td class="leftAlign">Tax:</td>  
	              <td class="rightAlign"><%=Helper.getFormattedAmount(myCart.getTax()) %></td>
	            </tr>
	            <tr class="orderSummaryRow">
	              <td colspan="2"><hr></td>
	            </tr>
	            <tr class="orderTotalRow">
	                <td class="leftAlign"><strong>Order total:</strong></td>
	                <td class="rightAlign"><strong><%=Helper.getFormattedAmount(myCart.getOrderTotal()) %></strong></td>
	            </tr>
	            <tr class="orderBtnRow">
	            	<td >
	            		    <a href="http://localhost:8080/ground-hogs/Shopping.jsp">
	            		   		<input class="tButton yellowGlow" onClick="toggleCart('false')" title="Continue Shopping" class="continueShopppingBtn" value="Continue shopping" name="placeYourOrder">
	            			</a>
	            	</td>
	            	<td>
	                <form class="InputForm" ACTION="popUpDisplay.do" METHOD="POST"> 
	                	<input class="tButton greenGlow" type="submit" onClick="toggleCart('false')" value="Proceed to checkout">  
	                 	<input type="hidden" value="Checkout" name="popUpTitle" />
	                    <input type="hidden" value="popUpCheckout" name="popUpContent" />
	        		</form>
	          	</td>
	            </tr>
	        </tbody>
	      </table>
	    </div>
	    <%}
      		else{
      			%>
      				<div class="EmptyCartMessage">
      					<h3 class="EmptyCartMessageH3">Your cart is empty!</h3>
      					<div class="continueShoppingBtnWrapper buttonEmpty">
      						<a href="http://localhost:8080/ground-hogs/Shopping.jsp">
	            		   	  <input class="tButton" onClick="toggleCart('false')" title="Continue Shopping"  value="Start shopping" name="placeYourOrder">
	            			</a>
	            		</div>
      				</div>
      				
      			<%
      		}
      	%>
</div>
