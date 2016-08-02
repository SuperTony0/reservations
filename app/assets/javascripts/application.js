// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_self
//= require_tree .


$(document).ready( function() {
 $("#btn1").on("click", function(){
   $("#travelers").slideDown();
   $("#rooms").slideUp();
   $(this).hide();
   $("#btn2").show();
 });
 $("#btn2").on("click", function() {
   $("#rooms").slideDown();
   $("#travelers").slideUp();
   $(this).hide();
   $("#btn1").show();
 });
 $('.jumbotron').fadeIn(1000).removeClass("hidden");
 $("#join-trip-button").on("click", function() {
    $("#join-trip-button").hide();
    $.ajax({
      url: 'trip/join_trip',
      type: 'put'
    });
 });
});
