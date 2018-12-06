    
<%@ page import="java.util.*" %> 
<%@ page import="model.SalesItem" %>
<%@ page import="database.DBAccess" %>   
<%@ page import="utility.Helper" %>   
<%!ArrayList<SalesItem> salesItems=new ArrayList<SalesItem>();%>
<% 	
	int isFood=request.getParameter("Food")!=null?1:0;
	int isAccessories=request.getParameter("Accessories")!=null?1:0;
	int isCare=request.getParameter("CareProducts")!=null?1:0;
	if(session.getAttribute("loadedFirstTimeShoppingPage")==null){
		isFood=1;
		isAccessories=1;
		isCare=1;
		session.setAttribute("loadedFirstTimeShoppingPage","false");
	}
	else if(isFood+isAccessories+isCare==0){
		if(session.getAttribute("isFood")!=null && session.getAttribute("isAccessories")!=null&&session.getAttribute("isCare")!=null){
			isFood=(Integer)session.getAttribute("isFood");
			isAccessories=(Integer)session.getAttribute("isAccessories");
			isCare=(Integer)session.getAttribute("isCare");
		}
	}
	session.setAttribute("isFood",isFood);
	session.setAttribute("isAccessories",isAccessories);
	session.setAttribute("isCare",isCare);

	//int isFood = (request.getParameter("Food") != null) && ((request.getParameter("Food")).equalsIgnoreCase("Food")) ? 1:0;
	//int isAccessories = (request.getParameter("Accessories") != null) && ((request.getParameter("Accessories")).equalsIgnoreCase("Accessories")) ? 1:0;
	//int isCare = (request.getParameter("CareProducts") != null) && ((request.getParameter("CareProducts")).equalsIgnoreCase("CareProducts")) ? 1:0;
	double minPrice = (request.getParameter("price-min") == null) ? 0 : Double.parseDouble((request.getParameter("price-min")));
	double maxPrice = (request.getParameter("price-max") == null) ? 200 : Double.parseDouble((request.getParameter("price-max")));
	salesItems =(ArrayList)DBAccess.SP_GetInventory(isFood,isAccessories,isCare,minPrice,maxPrice);
%>

<div class="Content-header" id="ShopContent">
       <h2>Shop Here</h2>
 <form class="Filters" ACTION="shopping.do" METHOD="POST">
 	<div id="checkBoxes">
 	
 		<input type="checkbox" name="Food" value="Food" <%=(isFood == 1 ? "checked" : "")%>> Food<br>
		<input type="checkbox" name="Accessories" value="Accessories" <%=(isAccessories == 1 ? "checked" : "")%>> Accessories<br>
		<input type="checkbox" name="CareProducts" value="CareProducts" <%=(isCare == 1 ? "checked" : "")%>>Care Products<br>
 	
 	</div> 
 	<div data-role="rangeslider">
        <label for="price-min">Price:</label>
        <input type="range" name="price-min" id="price-min" value="<%= minPrice %>" min="0" max="200">
        <label for="price-max">Price:</label>
        <input type="range" name="price-max" id="price-max" value="<%= maxPrice %>" min="0" max="200">
      </div>
      <input type="submit" onClick="" value="Filter" class="tButton">
 </form>      
       <div class="ShopArea">
       		<%
       			for(SalesItem item:salesItems){
       				%> 
       				
	       					<div class="salesItemShop" onmousehover="magImageInside(this)">
	       						<div class="salesImage"><img class="hovImg" src="images/products/<%=item.getImagePath()%>"></div>
	       						<div class="salesName"><h1><%=item.getItemName()%></h1></div>
	       						<div class="middle tButton uButton">
		       						<a href="<%=item.createHtmlAnchorHref() %>">
		       							View Product
		       						</a>
		       					</div>
	       						<div class="salesPrice"><h2><%=Helper.getFormattedAmount(item.getItemPrice())%></h2></div>
	       						<div class="cartItemRating"><img src="images/icons/<%=Helper.getClassNameForRating(item.getRating()) %>.png" alt="rating"><%=item.getRating() %></div>
	       						
	       					</div>	
       					
       				<%
       			}
       		
       		
       		%>
       </div>
          

</div>