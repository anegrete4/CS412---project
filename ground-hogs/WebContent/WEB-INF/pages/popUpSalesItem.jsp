<%@ page import="java.util.*" %> 
<%@ page import="model.FrequentlyAskedQuestion" %>
<%@ page import="database.DBAccess" %>  
<%@ page import="model.SalesItem" %> 
<%
	SalesItem item=DBAccess.SP_GetSalesItem(Integer.parseInt(request.getParameter("itemId")));

%>
   <form class="popUpForm" ACTION="submitQuickQuestion.do" METHOD="POST">
      <br>
      <br>
      	<div class="popSalesItemContainer">
      		<div class="sicCol1">
      			<img alt="Image of <%=item.getItemName()%>." src="images/products/<%=item.getImagePath()%>" />
      			<div class="sicPrice">$<%=item.getItemPrice()%></div>
      		</div>
      		<div class="sicCol2">
      			<label for="quantity" class="sicLabel">Quantity: </label>
      			<select name="quantity" id="quantity" class="sicQuantity">
			         <option value="1">1</option>
			         <option value="2">2</option>
			         <option value="3">3</option>
			         <option value="4">4</option>
			         <option value="5">5</option>
			    </select>
			    <input type="submit" onClick="" value="Add To Cart" class="hoverTransparentBg sicAddToCart">  
      		</div>
      		<p class="sicItemDescription">Description:<%=item.getItemDescription() %></p>
      			
      </div>
      		
   </form>