<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 
     
<%@ page import="java.util.*" %> 
<%@ page import="model.Cart" %>  
<%@ page import="model.CartItem" %> 
<%@ page import="utility.Helper" %> 
<%@ page import="java.util.Enumeration" %> 
<%!Enumeration<CartItem> cartItems;%>
<%!Cart myCart=new Cart();%>
<% 	
	boolean isCartEmpty=true;
	if(request.getSession().getAttribute("myCart")!=null){
		myCart=(Cart)request.getSession().getAttribute("myCart");
		isCartEmpty=myCart.getTotalItems()<=0;
	}
%>

<%!ArrayList<String> responses=new ArrayList<String>(); %>
<%
	if(session.getAttribute("responses")!=null){
		responses = (ArrayList)session.getAttribute("responses");
	}
	if(responses!=null && responses.size()>0){
		for(String r:responses){
			%>
			<p><%=r %></p>
			<%
		}		
	}
%>
