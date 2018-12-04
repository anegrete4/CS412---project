
$(document).ready(function(){
	window.onscroll = function() {scrollFunction()};
	$(".nextSection").on('click', function(event) {  
	    if (this.hash !== "") {
	      event.preventDefault();
	      var hash = this.hash;
	      $('.wrapper').animate({
	        scrollTop: $(hash).offset().top
	      }, 800, function(){
	        window.location.hash = hash;
	      });
	    } 
	  });
	
	$(".PanelButton").on('click', function(event) {
		var buttonClass=($(this).attr('class')).split(' ')[1];
		var contentGroup=document.getElementsByClassName('ContentGroup');
		var panelToShow;
		var performReplacement=false;
		if (buttonClass=='LeftPanelButton') {
			panelToShow=document.getElementsByClassName('Complaint');
			performReplacement=true;
		}
	    else if (buttonClass=='MiddlePanelButton'){
	    	panelToShow=document.getElementsByClassName('SalesInquiry');
	    	performReplacement=true;
	    }
	    else if (buttonClass=='RightPanelButton'){
	    	panelToShow=document.getElementsByClassName('Support');
	    	performReplacement=true;
	    }
		
	    else if (buttonClass=='LongButton'){
	    	panelToShow=document.getElementsByClassName('WorkshopSelection');
	    	performReplacement=true;
	    }
		
	   else if(buttonClass=='CancelButton'){
	    	panelToShow=document.getElementsByClassName('ContentMainPage');
	    	performReplacement=true;
	   }
		if(performReplacement){
			var panelToHide=document.getElementsByClassName('ContentGroupActive');
			if(panelToShow!=null && panelToHide!=null){
				(panelToHide[0]).classList.replace("ContentGroupActive","ContentGroupInActive");
				(panelToShow[0]).classList.replace("ContentGroupInActive","ContentGroupActive");
			}
		}
		
  });

});


function setVisibility(className, isVisible){
	var item=document.getElementsByClassName(className);
	for(var i=0;i<item.length; i++){
		 if (isVisible) {
		      (item[i]).style.visibility = "visible";
		      (item[i]).style.height="30px";
		    } else{
		    	(item[i]).style.visibility = "hidden";
		    	(item[i]).style.height="0px";
		   }
	}
}

function toggleVisibility(className) {
	setVisibility(className,cBox.is(':checked'));
}

function togleDisplayContactUsForm(elemId){
	
	
}

function resizeContainer(containerClass,largeHeight,smallHeight, makeLarge){
	var box=document.getElementsByClassName(containerClass);
	var buttonBox=document.getElementsByClassName('popUpButtons');
	var newHeight=smallHeight;
	if(makeLarge){
		newHeight=largeHeight;
	}
	if((box)!=null){
		$(box[0]).animate({height:newHeight});
	}
	if((buttonBox)!=null){
		var newMargin=parseInt((parseInt(newHeight)-parseInt(largeHeight))/1.5);
		var newmarginPx=newMargin+'px';
		$(buttonBox[0]).animate({marginTop:newmarginPx});
	}
	
}

function toggleVisibilityNChangePopUpHeight(className,largeHeight,smallHeight,mainContainerClass, ddBoxId){
	var e = document.getElementById(ddBoxId);
	setVisibility(className,e.selectedIndex!=4);	
	resizeContainer(mainContainerClass,largeHeight,smallHeight,e.selectedIndex!=4);
}

function toggleDisplayById(elemId, ddBoxId){
	
	var e = document.getElementById(ddBoxId);
	
	if(e.selectedIndex==4){
		document.getElementById(elemId).style.display = 'none';
	}
	else{
		document.getElementById(elemId).style.display = 'block';
	}
}

function toggleDisplayOfElement(elemId){
	
	if(document.getElementById(elemId).style.display == 'block'){
		document.getElementById(elemId).style.display = 'none';
	}
	else{
		document.getElementById(elemId).style.display = 'block';
	}
}

function closeResponseBox(){
	var box=document.getElementsByClassName("popUpBox");
	if((box)!=null){
		$(box[0]).hide();
		overlayOff();
	}
}
function overlayOn() {
    document.getElementById("overlay").style.display = "block";
}

function overlayOff() {
    document.getElementById("overlay").style.display = "none";
}

function toggleMenuSelection(item){
	var menues=document.getElementsByClassName('HeaderMenu');
	for(var i=0;i<menues.length;i++){
		(menues[i]).classList.remove('MenuSelected');
	}
	var menuToSelect=document.getElementById(item);
	(menuToSelect).classList.add('MenuSelected');
}

function upVoteMe(questionId){
	var calculatedId="vote"+questionId;
	var elem=document.getElementById(calculatedId);
	if($(elem).hasClass('voted')){
		alert('You have already voted this item.');
		
	}else{
		var newVal= parseInt(document.getElementById(calculatedId).innerHTML)+1;
		elem.innerHTML=newVal;
		(elem).classList.add('voted');
		$.post("http://localhost:8080/ground-hogs/upVote.do", { "questionId": questionId });
	}	
}

function toggleCart(show){
	var displayCart = localStorage.getItem("displayCart");
	if((show)=='true' || (displayCart=='true' && (show)=='takeLastValue')){
		document.getElementById("CartBox").style.display = "block";
		localStorage.setItem("displayCart", "true");
	}
	else{
		document.getElementById("CartBox").style.display = "none";
		localStorage.setItem("displayCart", "false");
	}
}

function openNav() {
    document.getElementById("mySidebar").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("mySidebar").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
}

function scrollFunction() {
    if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
        document.getElementById("UpArrowContainer").style.display = "block";
    } else {
        document.getElementById("UpArrowContainer").style.display = "none";
    }
}

function scrollTopFunction() {
    //document.body.scrollTop = 0;
    //document.documentElement.scrollTop = 0;
	 var scrollStep = -window.scrollY / (20),
     scrollInterval = setInterval(function(){
     if ( window.scrollY != 0 ) {
         window.scrollBy( 0, scrollStep );
     }
     else clearInterval(scrollInterval); 
 },15);
}


  