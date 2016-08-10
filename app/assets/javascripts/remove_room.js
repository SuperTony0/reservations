$(document).on('ready', function() {
  $("#remove-room").bind('submit', function(event){
    event.preventDefault();
    console.log("prevent me now")
    var roomNumber = $(this).attr('data');
    $.ajax({
       url: '/rooms/' + roomNumber,
       type: 'delete'
     })

  });
});



// $.ajax({
//     url: '/script.cgi',
//     type: 'DELETE',
//     data: (this).attr(data)
//     success: function(result) {
//         // Do something with the result
//     }
// });
