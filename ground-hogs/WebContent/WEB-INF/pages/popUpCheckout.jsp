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
	Boolean isSameBilling=request.getParameter("isSameBilling")!=null;
	
%>

<%
	if(!isCartEmpty){
		
%>

   <form class="popUpForm" ACTION="submitCheckout.do" METHOD="POST">
     
     <div id="popUpCheckoutArea" class="invisibleScrollBg">			
			
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
            <td rowSpan="5"><img src="images/products/<%=i.getImagePath()%>" alt="Product Image"></td>
            <td colSpan="2"><span class="cartItemName checkoutLeft cartItemNameCheckout"><%=i.getItemName() %></span></td>
         </tr>
         <tr class="itemRow">
            <td colSpan="2" class="cartItemRating checkoutLeft"><img src="images/icons/<%=Helper.getClassNameForRating(i.getRating()) %>.png" alt="rating"><%=i.getRating() %></td>
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
  <select name="state" id="state" class="state <%=Helper.validate("state") %>">
 		<option SELECTED value="">Choose State</option>
						<option  value="AL">Alabama</option>
						<option  value="AK">Alaska</option>
						<option  value="AZ">Arizona</option>
						<option  value="AR">Arkansas</option>
						<option  value="CA">California</option>
						<option  value="CO">Colorado</option>
						<option  value="CT">Connecticut</option>
						<option  value="DE">Delaware</option>
						<option  value="DC">District Of Columbia</option>
						<option  value="FL">Florida</option>
						<option  value="GA">Georgia</option>
						<option  value="HI">Hawaii</option>
						<option  value="ID">Idaho</option>
						<option  value="IL">Illinois</option>
						<option  value="IN">Indiana</option>
						<option  value="IA">Iowa</option>
						<option  value="KS">Kansas</option>
						<option  value="KY">Kentucky</option>
						<option  value="LA">Louisiana</option>
						<option  value="ME">Maine</option>
						<option  value="MD">Maryland</option>
						<option  value="MA">Massachusetts</option>
						<option  value="MI">Michigan</option>
						<option  value="MN">Minnesota</option>
						<option  value="MS">Mississippi</option>
						<option  value="MO">Missouri</option>
						<option  value="MT">Montana</option>
						<option  value="NE">Nebraska</option>
						<option  value="NV">Nevada</option>
						<option  value="NH">New Hampshire</option>
						<option  value="NJ">New Jersey</option>
						<option  value="NM">New Mexico</option>
						<option  value="NY">New York</option>
						<option  value="NC">North Carolina</option>
						<option  value="ND">North Dakota</option>
						<option  value="OH">Ohio</option>
						<option  value="OK">Oklahoma</option>
						<option  value="OR">Oregon</option>
						<option  value="PA">Pennsylvania</option>
						<option  value="RI">Rhode Island</option>
						<option  value="SC">South Carolina</option>
						<option  value="SD">South Dakota</option>
						<option  value="TN">Tennessee</option>
						<option  value="TX">Texas</option>
						<option  value="UT">Utah</option>
						<option  value="VT">Vermont</option>
						<option  value="VA">Virginia</option>
						<option  value="WA">Washington</option>
						<option  value="WV">West Virginia</option>
						<option  value="WI">Wisconsin</option>
						<option  value="WY">Wyoming</option>
					</select>
 
 
 <input class="zip <%=Helper.validate("zip") %>" type="text" name="zip" id="zip" value="<%=Helper.getStoredString("zip") %>" placeholder="Zip" >
 <div class="line"></div>
 <input class=" <%=Helper.validate("email") %>" type="text" name="email" id="email" value="<%=Helper.getStoredString("email") %>" placeholder="Email: sample@sample.com" >
 </div>

		</div>
		
		
		<!-- BEGIN PAYMENT INFO -->
		
		<div id="paymentInfo"> 
			<h3 class="cartOrderSummaryH3">Payment Information</h3> 
			<div id="sectionBilling">
<input class=" <%=Helper.validate("cname") %>" type="text" name="cname" id="cname" value="<%=Helper.getStoredString("cname") %>" placeholder="Name on the card" >
 <input class=" <%=Helper.validate("cardno") %>" type="text" name="cardno" id="cardno" value="<%=Helper.getStoredString("cardno") %>" placeholder="Debit/Credit card no" >
 <span class="checkoutInlineGroup adjustMarginTopCheckoutSelect">
    <select name="expmonth" id="expmonth" class="month <%=Helper.validate("expmonth") %>">
       	<option SELECTED value="">Exp. Month</option>
		<option  value="1">01 - Jan</option>
		<option  value="2">02 - Feb</option>
		<option  value="3">03 - Mar</option>
		<option  value="4">04 - Apr</option>
		<option  value="5">05 - May</option>
		<option  value="6">06 - Jun</option>
		<option  value="7">07 - July</option>
		<option  value="8">08 - Aug</option>
		<option  value="9">09 - Sep</option>
		<option  value="10">10 - Oct</option>
		<option  value="11">11 - Nov</option>
		<option  value="12">12 - Dec</option>
	 </select>
	 <select name="expyear" id="expyear" class="expyear <%=Helper.validate("expyear") %>">
       	<option SELECTED value="">Exp. Year</option>
		<option  value="2018">2018</option>
		<option  value="2019">2019</option>
		<option  value="2020">2020</option>
		<option  value="2021">2021</option>
		<option  value="2022">2022</option>
		<option  value="2023">2023</option>
		<option  value="2024">2024</option>
		<option  value="2025">2025</option>
		<option  value="2026">2026</option>
		<option  value="2027">2027</option>
		<option  value="2029">2028</option>
		<option  value="2030">2029</option>
	 </select>
 <input class="csv <%=Helper.validate("csv") %>" type="text" name="csv" id="csv" value="<%=Helper.getStoredString("csv") %>" placeholder="CSV">
</span>
 
 <span class="checkoutInlineGroup adjustCheckbox">
 	<input style="cursor:pointer;" type="checkbox" name="isSameBilling" id="isSameBilling" <%=isSameBilling?"checked":"" %>>
 	<label for="isSameBilling" style="cursor:pointer;">Billing address is same as shipping.</label>
</span>
<span id="billingAddress">
 <input class=" <%=Helper.validate("baddress") %>" type="text" name="baddress" id="baddress" value="<%=Helper.getStoredString("baddress") %>" placeholder="Street Address: 123 Main St." >
 <input class=" <%=Helper.validate("baddress2") %>" type="text" name="baddress2" id="baddress2" value="<%=Helper.getStoredString("baddress2") %>" placeholder="Appartment, House, Unit">
 <input class="city <%=Helper.validate("bcity") %>" type=text name="bcity" id="bcity" name="bcity" value="<%=Helper.getStoredString("bcity") %>" placeholder="City" >
  <select name="bstate" id="bstate" class="state <%=Helper.validate("bstate") %>">
 		<option SELECTED value="">Choose State</option>
						<option  value="AL">Alabama</option>
						<option  value="AK">Alaska</option>
						<option  value="AZ">Arizona</option>
						<option  value="AR">Arkansas</option>
						<option  value="CA">California</option>
						<option  value="CO">Colorado</option>
						<option  value="CT">Connecticut</option>
						<option  value="DE">Delaware</option>
						<option  value="DC">District Of Columbia</option>
						<option  value="FL">Florida</option>
						<option  value="GA">Georgia</option>
						<option  value="HI">Hawaii</option>
						<option  value="ID">Idaho</option>
						<option  value="IL">Illinois</option>
						<option  value="IN">Indiana</option>
						<option  value="IA">Iowa</option>
						<option  value="KS">Kansas</option>
						<option  value="KY">Kentucky</option>
						<option  value="LA">Louisiana</option>
						<option  value="ME">Maine</option>
						<option  value="MD">Maryland</option>
						<option  value="MA">Massachusetts</option>
						<option  value="MI">Michigan</option>
						<option  value="MN">Minnesota</option>
						<option  value="MS">Mississippi</option>
						<option  value="MO">Missouri</option>
						<option  value="MT">Montana</option>
						<option  value="NE">Nebraska</option>
						<option  value="NV">Nevada</option>
						<option  value="NH">New Hampshire</option>
						<option  value="NJ">New Jersey</option>
						<option  value="NM">New Mexico</option>
						<option  value="NY">New York</option>
						<option  value="NC">North Carolina</option>
						<option  value="ND">North Dakota</option>
						<option  value="OH">Ohio</option>
						<option  value="OK">Oklahoma</option>
						<option  value="OR">Oregon</option>
						<option  value="PA">Pennsylvania</option>
						<option  value="RI">Rhode Island</option>
						<option  value="SC">South Carolina</option>
						<option  value="SD">South Dakota</option>
						<option  value="TN">Tennessee</option>
						<option  value="TX">Texas</option>
						<option  value="UT">Utah</option>
						<option  value="VT">Vermont</option>
						<option  value="VA">Virginia</option>
						<option  value="WA">Washington</option>
						<option  value="WV">West Virginia</option>
						<option  value="WI">Wisconsin</option>
						<option  value="WY">Wyoming</option>
					</select>
 <input class="zip <%=Helper.validate("bzip") %>" type="text" name="bzip" id="bzip" value="<%=Helper.getStoredString("bzip") %>" placeholder="Zip" >
</span>
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
	<script>
        	document.getElementById('state').value = '<%=Helper.getStoredString("state") %>';
        	document.getElementById('bstate').value = '<%=Helper.getStoredString("bstate") %>';
        	document.getElementById('expmonth').value = '<%=Helper.getStoredString("expmonth") %>';
        	document.getElementById('expyear').value = '<%=Helper.getStoredString("expyear") %>';
       </script>
      		
</form>
<%
	}
		else{
      			%>
      				<div class="EmptyCartMessage">
      					<h3 class="EmptyCartMessageH3">Your cart is empty!</h3>
      					<div class="continueShoppingBtnWrapper buttonEmpty">
      						<a href="http://localhost:8080/ground-hogs/Shopping.jsp">
	            		   	  <input class="tButton startShoppingCenter yellowGlow btnMiddle" onClick="toggleCart('false')" title="Continue Shopping"  value="Start shopping" name="placeYourOrder">
	            			</a>
	            		</div>
      				</div>
      				
      			<%
		}
%>