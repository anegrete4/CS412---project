<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="java.util.*" %>
 <%@ page import="model.SalesItem" %>
 <%@ page import="database.DBAccess" %>
 <%@ page import="utility.Helper" %>
 <%!ArrayList<SalesItem> salesItems=new ArrayList<SalesItem>();%>
 <%
 salesItems =(ArrayList)DBAccess.SP_GetInventory(1,1,1,0,400);
 %>

	<div class="wrapper">
		<div class="section parallax about">
			<header class="aboutHeader">
				<h1>GET TO KNOW US!</h1>
				<p>home of the glorious groundhogs</p>
				<div class="aboutMiddle">
					<a href="#mission" class="DownArrow nextSection"></a>
				</div>
			</header>
		</div>

		<div class="Media-Container row" id="mission">
			<div class="column adjustMoveUp">
				<h1>OUR MISSION</h1>
				<p>Our groundhog counselors are dedicated to matching your pet with the right products and 
				meeting the needs of both you and your little one. We are more than delighted to dedicate our time to enhance your knowledge and enjoyment of the <strong>human-animal</strong> bond.</p>
			</div>
			<div class="column adjustMoveUp"> 
				<a><img src="images/diamond.gif" alt="headings"></a>
			</div>
		</div>

		<div class="Media-Container">
			<div class="row" id="media1">
				<div class="column adjustMoveUp"> 
					<a><img src="images/fam2.jpeg" alt="Lady with groundhog"></a>
				</div>
				<div class="column adjustMoveUp">
					<h1>INNOVATIVE</h1>
					<p>Our sole purpose has been to nourish and nurture groundhogs everywhere for more more than 20 years. So your pets live the fullest, happiest, healthiest lives possible. </p>
				</div>
			</div>

			<div class="row" id="media2">
				<div class="column adjustMoveUp">
					<h1>FAMILY-ORIENTED</h1>
					<p>We are committed to not only provide the best care for your groundhog, but also making your relationship with your pet the best that it can be. We accomplish this through workshops and trainings all year round for your family.</p>
				</div>
				<div class="column adjustMoveUp"> 
					<a><img src="images/fam.jpg" alt="Girl with groundhog pet."></a>
				</div>
			</div>
		
			<div class="row" id="media3">
				<div class="column adjustMoveUp"> 
					<a><img src="images/map.png" alt="World Impact"></a>
				</div>
				<div class="column adjustMoveUp adjustwidthGI">
					<h1>GLOBAL IMPACT</h1>
					<p>Our online store has made our products available all across the world! In fact, 70%+ of our workshops are in high demand. And we have supported more than 5,600 families and their groundhogs. </p>
				</div>
			</div>

			<div class="row" id="media4">
				<div class="column adjustMoveUp">
					<h1>WELL-ESTABLISHED</h1>
					<p class="adjustParaSizeAboutUs">We have built our reputation since 1997, helping hundreds of families take care of their 
					groundhogs at home. Our store has been in this location for over 20 years providing 
					the best products for groundhogs in the North Park and surrounding communities! </p>
				</div>
				<div class="column adjustMoveUp adjustwidthGINext"> 
					<a><img src="images/history.GIF" alt="History Photo"></a>
				</div>
			</div>	
		</div>
		
		<div class="parallax quoteHeader">
			<!-- <a><img src="images/Incheon.jpg" alt="Quote Banner"></a> -->
		</div>

		<div class="Media-Container row adjustHeightAbtUsMedia" id="bestRow">
			<div id="best" class="adjustMoveUp"><h1>OUR BEST SELLERS</h1></div>
				<div id="prodGrid" class="abtUsHeightAdjust">	
				   <%
				   int i=0;
       			for(SalesItem item:salesItems){
       				i++;
       				if(i==5)break;
       				%> 
       				

                                    <div class="parentHover salesItemShop adjustMoveUpAbtUsPage" onmousehover="magImageInside(this)">
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

       		%>
						
				</div>
		</div>
	</div>