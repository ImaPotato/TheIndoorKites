// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require fancybox
//= require_tree .
//= require chartkick


$ = jQuery;
var ready = function(){
	
	var currentId;
   // $("a.fancybox").fancybox();


    $('form').on('click', '.add_fields', (event), function(){
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $(this).before($(this).data('fields').replace(regexp, time))
        event.preventDefault();
    });
	$('.open_event').on("click",function(event){
			$(currentId).hide(); 
			var id = "#id" + event.target.id;
			if(currentId != id){
	        	$(id).show();
	        	currentId = id;
	    	} else {
	    		currentId = "";
	    	}
	});
	// fragility strikes again!
	$('#select_tab_1').on("click",function(event){
		$("#tab1").show();
		$("#tab2").hide();
		$("#tab3").hide();
		$("#tab4").hide();
	});
	$('#select_tab_2').on("click",function(event){
		$("#tab1").hide();
		$("#tab2").show();
		$("#tab3").hide();
		$("#tab4").hide();
	});
	$("#select_tab_3").on("click",function(event){
		$("#tab1").hide();
		$("#tab2").hide();
		$("#tab3").show();
		$("#tab4").hide();
	});
	$("#select_tab_4").on("click",function(event){
		$("#tab1").hide();
		$("#tab2").hide();
		$("#tab3").hide();
		$("#tab4").show();
	});
}

$(document).ready(ready);
$(document).on('page:load', ready);
