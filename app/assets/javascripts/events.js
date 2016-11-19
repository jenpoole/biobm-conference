
// Fix for JS & Turbolinks on initial load
$(document).on('turbolinks:load', function() {

  $('.datetimepicker').datetimepicker();
  
  $(".input-daterange").datepicker({
    format: "mm/dd/yyyy"
  });

});