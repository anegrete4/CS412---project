<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <form class="popUpForm" ACTION="submitWorkshopEnrolMon.do" METHOD="POST">
      <!-- Complaint form starts -->
      
      <span class="InputFormLineGroup">
      		<input type="text" name="fname" id="fname" placeholder="First name" >
      		<input type="text" name="lname" id="lname" placeholder="Last name">
     	</span>
        <input type="text" name="email" id="email" placeholder="Email Address">
      	
      	
     	<span class="InputFormLineGroup popUpButtons">
      		<input type="reset" onClick="closeResponseBox()" class="hoverTransparentBg" value="Cancel">
      		<input type="submit" onClick="" value="Submit" class="hoverTransparentBg">  
      </span>
      		
   </form>