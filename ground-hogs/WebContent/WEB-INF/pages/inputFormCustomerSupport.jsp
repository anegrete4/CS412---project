<section class="ContentGroup ContentGroupInActive Support">
   <div class="Content-header">
      <h2>Customer Support</h2>
      <p>Please leave your information we will try to contact you as soon as possible.</p>
   </div>
   <form class="InputForm ComplaintForm" ACTION="submitCustomerSupport.do" METHOD="POST">
      <!-- Complaint form starts -->
      <input type="text" name="orderNo" id="orderNo" placeholder="Order Number">
      <select name="complaintReason" id="complaintReason">
         <option value="">Select the reason for your complaint</option>
         <option value="defectiveProduct">Defective product</option>
         <option value="incorrectAmount">Incorrect amount</option>
         <option value="missingProduct">Missing product</option>
         <option value="other">Other</option>
      </select>
      <textarea name="complaintMessage" id="complaintMessage" rows="10" cols="30" placeholder="Begin your complaint here."></textarea>
      <span class="InputFormLineGroup">
      <input type="checkbox" onclick="toggleVisibility('revealWhenChecked', $(this));" id="needsFeedback" name="needsFeedback" value="needsFeedback" checked="checked">
      <label for="needsFeedback">I need response.</label>
      <input type="text" name="email" id="email" placeholder="Email Address" class="revealWhenChecked">
      </span>
      <input class="revealWhenChecked" type="text" name="fname" id="fname" placeholder="First name" >
      <input class="revealWhenChecked" type="text" name="lname" id="lname" placeholder="Last name">
      <span class="InputFormLineGroup">
      <input type="reset" onclick="setVisibility('revealWhenChecked','true')" class="PanelButton CancelButton" value="Cancel">
      <input type="submit" value="Submit" class="PanelButton CancelButton">  
      </span>
   </form>
</section>