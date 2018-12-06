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

	double minPrice = (request.getParameter("price-min") == null) ? 0 : Double.parseDouble((request.getParameter("price-min")));
	double maxPrice = (request.getParameter("price-max") == null) ? 200 : Double.parseDouble((request.getParameter("price-max")));
	salesItems =(ArrayList)DBAccess.SP_GetInventory(isFood,isAccessories,isCare,minPrice,maxPrice);
%>

                        <div class="Content-header" id="ShopContent">

                            <form class="Filters" ACTION="shopping.do" METHOD="POST">
                                <div id="FilterArea">
                                    <label for="amount">Price range:</label>
                                    <input type="text" id="amount" value="<%="$"+minPrice+" - $"+maxPrice%>"readonly>
                                    <div id="slider-range"></div>
                                    <input type="hidden" value="<%=minPrice %>" name="price-min" id="price-min" />
                                    <input type="hidden" value="<%=maxPrice%>" name="price-max" id="price-max" />
                                    <input type="checkbox" name="Food" id="Food" value="Food" <%=(isFood==1 ? "checked" : "")%>>
                                    <label for="amount">Food</label>
                                    <input type="checkbox" name="Accessories" id="Accessories" value="Accessories" <%=(isAccessories==1 ? "checked" : "")%>> 
									<label for="amount">Accessories</label>
                                    <input type="checkbox" name="CareProducts" id="CareProducts" value="CareProducts" <%=(isCare==1 ? "checked" : "")%>>
                                 <label for="amount">Care Products</label>	
                                </div>
                                <input type="submit" onClick="" value="Filter" class="tButton yellowGlow">
                            </form>
                            <div class="ShopArea">
                                <%
       			for(SalesItem item:salesItems){
       				%>

                                    <div class="parentHover salesItemShop" onmousehover="magImageInside(this)">
                                        <div class="salesImage"><img class="hovImg childMag back" src="images/products/<%=item.getImagePath()%>"></div>
                                        <div class="salesName">
                                            <h1><%=item.getItemName()%></h1></div>
                                        <div class="middle tButton uButton">
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

       		%>
                            </div>

                        </div>