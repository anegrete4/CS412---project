
   <form class="popUpForm" ACTION="registerWorkshop.do" METHOD="POST">
      <!-- Complaint form starts -->
      
      	 <span class="InputFormLineGroup">
      		<input type="text" name="fname" id="fname" placeholder="First name" >
      		<input type="text" name="lname" id="lname" placeholder="Last name">
     	</span>
     	<input type="text" name="email" id="email" placeholder="Email Address">
     	<input type="hidden" value="<%=request.getParameter("registerId")%>" name="registerId">
		<input type="hidden" value="<%=request.getParameter("workshopCapacity")%>" name="workshopCapacity">
		<input type="hidden" value="<%=request.getParameter("registration")%>" name="registration">
     	<span class="InputFormLineGroup popUpButtons">
      		<input type="reset" onClick="closeResponseBox()" class="hoverTransparentBg" value="Cancel">
      		<input type="submit" onClick="" value="Register" class="hoverTransparentBg">  
      	</span>
      		
   </form>