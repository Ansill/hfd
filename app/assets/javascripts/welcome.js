// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	$(function() {
    var BV = new $.BigVideo({
    	container: $(".hero-vid"),
    	controls: false
    });
    BV.init();
    BV.show('http://vjs.zencdn.net/v/oceans.mp4',{ambient:true});
	});

});