<%@ page import="java.util.*" %> 
<%@ page import="model.FrequentlyAskedQuestion" %>
<%@ page import="database.DBAccess" %>  
<%@ page import="model.SalesItem" %> 
<%@ page import="model.Review" %> 
<%@ page import="utility.Helper" %> 
<%SalesItem item=DBAccess.SP_GetSalesItem(Integer.parseInt(request.getParameter("itemId"))); %>
<%!List<Review> reviews; %>
<%reviews=DBAccess.SP_GetReviews(1);%>
   <form class="popUpForm" ACTION="submitAddToCart.do" METHOD="POST">
      <br>
      <br>
      <table>
      	<tbody>
      				<tr class="itemRow popUpProductImage"><td rowSpan="5"><img src="images/products/<%=item.getImagePath()%>" alt="Product Image"></td>
      				</tr>
      					<tr class="itemRow"><td class="cartItemRating"><img src="images/icons/<%=Helper.getClassNameForRating(item.getRating()) %>.png" alt="rating"><%=item.getRating() %></td>
      					<td class="clickable rightAlign" onClick="toggleDisplayOfElement('reviewsWrapper');"><%="Total "+item.getNoOfReviews()+" review"+(item.getNoOfReviews()!=1?"s":"")%></td></tr>
      					<tr class="itemRow"><td class="leftAlign descriptionRow" colSpan="2"><span class="description">Description:</span><%=" "+item.getItemDescription()%></td></tr>	
      					<tr class="itemRow"><td class="leftAlign">Unit cost:</td><td class="rightAlign unitCostPopUp"><%=Helper.getFormattedAmount(item.getItemPrice())%></td></tr>	
      					<tr class="itemRow" rowSpan="2">
      						<td class="rightAlign">
	      						<select name="quantity" id="quantity" class="ddBoxQty">
							         <option value="1">1</option>
							         <option value="2">2</option>
							         <option value="3">3</option>
							         <option value="4">4</option>
							         <option value="5">5</option>
						    	</select>
						    </td>
						    <td class="leftAlign paddingTop">
						    		<%session.setAttribute("itemToAdd", item); %>
			    					<input type="submit" onClick="" value="Add To Cart" class="tButton">
						    </td>
						    </tr>
						    <tr>
						    	<td colSpan="3" class="reviewArea disableTextSelection"><div class="tButton showHide" 
								onclick="toggleDisplayOfElement('reviewsWrapper');"
								>Show/Hide review(s)</div>
						    		<div class="invisibleScrollBg"id="reviewsWrapper">
						    			<table><tbody>
						    				<%
							    				if(item.getNoOfReviews()>0){
							    		      		for(Review r:reviews){
							    		      			%> 
							    		      			<tr>
							    		      				<td class="reviewerName leftAlign"><%=r.getUserName()%></td>
							    		      				<td class="cartItemRating rightAlign"><img src="images/icons/<%=Helper.getClassNameForRating(r.getRating()+0.0) %>.png" alt="rating"><%=r.getRating() %></td>
							    		      			</tr>
							    		      			<tr class="bottomBorder"><td class="reviewMsg" colSpan="2"><%=r.getReviewMessage() %></td></tr>
							    		      			<%
							    		      		}
							    		      	}
							    				else{
							    					 %>	
							    					 	<tr class="noReviews"><br><br><br><span class="sorryMsg">Sorry! there are no reviews for this item.</span></td></tr>
							    					 <%
							    				}
						    				%>
						    			
						    			</tbody></table>
						    		</div>
						    	</td>
						    </tr>
		</tbody>
      </table>
      
      		
   </form>