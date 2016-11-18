// $(document).ready(function() {
//     $('.datetimepicker').datetimepicker();
// });

// Fix for JS & Turbolinks on initial load
$(document).on('turbolinks:load', function() {

  $('.datetimepicker').datetimepicker();

});