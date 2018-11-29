<%@ page import="java.util.*" %>  
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
