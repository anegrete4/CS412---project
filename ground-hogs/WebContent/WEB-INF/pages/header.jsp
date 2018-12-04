<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ page import="java.util.*" %> 
<%@ page import="model.Cart" %>  
<%@ page import="model.CartItem" %> 
<%!Enumeration<CartItem> cartItems;%>
<%!Cart myCart=new Cart();%>
<% 	
	if(request.getSession().getAttribute("myCart")!=null){
		myCart=(Cart)request.getSession().getAttribute("myCart");
	}
%>

<div class="navbar">
	<!--  Home  -->
  <div class="dropdown">
    <button id="home-content"  class="dropbtn hoverTransparentBg">
    	<a href="index.jsp"class="disableTextSelection" class="DropDown">
    	Home &nbsp; <i class="fa fa-caret-down"></i></a>
    </button>
    <div class="dropdown-content">
      <a href="index.jsp" >Home</a>
      <a href="index.jsp#link1" >Link1</a>
      <a href="index.jsp#link2" >Link2</a>
    </div>
  </div> 
  <!-- END -->
  
  <!--  About Us  -->
  <div class="dropdown">
    <button id="about-us-content"  class="dropbtn hoverTransparentBg">
    	<a href="AboutUs.jsp"class="disableTextSelection" class="DropDown">
    	About Us &nbsp; <i class="fa fa-caret-down"></i></a>
    </button>
    <div class="dropdown-content">
      <a href="AboutUs.jsp" >About Us</a>
      <a href="AboutUs.jsp#mission" > Mission</a>
       <a href="AboutUs.jsp#innovative" >Innovative</a>
       <a href="AboutUs.jsp#familyOriented" >Family Oriented</a>
        <a href="AboutUs.jsp#globalImpact" >Global Impact</a>
         <a href="AboutUs.jsp#wellEstablished" >Well Established</a>
          <a href="AboutUs.jsp#best" >Our Best Sellers</a>
    </div>
  </div> 
  <!-- END -->
  
    <!--  Shopping  -->
  <div class="dropdown">
    <button id="shopping-content"  class="dropbtn hoverTransparentBg">
    	<a href="Shopping.jsp"class="disableTextSelection" class="DropDown">
    	Shopping</a>
    </button>
  </div> 
  <!-- END -->
  
  
  <!--  Workshop -->
  <div class="dropdown">
    <button id="workshop-content"  class="dropbtn hoverTransparentBg">
    	<a href="Workshop.jsp"class="disableTextSelection" class="DropDown">Workshop &nbsp; <i class="fa fa-caret-down"></i></a>
    </button>
    <div class="dropdown-content">
      <a href="Workshop.jsp" >Workshop</a>
      <a href="Workshop.jsp#" >Workshop1</a>
      <a href="Workshop.jsp#" >Workshop2</a>
      <a href="Workshop.jsp#" >Workshop3</a>
    </div>
  </div> 
  <!-- END -->

  <!--  contact us -->
  <div class="dropdown">
    <button id="contact-us-content"  class="dropbtn hoverTransparentBg">
    	<a href="ContactUs.jsp"class="disableTextSelection" class="DropDown">Contact Us &nbsp; <i class="fa fa-caret-down"></i></a>
    </button>
    <div class="dropdown-content">
      <a href="ContactUs.jsp" >Contact Us</a>
      <a href="ContactUs.jsp#MeetUs" >Meet Us</a>
      <a href="ContactUs.jsp#FAQ" >Q & As</a>
    </div>
  </div> 
  <!-- END -->
  
  <!--  CART -->
    <div id="cartMenu" class="HeaderMenu hoverTransparentBg" onClick="toggleCart('true')" ><p id="ItemCount"><%=myCart.getTotalItems()>0?myCart.getTotalItems():""%></p></div>
  <!--  END  -->
</div>

<!--  old
<header class="Header" id="globalNavigation">
         <ul class="Menu">
            <li id="home-content" class="HeaderMenu hoverTransparentBg "><a href="index.jsp" class="disableTextSelection">Home</a></li>
            <li id="about-us-content" class="HeaderMenu hoverTransparentBg"><a href="AboutUs.jsp" class="disableTextSelection">About Us</a></li>
            <li id="shopping-content" class="HeaderMenu hoverTransparentBg"><a href="Shopping.jsp"class="disableTextSelection">Shopping</a></li>
            <li id="workshop-content" class="HeaderMenu hoverTransparentBg"><a href="Workshop.jsp"class="disableTextSelection">Workshop</a></li>
            <li id="contact-us-content" class="HeaderMenu hoverTransparentBg">
            	<a href="ContactUs.jsp"class="disableTextSelection" class="DropDown">Contact Us<i class="fa fa-caret-down"></i></a>
            	<div class="dropdown-content">
			      <a href="#">Link 1</a>
			      <a href="#">Link 2</a>
			      <a href="#">Link 3</a>
			    </div>
            	
            	</li>
            <li id="cartMenu" class="HeaderMenu hoverTransparentBg" onClick="toggleCart('true')" ><p id="ItemCount"><%=myCart.getTotalItems()>0?myCart.getTotalItems():""%></p></li>
         </ul>
</header>

<div id="UpArrowContainer">
		<div id="UpArrow" onclick="scrollTopFunction();" class="UpArrow"></div>
</div>
-->