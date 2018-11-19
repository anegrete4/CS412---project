<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<div id="ContentPage" class="Page">
   <section class="Content-title">
      <h1>Contact Us</h1>
      <p>
         Our team is committed to provide you with more information, answer any questions you may have.
      </p>
      <a href="#ContentBody" class="Content-down-arrow">&#8595;</a>
   </section>
   <div id="ContentBody" class="ContentWrapper">
      <jsp:include page="/WEB-INF/pages/contactUsOptions.jsp"/>
      <jsp:include page="/WEB-INF/pages/inputFormComplaint.jsp"/>
      <jsp:include page="/WEB-INF/pages/inputFormCustomerSupport.jsp"/>
      <jsp:include page="/WEB-INF/pages/inputFormSalesInquiry.jsp"/>
   </div>
   <section>
      <jsp:include page="/WEB-INF/pages/contactUsFooterWithMap.jsp"/>
   </section>
</div>