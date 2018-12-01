<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<div class="wrapper">
   <div class="parallex" id="contactUs">
      <div class="parallexContaint">
         <h1>Contact Us</h1>
         <p>Our team is committed to provide you with more information, answer any questions you may have.</p>
         <a href="#ContentBody" class="DownArrow nextSection"></a>
      </div>
   </div>
   <div id="ContentBody">
         <div class="Content-header">
            <h2>Reason for Inquiry</h2>
            <p>Please select the purpose for your inquiry.</p>
         </div>
         <div class="Content-panel">
            <div class="Content-panel-image"> <img src="images/question.jpg"></div>
            <div class="Content-panel-content">
               <h3>Quick Question</h3>
               <p>If your question has not already been answered <a href="#FAQ" class="nextSection">here</a>, our SMEs will try to provide the answer as soon as possible.</p>
            </div>
            <form class="InputForm" ACTION="popUpDisplay.do" METHOD="POST">
               <input type="hidden" value="Quick Question" name="popUpTitle" />
               <input type="hidden" value="popUpQuickQuestion" name="popUpContent" />
               <input type="submit" value="Ask" class="PanelButton">  
            </form>
         </div>
         <div class="Content-panel">
            <div class="Content-panel-image"> <img src="images/customerSupport.jpg"></div>
            <div class="Content-panel-content">
               <h3>Customer Support</h3>
               <p>If you have any problems with our product, and you need immediate assistance for something, please let us know and our SME will be in touch with you as soon as possible.</p>
            </div>
            <form class="InputForm ComplaintForm" ACTION="popUpDisplay.do" METHOD="POST">
               <input type="hidden" value="Customer Support" name="popUpTitle" />
               <input type="hidden" value="popUpContactUsForm" name="popUpContent" />
               <input type="submit" value="Customer Support" class="PanelButton">  
            </form>
         </div>
   </div>
   
   <div id="FAQ">
   		<jsp:include page="/WEB-INF/pages/frequentlyAskedQuestions.jsp"/>
   </div>
   
   <div class="ContactFooter">
      <div class="ContactFooterLeft">
         <div class="ContactFooterPanel">
            <h3>Business Location</h3>
            <p>Main Office
               <br> 5600 N. St. Louis. Ave
               <br> Chicago IL-60625
               <br><span class="Contact-maplink"> <a class="hoverTransparentBg" href="http://www.google.com/maps/place/5600+N.+St.+Louis+Ave+Chicago+IL+60625">Get Directions</a> </span>
            </p>
         </div>
         <div class="ContactFooterPanel">
            <h3>General Contact</h3>
            <p> Toll-Free:<span class="spanRight">773-123-1243</span>
               <br> Phone:<span class="spanRight">323-946-6532</span>
               <br> Fax:<span class="spanRight">653-212-1345</span>
               <br> Email:<span class="spanRight">office@ggg.com</span>
            </p>
         </div>
         <div class="ContactFooterPanel">
            <h3>Business Hours</h3>
            <p>Mon-Fri:<span class="spanRight">7:00AM - 8:00PM</span>
            </p>
         </div>
      </div>
      <div class="ContactFooterRight">
         <iframe id="GoogleMap" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d36141.073248910565!2d-87.74690820834509!3d41.971761570055016!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x880fce74a2a0ee91%3A0x5a463e10f151a258!2sNortheastern+Illinois+University!5e0!3m2!1sen!2sus!4v1542432378152" style="width:100%; height:390px;"></iframe>
      </div>
   </div>
</div>