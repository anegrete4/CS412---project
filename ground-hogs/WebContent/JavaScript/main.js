$(document).ready(function(){
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
			if (buttonClass=='LeftPanelButton') {
				panelToShow=document.getElementsByClassName('Complaint');
			}
		    else if (buttonClass=='MiddlePanelButton'){
		    	panelToShow=document.getElementsByClassName('SalesInquiry');
		    }
		    else if (buttonClass=='RightPanelButton'){
		    	panelToShow=document.getElementsByClassName('Support');
		    }
		    else if(buttonClass=='SubmitButton'){
		    	panelToShow=document.getElementsByClassName('ContentMainPage');
		    }
		    else if(buttonClass=='CancelButton'){
		    	panelToShow=document.getElementsByClassName('ContentMainPage');
		   }
			var panelToHide=document.getElementsByClassName('ContentGroupActive');
			(panelToHide[0]).classList.replace("ContentGroupActive","ContentGroupInActive");
			(panelToShow[0]).classList.replace("ContentGroupInActive","ContentGroupActive");
			
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
