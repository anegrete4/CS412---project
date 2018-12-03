<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <div class="wrapper">
        <div class="parallex" id="about">
            <header class="aboutHeader">
                <h1>Contact Us!</h1>
                <p>We are here to help.</p>
                <a href="#media1" class="DownArrow nextSection"></a>
            </header>

        </div>

        <div id="Media-Container" class="contactUsPanel">
            <div class="row" id="media1">
                <div class="column">
                    <a><img src="images/customerSupport.jpg" alt="Customer Support" width="510" height="350"></a>
                </div>
                <div class="column">
                    <h1>Customer Support</h1>
                    <p>If your question has not already been answered <a href="#FAQ" class="nextSection">here</a>, our SMEs will try to provide the answer as soon as possible.</p>
                    <form class="InputForm ComplaintForm" ACTION="popUpDisplay.do" METHOD="POST">
                        <input type="hidden" value="Customer Support" name="popUpTitle" />
                        <input type="hidden" value="popUpContactUsForm" name="popUpContent" />
                        <input type="submit" value="Customer Support" class="PanelButton">
                    </form>
                </div>
            </div>

            <div class="row" id="bestRow">
                <div id="best">
                    <h1>Meet Us</h1>
                </div>
                <div id="MeetUsGrid">
                <div>
                        <h3>General Contact</h3>
                        <p class="fixedWidth">Toll-Free:<span class="spanRight">773-123-1243</span>
                            <br> Phone:<span class="spanRight">323-946-6532</span>
                            <br> Fax:<span class="spanRight">653-212-1345</span>
                            <br> Email:<span class="spanRight">office@ggg.com</span>
                        </p>
                        <h3>Business Hours</h3>
                        <p class="fixedWidth">Mon-Fri:<span class="spanRight">7:00AM - 8:00PM</span>
                        </p>
                    </div>
                    
                    <div id="GoogleMap">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d36141.073248910565!2d-87.74690820834509!3d41.971761570055016!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x880fce74a2a0ee91%3A0x5a463e10f151a258!2sNortheastern+Illinois+University!5e0!3m2!1sen!2sus!4v1542432378152" style="width:100%; height:290px;"></iframe>
           
                    </div>
                    <div class="thirdCol">
                        <h3>Business Location</h3>
                        <p class="fixedWidth">Main Office
                            <br> 5600 N. St. Louis. Ave
                            <br> Chicago IL-60625
                       	    <br>
                       	    <br>
                            <span class="floatLeft"> <a class="PanelButton" href="http://www.google.com/maps/place/5600+N.+St.+Louis+Ave+Chicago+IL+60625">Get Directions</a> </span>
                        </p>
                    </div>
                </div>
            </div>

            <div id="FAQ">
                <jsp:include page="/WEB-INF/pages/frequentlyAskedQuestions.jsp" />
            </div>
        </div>
    </div>