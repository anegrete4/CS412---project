<%@ page import="java.util.*" %> 
<%@ page import="model.FrequentlyAskedQuestion" %>
<%@ page import="database.DBAccess" %>  
<%@ page import="model.SalesItem" %> 
<%@ page import="model.Review" %> 
<%SalesItem item=DBAccess.SP_GetSalesItem(Integer.parseInt(request.getParameter("itemId"))); %>
<%!List<Review> reviews; %>
<%reviews=DBAccess.SP_GetReviews(1);%>
   <form class="popUpForm" ACTION="submitAddToCart.do" METHOD="POST">
      <br>
      <br>
      	<div class="popSalesItemContainer">
      		<div class="sicCol1">
      			<img alt="Image of <%=item.getItemName()%>." src="images/products/<%=item.getImagePath()%>" />
      			<div class="sicPrice">$<%=item.getItemPrice()%></div>
      			<div class="sicStars">Rating:<%=item.getRating() %></div>
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
			    <%session.setAttribute("itemToAdd", item); %>
			    <input type="submit" onClick="" value="Add To Cart" class="hoverTransparentBg sicAddToCart">  
      		</div>
      		<p class="sicItemDescription">Description:<%=item.getItemDescription() %></p>			
      </div>
      <div id="popUpReviews">
      <div class="sicReview">No of reviews:<%=item.getNoOfReviews() %></div>
      <%
      	if(item.getNoOfReviews()>0){
      		for(Review r:reviews){
      			%> <div class="reviewRow">
      				<div class="revUserName"><%=r.getUserName() %></div>
      				<div class="revMessage"><%=r.getReviewMessage() %></div>
      				<div class="revRating"><%=r.getRating() %></div>
      			  </div>
      			<%
      		}
      	}
      %>
      </div>
      		
   </form>