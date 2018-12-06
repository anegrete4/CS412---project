<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/CSS/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/JavaScript/main.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<body>
	<jsp:include page="/WEB-INF/pages/header.jsp"/>
	<%
		boolean hasResponse=false;
		if(session.getAttribute("hasResponse")!=null){
			hasResponse=Boolean.parseBoolean(session.getAttribute("hasResponse").toString());	
			if(hasResponse){ 
				if(session.getAttribute("popUpContent")!=null &&session.getAttribute("popUpTitle")!=null){
					String popUpContent=session.getAttribute("popUpContent").toString();
					String popUpTitle=session.getAttribute("popUpTitle").toString();
					%>
					<jsp:include page="/WEB-INF/templates/popUpBox.jsp">
						<jsp:param name="popUpContent" value="<%=popUpContent%>"/>
						<jsp:param name="popUpTitle" value="<%=popUpTitle%>"/>
					</jsp:include>
					<%
				}
			}
		} 
		if(!hasResponse){
			session.setAttribute("title", request.getParameter("title"));
			session.setAttribute("content", request.getParameter("content"));
			
		}
		session.setAttribute("hasResponse", "false");
	 %>
	 	<jsp:include page="/WEB-INF/pages/cart.jsp" />
	 
	<jsp:include page="/WEB-INF/pages/${param.content}.jsp"/>
	<jsp:include page="/WEB-INF/pages/footer.jsp"/>
	<script type="text/javascript">
		toggleMenuSelection('${content}');
		toggleCart('takeLastValue');
	</script>
</body>
</html>