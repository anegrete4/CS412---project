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
<div class="slideshow">
	<div class="slide fade">
		<img src="images/home/bannerHome2.jpg">
	</div>
	
	<div class="slide fade">
		<img src="images/home/prodType2.jpg">
	</div>

	<div class="slide fade">
		<img src="images/home/petGH2.png">
	</div>


	
			<div id="bannerText">
		<div id="bannerBox">

				<h1>GARY'S GLORIOUS GROUNDHOGS</h1>
				<p>If you're all about these precious little creatures, you're in the right place.</p>
                 <div class="magButtonWrapper fitMe">
                 	<a href="AboutUs.jsp"><div class="magButton">Learn More</div></a>
                 </div>
                 <!--  
				<div class="aboutMiddle">
					<a href="#catRow" class="DownArrow nextSection"></a>
				</div>
				-->
			</div>
			</div>
		
		
	
	
	

	<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	<a class="next" onclick="plusSlides(1)">&#10095;</a>

	<!-- Dots -->
  	<div id="dotid" style="text-align:center">
		<span class="dot" onclick="currentSlide(1)"></span> 
		<span class="dot" onclick="currentSlide(2)"></span> 
		<span class="dot" onclick="currentSlide(3)"></span> 
	</div>
</div>

<!-- PRODUCTS -->
<div id="catRow">
	<div class="prodType" id="type1">
		<div id="butcent">
		
		<form class="Filters" ACTION="shopping.do" METHOD="POST">
		 	<input type="hidden" name="Food" checked />
         	<input type="submit" onClick="" value="Shop Food" class="button fixMe">
		</form>
		
		</div>
	</div>
	<div class="prodType" id="type2">
		<div id="butcent">
			<form class="Filters" ACTION="shopping.do" METHOD="POST">
		 	<input type="hidden" name="Accessories" checked />
         		<input type="submit" onClick="" value="Shop Accessories" class="button fixMe">
		</form>
		</div>
	</div>
	<div class="prodType" id="type3">
		<div id="butcent">
		<form class="Filters" ACTION="shopping.do" METHOD="POST">
		 	<input type="hidden" name="CareProducts" checked />
         		<input type="submit" onClick="" value="Shop Care Products" class="button fixMe">
         	</form>
		</div>
	</div>
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

	<div class="shopAllMiddle">
		<div class="newMiddle">
	      	<a href="http://localhost:8080/ground-hogs/Shopping.jsp">
		    <input class="tButton" onClick="toggleCart('false')" title="Continue Shopping"  value="Shop All" name="placeYourOrder">
		  </a>
		</div>
	</div>

<!-- WORKSHOP -->
<div class="row" id="workshop">
<div id="col-1"></div>
	
	<div class="Media-Container row controlMe" id="mission">
			<div class="column">
				<h1>WORKSHOPS</h1>
				<p>
			Want to take better care of your groundhog? Here at Gary's Glorious Groundhog's we have the right workshops for you &amp; your family. 
			</div>
		
		</div>
		<div class="shopAllMiddle bgWhite">
		<div class="newMiddle newMiddle2">
	      	<a href="http://localhost:8080/ground-hogs/Workshop.jsp">
		    <input class="tButton" onClick="toggleCart('false')" title="Continue Shopping"  value="LEARN MORE" name="placeYourOrder">
		  </a>
		</div>
	</div>
	<!-- 
	<div id="col-2">
		<article>
			<h2>WORKSHOPS</h2>
			<p>
			Want to take better care of your groundhog? Here at Gary's Glorious Groundhog's we have the right workshops for you &amp; your family. 
			</p>
			<div class="button"><a href="x">LEARN MORE</a></div>
		</article>
	</div> -->
</div>

<script>showSlides(slideIndex);</script>

