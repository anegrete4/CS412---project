<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<div id="Page" class="Page">
   <section class="Content-title">
      <h1>Contact Us</h1>
      <p>
         Our team is committed to provide you with more information, answer any questions you may have.
      </p>
      <a href="#ContentBody" class="Content-down-arrow">&#8595;</a>
   </section>
   <div id="ContentBody" class="ContentWrapper">
      <section class="ContentGroup ContentGroupActive ContentMainPage">
         <div class="Content-header">
            <h2>Reason for Inquiry</h2>
            <p>Please select the purpose for your inquiry.</p>
         </div>
         <div class="Content-panel">
            <div class="Content-panel-image"> <img src="images/complaint.jpg"></div>
            <div class="Content-panel-content">
               <h3>Make A Complaint</h3>
               <p>Let us know about your bad experience, and we will do our best to resolve your problems.</p>
            </div>
            <button class="PanelButton LeftPanelButton">Make A Complaint</button>
         </div>
         <div class="Content-panel">
            <div class="Content-panel-image"> <img src="images/inquiry.jpg"></div>
            <div class="Content-panel-content">
               <h3>Sales Inquiry</h3>
               <p>Please let us know your questions or concerns about any of the our products, and we will be in touch with you as soon as possible.</p>
            </div>
            <button class="PanelButton MiddlePanelButton">Sales Inquiry</button>
         </div>
         <div class="Content-panel">
            <div class="Content-panel-image"> <img src="images/customerSupport.jpg"></div>
            <div class="Content-panel-content">
               <h3>Customer Support</h3>
               <p>If you have any problems with our product, and you need an immidiate assistence for something, please let us know and our SME will be 
               in touch with you as soon as possible.</p>
            </div>
            <button class="PanelButton RightPanelButton">Customer Support</button>
         </div>
      </section>
      
      <section class="ContentGroup ContentGroupInActive Complaint">
         <div class="Content-header">
            <h2>Make A Complaint</h2>
            <p>Let us know what you did not like. We will try our best to improve.</p>
         </div>
         <div class="InputForm">
            <button class="PanelButton SubmitButton">Submit</button>
            <button class="PanelButton CancelButton">Cancel</button>
         </div>
      </section>
      <section class="ContentGroup ContentGroupInActive SalesInquiry">
         <div class="Content-header">
            <h2>Sales Inquiry</h2>
            <p>Late us know what you are interested in.</p>
         </div>
         <div class="InputForm">
            <button class="PanelButton SubmitButton">Submit</button>
            <button class="PanelButton CancelButton">Cancel</button>
         </div>
      </section>
      <section class="ContentGroup ContentGroupInActive Support">
         <div class="Content-header">
            <h2>Customer Support</h2>
            <p>Please leave your information we will try to contact you as soon as possible.</p>
         </div>
         <div class="InputForm">
            <button class="PanelButton SubmitButton">Submit</button>
            <button class="PanelButton CancelButton">Cancel</button>
         </div>
      </section>
   </div>
   <section>
      <div class="ContactFooter">
         <div class="ContactFooterLeft">
            <div class="ContactFooterPanel">
               <h3 >Business Location</h3>
               <p>Main Office
                  <br> 5600 N. St. Louis. Ave
                  <br> Chicago IL-60625
                  <br><span class="Contact-maplink"> <a class="" href="http://www.google.com/maps/place/5600+N.+St.+Louis+Ave+Chicago+IL+60625">Get Directions</a> </span>
               </p>
            </div>
             <div class="ContactFooterPanel">
               <h3 >General Contact</h3>
               <p > Toll-Free:<span class="spanRight">773-123-1243</span>
                  <br> Phone:<span class="spanRight">323-946-6532</span>
                  <br> Fax:<span class="spanRight">653-212-1345</span>
                  <br> Email:<span class="spanRight">office@ggg.com</span>
               </p>
            </div>
          
         </div>
         <div class="ContactFooterRight">
        <iframe onload="updateMapInfo()" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d36141.073248910565!2d-87.74690820834509!3d41.971761570055016!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x880fce74a2a0ee91%3A0x5a463e10f151a258!2sNortheastern+Illinois+University!5e0!3m2!1sen!2sus!4v1542432378152" width="100%" height="350px" frameborder="0" style="border:0" allowfullscreen>
        </iframe>
      </div>
   </section>
</div>