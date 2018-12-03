<%@ page import="java.util.*" %>  
<%!ArrayList<String> responses=new ArrayList<String>(); %>
<%@ page import="utility.Helper" %>
   <form class="popUpForm" ACTION="submitCustomerSupport.do" METHOD="POST">  
      <select name="contactUsReason" id="contactUsReason" class="fullWidth <%=Helper.validate("contactUsReason") %>"  onChange="toggleVisibilityNChangePopUpHeight('revealWhenChecked','365px','240px','popUpContactUsForm', 'contactUsReason');">
         <option value="" selected="selected">Select the type of support.</option>
         <option value="productIssues">Issues with product(s)</option>
         <option value="billingNPayments">Billing and payments</option>
         <option value="missingProduct">My order has not arrived</option>
         <option value="justAQuickQuesiton">Quick question(will be answered in public)</option>
         <option value="other">Other</option>
      </select>
     <div class="whiteBg textAreaWrapper <%=Helper.validate("txtAreaMessage") %>">
      <textarea class="popUpTextArea invisibleScrollBg"name="txtAreaMessage" id="txtAreaMessage" placeholder="Begin here.."><%=Helper.getStoredString("txtAreaMessage") %></textarea>
     </div>
        <span class="InputFormLineGroup">
      		<input class="revealWhenChecked <%=Helper.validate("fname") %>" type="text" name="fname" id="fname" value="<%=Helper.getStoredString("fname") %>" placeholder="First name" >
      		<input class="revealWhenChecked <%=Helper.validate("lname") %>" type="text" name="lname" id="lname" value="<%=Helper.getStoredString("lname") %>" placeholder="Last name">
     	</span>
     	<input type="text" name="email" id="email" placeholder="Email Address" value="<%=Helper.getStoredString("email") %>" class="revealWhenChecked <%=Helper.validate("email") %>">
      	<input type="text" name="phone" id="phone" placeholder="Phone Number" value="<%=Helper.getStoredString("phone") %>"class="revealWhenChecked <%=Helper.validate("phone") %>">
      	 
     	<span class="InputFormLineGroup buttonsGroup">
      		<input type="reset" onClick="closeResponseBox()" class="popUpButtons" value="Cancel">
      		<input type="submit" onClick="" value="Submit" class="popUpButtons">  
        </span>
        <script>
        	document.getElementById('contactUsReason').value = '<%=Helper.getStoredString("contactUsReason") %>';
        	toggleVisibilityNChangePopUpHeight('revealWhenChecked','365px','240px','popUpContactUsForm', 'contactUsReason');
        </script>
   </form>