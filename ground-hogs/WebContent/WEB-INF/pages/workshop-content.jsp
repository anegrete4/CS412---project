<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %> 
<%@ page import="utility.Helper" %> 
<%@ page import="model.Workshop" %>
<%@ page import="database.DBAccess" %>     
<%!ArrayList<Workshop> workshops=new ArrayList<Workshop>();%>
<% 	
	workshops=(ArrayList)DBAccess.SP_GetWorkshops();
%>

<div class="wrapper">
		<div class="parallex" id="about">
			<header class="aboutHeader">
				<h1>WORKSHOPS</h1>
			     <p>We provide workshops that are positive, fun and informative.</p>
				<a href="#mission" class="DownArrow nextSection"></a>
			</header>
			
		</div>
		
		<div class="row" id="mission">
			
				 <div class="AboutWorkshops">
   					<h4>
   						Our workshops are a great way to learn a lot about groundhogs quickly.
   						We offer three different free workshops for groundhog parents every week.
      	 				They are presented by our favorite positive groundhog trainers and other 
      	 				groundhog related professionals in the area.  We also demonstrate the proper use of a
      	 				variety of groundhog toys and training products at every workshop.
       				</h4>
    			</div>
			
    	<div id="Media-Container">
			<div class="row" id="media1">
				<div class="column"> 
					<a><img src="images\groudhogsimages\groundhog2.jpg" alt="kissing hogs" width="410" height="350"></a>
				</div>
				<div class="column" id="Workshop1">
					<h5><%=workshops.get(0).getWorkshopName() %></h5>
					<p><%=workshops.get(0).getWorkshopDescription()%>
					<br>Day:<%=workshops.get(0).getWorkshopDay()%>
					<br>Time:<%=workshops.get(0).getWorkshopTime() %>
					<br>Capacity:<%=workshops.get(0).getWorkshopCapacity()%>
					<br>Available seats:<%=workshops.get(0).getWorkshopCapacity()-workshops.get(0).getRegistration()%>
					<br>
					</p>
					<form class="InputForm ComplaintForm" ACTION="popUpDisplay.do" METHOD="POST">
		               <input type="hidden" value="Proper Introductions" name="popUpTitle" />
		               <input type="hidden" value="popUpWorkshopForm" name="popUpContent" />
		               <input type="hidden" value="<%=workshops.get(0).getWorkshopId()%>" name="registerId">
		               <input type="hidden" value="<%=workshops.get(0).getWorkshopCapacity()%>" name="workshopCapacity">
		                 <input type="hidden" value="<%=workshops.get(0).getRegistration()%>" name="registration">
		               <input type="submit" value="Register" class="tButton">  
		            </form>
				</div>
			</div>

			<div class="row" id="media2">
		         
				<div class="column" id="Workshop2">
					<h5><%=workshops.get(1).getWorkshopName() %></h5>
					<p><%=workshops.get(1).getWorkshopDescription()%>
					<br>Day:<%=workshops.get(1).getWorkshopDay()%>
					<br>Time:<%=workshops.get(1).getWorkshopTime() %>
					<br>Capacity:<%=workshops.get(1).getWorkshopCapacity()%>
					<br>Available seats:<%=workshops.get(1).getWorkshopCapacity()-workshops.get(1).getRegistration()%>
					<br>
					</p>
		
					<form class="InputForm ComplaintForm" ACTION="popUpDisplay.do" METHOD="POST">
		               <input type="hidden" value="Groudhog Confidence Building" name="popUpTitle" />
		               <input type="hidden" value="popUpWorkshopForm" name="popUpContent" />
		               <input type="hidden" value="<%=workshops.get(1).getWorkshopId()%>" name="registerId">
		               <input type="hidden" value="<%=workshops.get(1).getWorkshopCapacity()%>" name="workshopCapacity">
		                 <input type="hidden" value="<%=workshops.get(1).getRegistration()%>" name="registration">
		               <input type="submit" value="Register" class="tButton">  
		            </form>
				</div>
				<div class="column"> 
					<a><img src="images\groudhogsimages\groundhog3.jpg" alt="jedi" width="500" height="400"></a>
				</div>
			</div>
		
			<div class="row" id="media3">
			
				<div class="column"> 
					<a><img src="images\groudhogsimages\groundhog4.jpg" alt="baby hog" width="500" height="400"></a>
				</div>
				
				<div class="column" id="Workshop3">
					<h5><%=workshops.get(2).getWorkshopName() %></h5>
					<p><%=workshops.get(2).getWorkshopDescription()%>
					<br>Day:<%=workshops.get(2).getWorkshopDay()%>
					<br>Time:<%=workshops.get(2).getWorkshopTime() %>
					<br>Capacity:<%=workshops.get(2).getWorkshopCapacity()%>
					<br>Available seats:<%=workshops.get(2).getWorkshopCapacity()-workshops.get(2).getRegistration()%>
					<br>
					</p>
					<form class="InputForm ComplaintForm" ACTION="popUpDisplay.do" METHOD="POST">
		               <input type="hidden" value="Your New Groundhog Cub" name="popUpTitle" />
		               <input type="hidden" value="popUpWorkshopForm" name="popUpContent" />
		               <input type="hidden" value="<%=workshops.get(2).getWorkshopId()%>" name="registerId">
		               <input type="hidden" value="<%=workshops.get(2).getWorkshopCapacity()%>" name="workshopCapacity">
		                 <input type="hidden" value="<%=workshops.get(2).getRegistration()%>" name="registration">
		               <input type="submit" value="Register" class="tButton">  
		            </form>
				</div>
			</div>
    
			
	</div>	
	
	</div>

</div>			
			
