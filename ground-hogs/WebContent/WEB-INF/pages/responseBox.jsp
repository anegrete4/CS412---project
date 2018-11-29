<%@ page import="java.util.*" %>  
<%
	ArrayList<String> responses=new ArrayList();
	String responseType="";
	if(session.getAttribute("responseTitle")!=null){
		String messageTitle=session.getAttribute("responseTitle").toString();
	}
	if(session.getAttribute("responses")!=null){
		responses = (ArrayList)session.getAttribute("responses");
	}
	if(session.getAttribute("responseType")!=null){
		responseType=session.getAttribute("responseType").toString();	
	}
%>
<%
	if(responses!=null && responses.size()>0){
		 %>
			 <div id="overlay" class="overlayBox">
			 	<div id="responseBox" class="<%=responseType%>">
				 	<h3><%=session.getAttribute("responseTitle") %></h3>
						<%
							for(String r:responses){
								%>
								<p><%=r %></p>
								<%
							}	
						%>
					<div class="PanelButton" onClick="closeResponseBox()">Close</div>
				</div>
			</div>
		 <%
		session.removeAttribute("responseTitle"); 
		session.removeAttribute("responses");
		session.removeAttribute("responseType");
		responses.clear();
	}

%>
