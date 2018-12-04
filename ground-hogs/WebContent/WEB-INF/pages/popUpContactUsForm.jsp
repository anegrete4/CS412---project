<%@ page import="java.util.*" %>  
<%!ArrayList<String> responses=new ArrayList<String>(); %>
<%@ page import="utility.Helper" %>
   <form class="popUpForm" ACTION="submitCustomerSupport.do" METHOD="POST">  
      <select name="contactUsReason" id="contactUsReason" class="fullWidth <%=Helper.validate("contactUsReason") %>"  onChange="toggleDisplayById('showHideInputFields','contactUsReason');">
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
     	<span id="showHideInputFields">
	        <span class="InputFormLineGroup">
	      		<input class=" <%=Helper.validate("fname") %>" type="text" name="fname" id="fname" value="<%=Helper.getStoredString("fname") %>" placeholder="First name" >
	      		<input class=" <%=Helper.validate("lname") %>" type="text" name="lname" id="lname" value="<%=Helper.getStoredString("lname") %>" placeholder="Last name">
	     	</span>
	     	<input type="text" name="email" id="email" placeholder="Email Address" value="<%=Helper.getStoredString("email") %>" class=" <%=Helper.validate("email") %>">
	      	<input type="text" name="phone" id="phone" placeholder="Phone Number" value="<%=Helper.getStoredString("phone") %>"class=" <%=Helper.validate("phone") %>">
	    </span>
	     <span class="twoInputButtonsWrapper">
      		<input type="reset" class='tButton colorRed' onClick="closeResponseBox()" value="Cancel">
      		<input type="submit" class='tButton'onClick="" value="Submit" >  
        </span>
        <script>
        	document.getElementById('contactUsReason').value = '<%=Helper.getStoredString("contactUsReason") %>';
        	toggleDisplayById('showHideInputFields','contactUsReason');
        </script>
   </form>