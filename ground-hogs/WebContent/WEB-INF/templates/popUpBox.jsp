<%@ page import="utility.Helper" %>
<%
	Helper.initializeSessionDataForValidation(request);
%>

 <div id="overlay" class="overlayBox">
 		<div class="popUpBox ${param.popUpContent}" >
 		<h3 class="${param.responseType}%>">${param.popUpTitle}</h3>
  		<div class="popUpCloseButton crossButton" onClick="closeResponseBox()"></div>
  		<jsp:include page="/WEB-INF/pages/${param.popUpContent}.jsp" />
  		<%
  			if(Helper.hasErrors()){
  				%>
  					<div class="errorMessage"><p>Please provide the valid information in the highlighted fields.</p></div>
  				<%
  				Helper.resetDataValidation(request);
  			}
  		%>
	</div>
</div>