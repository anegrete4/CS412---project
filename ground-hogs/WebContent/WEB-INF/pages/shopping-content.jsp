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

	int minPrice = (request.getParameter("price-min") == null) ? 0 : Integer.parseInt((request.getParameter("price-min")));
	int maxPrice = (request.getParameter("price-max") == null) ? 84 : Integer.parseInt((request.getParameter("price-max")));
	salesItems =(ArrayList)DBAccess.SP_GetInventory(isFood,isAccessories,isCare,minPrice,maxPrice);
%>

                        <div class="Content-header" id="ShopContent">
                        <div class="secondHeader">
                        
                               <div class="filterTableAttributes" id="filterContent">
                               	 <form class="Filters" ACTION="shopping.do" METHOD="POST">
                                    <table id="filterTable">
                                   	<tbody>
                                   		<tr>
                                   			<td colSpan="3">
                                   			    <div class="hideWhenNotHover" id="slider-range"></div>
                                   			</td>
                                   			
                                   		</tr>
                                   		<tr>
                                   			<td>
                                   				<input type="text" id="minPrice" class="hideWhenNotHover" value="<%="Minimum: $"+minPrice%>"readonly>
                                   			</td>
                                   			<td>
                                   			</td>
                                   			<td>
                                   				<input type="text" id="maxPrice" class="hideWhenNotHover" value="<%="Maximum: $"+maxPrice%>"readonly>
                                   			</td>
                           
                                   		</tr>
                                   		<tr>
                                   			<td>
                                   			     <label class="hideWhenNotHover" for="Food">Food</label>	
                                   				 <input type="checkbox" class="hideWhenNotHover" name="Food" id="Food" value="Food" <%=(isFood==1 ? "checked" : "")%>>
                                   			</td>
                                   			<td>
                                   				<label class="hideWhenNotHover" for="Accessories">Accessories</label>
                               					<input type="checkbox" class="hideWhenNotHover" name="Accessories" id="Accessories" value="Accessories" <%=(isAccessories==1 ? "checked" : "")%>> 
                                   			</td>
                                   			<td>
                                   			    <label class="hideWhenNotHover" for="CareProducts">Care Products</label>
                                  				<input type="checkbox"class="hideWhenNotHover"  name="CareProducts" id="CareProducts" value="CareProducts" <%=(isCare==1 ? "checked" : "")%>>
                                   			</td>
                                   		</tr>
           								<tr>
           							
           										<td colSpan="3">
                                   						<input type="submit" onClick="" value="Apply Filter" class="tButton filterButton">
                                   			</td>
           								
           								</tr>
                                   	</tbody>
                                   </table>
                                    <input type="hidden" value="<%=minPrice %>" name="price-min" id="price-min" />
                                    <input type="hidden" value="<%=maxPrice%>" name="price-max" id="price-max" />
                                      </form>
                                </div>
                                
                          </div>
                            <div class="ShopArea">
                                <%
       			for(SalesItem item:salesItems){
       				%>

                                    <div class="parentHover salesItemShop" onmousehover="magImageInside(this)">
                                        <div class="salesImage"><img class="hovImg childMag back" src="images/products/<%=item.getImagePath()%>"></div>
                                        <div class="salesName">
                                            <h1><%=item.getItemName()%></h1></div>
                                        <div class="viewProduct tButton uButton">
                                            <a href="<%=item.createHtmlAnchorHref() %>">
		       							View Product
		       						</a>
                                        </div>
                                        <div class="salesPrice front">
                                            <h2><%=Helper.getFormattedAmount(item.getItemPrice())%></h2></div>
                                        <div class="cartItemRating front"><img src="images/icons/<%=Helper.getClassNameForRating(item.getRating()) %>.png" alt="rating">
                                            <%=item.getRating() %>
                                        </div>

                                    </div>

                                    <%
       			}
                if(salesItems.isEmpty()){
                	%>
                	<div class="errorMiddleInShopMage">
                		<h3>Sorry we could not find any items in this price range.</h3>
                	</div>
                	<%
                }

       		%>
                            </div>

                        </div>