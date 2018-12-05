<%@ page import="utility.Helper" %>
   <form class="popUpForm" ACTION="registerWorkshop.do" METHOD="POST">
      <!-- Complaint form starts -->
      
      	<span class="InputFormLineGroup">
	      		<input class=" <%=Helper.validate("fname") %>" type="text" name="fname" id="fname" value="<%=Helper.getStoredString("fname") %>" placeholder="First name" >
	      		<input class=" <%=Helper.validate("lname") %>" type="text" name="lname" id="lname" value="<%=Helper.getStoredString("lname") %>" placeholder="Last name">
	     	</span>
	     	<input type="text" name="email" id="email"class="floatLeft <%=Helper.validate("email") %>"  placeholder="Email: sample@sample.com" value="<%=Helper.getStoredString("email") %>" class=" <%=Helper.validate("email") %>">
	      
	    <input type="hidden" value="<%=request.getParameter("registerId")%>" name="registerId">
		<input type="hidden" value="<%=request.getParameter("workshopCapacity")%>" name="workshopCapacity">
		<input type="hidden" value="<%=request.getParameter("registration")%>" name="registration">
     	<span class="twoInputButtonsWrapper">
      		<input type="reset" onClick="closeResponseBox()" class="tButton" value="Cancel">
      		<input type="submit" onClick="" value="Register" class="tButton">  
      	</span>
      		
   </form>