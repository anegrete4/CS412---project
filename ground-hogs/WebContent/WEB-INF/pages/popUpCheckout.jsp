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

   
   
   <form class="popUpForm" ACTION="submitCheckout.do" METHOD="POST">
     
     <div id="popUpCheckoutArea">			
			
		<!-- BEGIN CART INFO -->
		<div id="cartInfo"> 
			<h3 class="cartOrderSummaryH3">My Cart</h3>
			
<div class="cartItemsWrapper maxSize invisibleScrollBg">
   <table>
      <tbody class="cartItems" >
         <% 
            Enumeration<CartItem> e=myCart.getCartItems();
            while(e.hasMoreElements()){
            	CartItem i=(CartItem)e.nextElement();
            	%>
         <tr class="itemRow cartProductImage">
            <td rowSpan="6"><a href="<%=i.createHtmlAnchorHref()%>"><img class="clickableImage" src="images/products/<%=i.getImagePath()%>" alt="Product Image"></a></td>
            <td colSpan="2"><span class="cartItemName"><%=i.getItemName() %></span></td>
         </tr>
         <tr class="itemRow">
            <td colSpan="2" class="cartItemRating"><img src="images/icons/<%=Helper.getClassNameForRating(i.getRating()) %>.png" alt="rating"><%=i.getRating() %></td>
         </tr>
         <tr class="itemRow">
            <td class="leftAlign">Unit cost:</td>
            <td class="rightAlign"><%=Helper.getFormattedAmount(i.getItemPrice())%></td>
         </tr>
         <tr class="itemRow">
            <td class="leftAlign">Quantity:</td>
            <td class="rightAlign"><%=i.getItemCount() %></td>
         </tr>
         <tr class="itemRow">
            <td class="leftAlign">Cost for this item:</td>
            <td class="rightAlign"><span class="cartItemTotal"><%=Helper.getFormattedAmount(i.getTotalPrice()) %></span></td>
         </tr>
         <tr class="itemRow">
            <td colSpan="2" class="removeItemButtonWrapper" rowSpan="2">
                  <input type="hidden" value="<%=i.getItemId() %>" name="itemId" />
                  <input type="hidden" value="0" name="quantity" />
                  <input type="hidden" value="popUpCheckout" name="popUpContent" />
                  <input class="tButton redGlow" type="submit" value="Remove this item">  
            </td>
         </tr>
         <tr>
            <td colSpan="3"></td>
         </tr>
         <%
            }
            
            %>
      </tbody>
   </table>
</div>
			

	    </div>
	
		
		<!-- END CART INFO -->
		
		<!-- BEGIN SHIPPMENT INFO -->
		<div id="shippingInfo"> 
			<h3 class="cartOrderSummaryH3">Shipping Information</h3>
			<div id="sectionShipping">
 <input class=" <%=Helper.validate("fname") %>" type="text" name="fname" id="fname" value="<%=Helper.getStoredString("fname") %>" placeholder="First name" >
 <input class=" <%=Helper.validate("lname") %>" type="text" name="lname" id="lname" value="<%=Helper.getStoredString("lname") %>" placeholder="Last name">
 <div class="line"></div>
 <input class=" <%=Helper.validate("saddress") %>" type="text" name="saddress" id="saddress" value="<%=Helper.getStoredString("saddress") %>" placeholder="Street Address: 123 Main St." >
 <input class=" <%=Helper.validate("saddress2") %>" type="text" name="saddress2" id="saddress2" value="<%=Helper.getStoredString("saddress2") %>" placeholder="Appartment, House, Unit">
 <input class="city <%=Helper.validate("city") %>" type=text name="city" id="city" value="<%=Helper.getStoredString("city") %>" placeholder="City" >
 <input class="state <%=Helper.validate("state") %>" type="text" name="state" id="state" value="<%=Helper.getStoredString("state") %>" placeholder="State">
 <input class="zip <%=Helper.validate("zip") %>" type="text" name="zip" id="zip" value="<%=Helper.getStoredString("zip") %>" placeholder="Zip" >
 <div class="line"></div>
 <input class=" <%=Helper.validate("email") %>" type="text" name="email" id="email" value="<%=Helper.getStoredString("email") %>" placeholder="Email: sample@sample.com" >
 <input class=" <%=Helper.validate("vemail") %>" type="text" name="vemail" id="vemail" value="<%=Helper.getStoredString("vemail") %>" placeholder="Verify the email">
</div>

		</div>
		
		
		<!-- BEGIN PAYMENT INFO -->
		
		<div id="paymentInfo"> 
			<h3 class="cartOrderSummaryH3">Payment Information</h3> 
			<div id="sectionBilling">
<input class=" <%=Helper.validate("cname") %>" type="text" name="cname" id="cname" value="<%=Helper.getStoredString("cname") %>" placeholder="Name on the card" >
 
 <input class=" <%=Helper.validate("cardno") %>" type="text" name="cardno" id="cardno" value="<%=Helper.getStoredString("cardno") %>" placeholder="Debit/Credit card no" >
 <input class="month <%=Helper.validate("expmonth") %>" type="text" name="expmonth" id="expmonth" value="<%=Helper.getStoredString("expmonth") %>" placeholder="Month">
 <input class="expyear <%=Helper.validate("expyear") %>" type="text" name="expyear" id="expyear" value="<%=Helper.getStoredString("expyear") %>" placeholder="YYYY">
 <input class="csv <%=Helper.validate("csv") %>" type="text" name="csv" id="csv" value="<%=Helper.getStoredString("csv") %>" placeholder="CSV">
 <input class=" <%=Helper.validate("issamebilling") %>" type="checkbox" name="issamebilling" id="issamebilling" value="issamebilling"  <%=Helper.isChecked("issamebilling") %>>
 <label for="issamebilling">Billing address is same as shipping.</label>

 <input class=" <%=Helper.validate("bsaddress") %>" type="text" name="bsaddress" id="sbaddress" value="<%=Helper.getStoredString("bsaddress") %>" placeholder="Street Address: 123 Main St." >
 <input class=" <%=Helper.validate("bsaddress2") %>" type="text" name="bsaddress2" id="bsaddress2" value="<%=Helper.getStoredString("bsaddress2") %>" placeholder="Appartment, House, Unit">
 <input class="city <%=Helper.validate("bcity") %>" type=text name="cbity" id="bcity" value="<%=Helper.getStoredString("bcity") %>" placeholder="City" >
 <input class="state <%=Helper.validate("bstate") %>" type="text" name="bstate" id="bstate" value="<%=Helper.getStoredString("bstate") %>" placeholder="State">
 <input class="zip <%=Helper.validate("bzip") %>" type="text" name="bzip" id="bzip" value="<%=Helper.getStoredString("bzip") %>" placeholder="Zip" >
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
	            		   		<input class="tButton yellowGlow" onClick="toggleCart('false')" title="Continue Shopping" value="Continue shopping" name="placeYourOrder">
	            			</a>
	            	</td>
	            	<td>
	                <form class="InputForm" ACTION="popUpDisplay.do" METHOD="POST"> 
	                	<input class="tButton greenGlow" type="submit" onClick="toggleCart('false')" value="Place your order">  
	                 	<input type="hidden" value="Checkout" name="popUpTitle" />
	                    <input type="hidden" value="popUpCheckoutConfirm" name="popUpContent" />
	        		</form>
	          	</td>
	            </tr>
	        </tbody>
	      </table>
	    </div>
	  
		</div>
		
	</div>
		
      		
</form>