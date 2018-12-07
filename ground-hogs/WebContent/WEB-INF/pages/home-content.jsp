<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
			<div class="button"><a href="x">LEARN MORE</a></div>
			<!-- <p>OR scroll down!</p> -->
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
		<div class="button"><a href="x">Shop Food</a></div>
		</div>
	</div>
	<div class="prodType" id="type2">
		<div id="butcent">
			<div class="button"><a href="x">Shop Accessories</a></div>
		</div>
	</div>
	<div class="prodType" id="type3">
		<div id="butcent">
		<div class="button"><a href="x">Shop Care Products</a></div>
		</div>
	</div>
</div>

<div class="row" id="bestRow">
	<div id="best"><h1>OUR BEST SELLERS</h1></div>
		<div id="prodGrid">			
			<div class="bestGrid"> <img src="images/product1.png" alt="product1">
				<div class="middle">
   					 <div class="button"><a href="x">View Product</a></div>
 				 </div>
			</div>
			<div class="bestGrid"> <img src="images/product1.png" alt="product1"> 
				<div class="middle">
   					<div class="button"><a href="x">View Product</a></div>
 				</div>
			</div>
			<div class="bestGrid"> <img src="images/product1.png" alt="product1"> 
				<div class="middle">
   					<div class="button"><a href="x">View Product</a></div>
 					</div>
				</div>
			<div class="bestGrid"> <img src="images/product1.png" alt="product1"> 
				<div class="middle">
   					<div class="button"><a href="x">View Product</a></div>
 				</div>
			</div>
		</div>
</div>
<div id="shopAll"><div class="button"><a href="x">SHOP ALL</a></div></div>

<!-- WORKSHOP -->
<div class="row" id="workshop">
	<div id="col-1"></div>
	<div id="col-2">
		<article>
			<h2>WORKSHOPS</h2>
			<p>
			Want to take better care of your groundhog? Here at Gary's Glorious Groundhog's we have the right workshops for you &amp; your family. 
			</p>
			<div class="button"><a href="x">LEARN MORE</a></div>
		</article>
	</div>
</div>

<script>showSlides(slideIndex);</script>

