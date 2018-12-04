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

<header class="Header" id="globalNavigation">
         <ul class="Menu">
            <li id="home-content" class="HeaderMenu hoverTransparentBg "><a href="index.jsp" class="disableTextSelection">Home</a></li>
            <li id="about-us-content" class="HeaderMenu hoverTransparentBg"><a href="AboutUs.jsp" class="disableTextSelection">About Us</a></li>
            <li id="shopping-content" class="HeaderMenu hoverTransparentBg"><a href="Shopping.jsp"class="disableTextSelection">Shopping</a></li>
            <li id="workshop-content" class="HeaderMenu hoverTransparentBg"><a href="Workshop.jsp"class="disableTextSelection">Workshop</a></li>
            <li id="contact-us-content" class="HeaderMenu hoverTransparentBg DropDown"><a href="ContactUs.jsp"class="disableTextSelection">Contact Us</a></li>
            <li id="cartMenu" class="HeaderMenu hoverTransparentBg" onClick="toggleCart('true')" ><p id="ItemCount"><%=myCart.getTotalItems()>0?myCart.getTotalItems():""%></p></li>
         </ul>
</header>

<div id="UpArrowContainer">
		<div id="UpArrow" onclick="scrollTopFunction();" class="UpArrow"></div>
</div>
