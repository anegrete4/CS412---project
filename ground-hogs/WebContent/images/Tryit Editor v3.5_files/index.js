"use strict";
window.onload = function() {
    
    TweenMax.to(copy1, 1, {delay:.5, opacity:1, ease: Power4.easeOut})
    //TweenMax.to(img1, 1, {delay:1, opacity:1, ease: Power4.easeOut})

    //TweenMax.to(legal, 1, {delay:1, opacity:1, ease: Power4.easeOut})
    TweenMax.delayedCall(2.5,frameOne);
}
function frameOne(){
//    TweenMax.to(logo, 1, {delay:0, opacity:0, ease: Power4.easeOut})
    TweenMax.to(bg1, .5, {delay:0, opacity:0, ease: Power4.easeOut})
 
    TweenMax.to(copy1, 1, {delay:0, opacity:0, ease: Power4.easeOut})
    TweenMax.to(bg2, .5, {delay:0, opacity:1, ease: Power4.easeOut})

    TweenMax.to(img1, 1, {delay:.5, opacity:1, ease: Power4.easeOut})
    //TweenMax.to(img2, 0, {delay:0, opacity:1, ease: Power4.easeOut})


    TweenMax.delayedCall(2.5,frameTwo);
}
function frameTwo(){
    TweenMax.to(img1, 1, {delay:0, opacity:0, ease: Power4.easeOut})
    TweenMax.to(img2, 1, {delay:.5, opacity:1, ease: Power4.easeOut})

    TweenMax.delayedCall(2.5,frameThree);
}
function frameThree(){
    TweenMax.to(img2, 1, {delay:0, opacity:0, ease: Power4.easeOut})
   
    TweenMax.to(img3, 1, {delay:.5, opacity:1, ease: Power4.easeOut})
    TweenMax.delayedCall(2.5,frameFour);
}
function frameFour(){
   TweenMax.to(img3, 1, {delay:0, opacity:0, ease: Power4.easeOut})
   TweenMax.to(img4, 1, {delay:.5, opacity:1, ease: Power4.easeOut})
   TweenMax.delayedCall(2.5,frameFive);
}
function frameFive(){
   TweenMax.to(img4, 1, {delay:0, opacity:0, ease: Power4.easeOut})
   TweenMax.to(bg2, .5, {delay:0, opacity:0, ease: Power4.easeOut})
   TweenMax.to(bg1, .5, {delay:0, opacity:1, ease: Power4.easeOut})
//   TweenMax.to(logo, 1, {delay:.5, opacity:1, ease: Power4.easeOut})
   
   TweenMax.to(copy1, 1, {delay:1, opacity:1, ease: Power4.easeOut})



}

