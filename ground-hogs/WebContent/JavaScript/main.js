
$(document).ready(function(){
	var googleMapInfoUpdated=false;
	// start defining your methods
	$(".Content-down-arrow").on('click', function(event) {  
	    if (this.hash !== "") {
	      event.preventDefault();
	      var hash = this.hash;
	      $('html, body').animate({
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

function toggleVisibility(className, cBox) {
	setVisibility(className,cBox.is(':checked'));
}

function wait(ms){
   var start = new Date().getTime();
   var end = start;
   while(end < start + ms) {
     end = new Date().getTime();
  }
}

function closeResponseBox(){
	var box=document.getElementById("responseBox");
	if((box)!=null){
		$(box).hide();
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













