<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <div class="wrapper">
        
        <div class="section parallax about" id="contactUs">
			<header class="aboutHeader">
				<h1>CONTACT US!</h1>
				<p>We are just a click away.</p>
				<form class="InputForm" ACTION="popUpDisplay.do" METHOD="POST">
                 	<div class="magButtonWrapper">
                        <input type="hidden" value="Customer Support" name="popUpTitle" />
                        <input type="hidden" value="popUpContactUsForm" name="popUpContent" />
                        <input type="submit" value="Contact Now" class="magButton">
                    </div>
                 </form>
				<div class="aboutMiddle">
					<a href="#MeetUs" class="DownArrow nextSection"></a>
				</div>
			</header>
		</div>

            <div class="row" id="MeetUs" >
                <div id="best">
                    <h1>Meet Us</h1>
                </div>
                <div class="MeetUsArea">
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
                            <span class="floatLeft tButton"> <a href="http://www.google.com/maps/place/5600+N.+St.+Louis+Ave+Chicago+IL+60625">Get Directions</a> </span>
                        </p>
                    </div>
                </div>
                </div>
            </div>
            <div id="FAQ">
                <jsp:include page="/WEB-INF/pages/frequentlyAskedQuestions.jsp" />
            </div>
        </div>
    </div>