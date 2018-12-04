    
<%@ page import="java.util.*" %> 
<%@ page import="model.SalesItem" %>
<%@ page import="database.DBAccess" %>     
<%!ArrayList<SalesItem> salesItems=new ArrayList<SalesItem>();%>
<% 	
	salesItems=(ArrayList)DBAccess.SP_GetInventory(1,1,1,0,999.0);
%>

<div class="Content-header" id="FAQContent">
       <h2>Shop Here</h2>
       <div class="ShopArea">
       		<%
       			for(SalesItem item:salesItems){
       				%> 
	       					<div class="salesItem">
	       						<div class="salesImage"><img src="images/products/<%=item.getImagePath()%>"></div>
	       						<div class="salesName"><h1><%=item.getItemName()%></h1></div>
	       						<div class="salesPrice"><h2>$<%=item.getItemPrice()%></h2></div>
	       						<div class="stars"><p>Rating: <%=item.getRating() %><p></div>
	       						<div class="stars"><p>No of reviews: <%=item.getNoOfReviews() %><p></div>
	       					</div>	
       					<a href="<%=item.createHtmlAnchorHref() %>">Add To Cart</a>
       				<%
       			}
       		
       		
       		%>
       </div>
          

</div>