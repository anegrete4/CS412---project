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



<%session.removeAttribute("myCart"); %>

<div id="confirmLetterBody">
<div class="textRow">
	<div id="rightAlignTextBox">
		<p><strong>Gary's Glorious Groundhogs</strong></strong></p>
		<p>5600 N St. Louis St.</p>
		<p>Chicago IL-60625</p>
		<p>Phone: 773-123-1243</p>
		<p>E-Mail: office@ggg.com</p>
	</div>
</div>

	<div id="leftAlignText"><h2>Order confirmation</h2></div>
<div id="leftAlignTextBox">
<p>Order #: <%=Helper.getRandomOrderNo() %></p><p> Customer Name: <%=session.getAttribute("custName") %></p><p>Date:<%=Helper.getFormattedDate() %></p>
</div>
<div id="leftAlignTextInfo">
	<p id="greetings"> Dear valued customer,</p>
	<p id="letterText1">Thank you for your order! This is confirmation that we have received your order as shown below. 
	Please allow us 3 to 5 business days to deliver.</p>
</div>
	

	<table id="confirmTable">
		<tbody>
		<tr>
			<th>Item Name</th><th>Unit Price</th><th>Quantity</th><th>Total</th>
		</tr>
		<% 
      			Enumeration<CartItem> e=myCart.getCartItems();
      			while(e.hasMoreElements()){
      				CartItem i=(CartItem)e.nextElement();
      				%>
		
						<tr>
							<td><%=i.getItemName() %></td>
							<td class="rightAlign"><%=Helper.getFormattedAmount(i.getItemPrice()) %></td>
							<td class="rightAlign"><%=i.getItemCount() %></td>
							<td class="rightAlign"><%=Helper.getFormattedAmount(i.getItemPrice()*i.getItemCount())%></td>
						</tr>
			<%
      			}
      		
      		%>
			
			<tr class="lineRow"><td colSpan="4"></td></tr>
		<tr class="subTotalRow">
			<td colSpan="3" class="rightPadding">Subtotal</td><td class="rightAlign"><%=Helper.getFormattedAmount(myCart.getTotalBeforeTax()) %></td>
		</tr>
		<tr class="taxRow">
		<td colSpan="3" class="rightPadding">Tax(<%=myCart.getTaxPercent()%>)</td><td class="rightAlign"><%=Helper.getFormattedAmount(myCart.getTax()) %></td>
		
		</tr>
		<tr class="totalRow" class="rightPadding">
		<td colSpan="3" class="total">Total</td><td class="rightAlign total"><%=Helper.getFormattedAmount(myCart.getOrderTotal()) %></td>
			
		</tr>
	</table>
	<div id="letterText2"><p>Questions about your order? Don't hesitate to contact us at office@ggg.com or call us at 773-123-1243. </p></div>
</div>

<%
	myCart.disPose();
	request.getSession().removeAttribute("myCart");
%>