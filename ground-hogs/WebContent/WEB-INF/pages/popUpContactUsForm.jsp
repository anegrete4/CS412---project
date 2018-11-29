
   <form class="popUpForm" ACTION="submitCustomerSupport.do" METHOD="POST">
      <!-- Complaint form starts -->
      
      <select name="contactUsReason" id="contactUsReason" class="fullWidth">
         <option value="">Select the reason for your complaint</option>
         <option value="productIssues">Issues with product(s)</option>
         <option value="billingNPayments">Billing and payments</option>
         <option value="missingProduct">My order has not arrived</option>
         <option value="other">Other</option>
      </select>
     
      <textarea class="textAreaScroll"name="complaintMessage fullWidth" id="complaintMessage"  placeholder="Begin your complaint here."></textarea>
      <span class="InputFormLineGroup">
       <input type="checkbox" onclick="toggleVisibilityNChangePopUpHeight('revealWhenChecked','400px','300px','popUpContactUsForm', $(this));" id="needsFeedback" name="needsFeedback" value="needsFeedback" checked="checked">
       <label for="needsFeedback">I need response.</label>
     </span>
     	<input type="text" name="email" id="email" placeholder="Email Address" class="revealWhenChecked">
      	<input type="text" name="phone" id="phone" placeholder="Phone Number" class="revealWhenChecked">
      	 <span class="InputFormLineGroup">
      		<input class="revealWhenChecked" type="text" name="fname" id="fname" placeholder="First name" >
      		<input class="revealWhenChecked" type="text" name="lname" id="lname" placeholder="Last name">
     	</span>
     	<span class="InputFormLineGroup popUpButtons">
      		<input type="reset" onClick="closeResponseBox()" class="hoverTransparentBg" value="Cancel">
      		<input type="submit" onClick="" value="Submit" class="hoverTransparentBg">  
      </span>
      		
   </form>