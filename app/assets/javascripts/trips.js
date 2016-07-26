$(document).on('ready', function() {
 $("#btn1").on("click", function(){
   $("#travelers").show();
   $("#rooms").hide();
   $(this).hide(); 
   $("#btn2").show();
 });
 $("#btn2").on("click", function() {
   $("#rooms").show();
   $("#travelers").hide();
   $(this).hide(); 
   $("#btn1").show();
 });
});
