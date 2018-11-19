<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>${param.title}</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/CSS/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/main.js"></script>
<body>
	<jsp:include page="/WEB-INF/pages/header.jsp"/>
	<jsp:include page="/WEB-INF/pages/responseBox.jsp"/>
	<!-- <h1>${param.title}</h1> -->
	<jsp:include page="/WEB-INF/pages/${param.content}.jsp"/>
	<jsp:include page="/WEB-INF/pages/footer.jsp"/>
	<%  session.setAttribute("title", request.getParameter("title")); %>
	<%  session.setAttribute("content", request.getParameter("content")); %>
	<script type="text/javascript">
		toggleMenuSelection('${content}');
    </script>
</body>
</html>