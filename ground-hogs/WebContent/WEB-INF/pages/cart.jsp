<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<div class="CartWrapper" id="CartBox">
   <div class="CartContainer">
      <div class="CartHeader">
      	<h3>Cart Items</h3>
  			<div class="popUpCloseButton crossButton" onClick="toggleCart('false')"></div>
        </div>
      <div class="CartItems">
      </div>
      <div class="CartTotal">
      </div>
    	<form class="InputForm ComplaintForm" ACTION="popUpDisplay.do" METHOD="POST">
               <input type="hidden" value="Checkout" name="popUpTitle" />
               <input type="hidden" value="popUpCheckout" name="popUpContent" />
               <input type="submit" onClick="toggleCart('false')" value="Checkout" class="hoverTransparentBg">  
        </form>
  
   </div>
</div>