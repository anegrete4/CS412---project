<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/CSS/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/main.js"></script>
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
	</script>
</body>
</html>