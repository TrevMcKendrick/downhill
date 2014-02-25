// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
  $('.time-select').datetimepicker({
    pickTime: false
  });

  $("#add_ticket").on("click",function(){
    $('#ticket-group').append($("#new_ticket_form").html());
  });

  $("#add_fee").on("click",function(){
    $('#fee-group').append($("#new_fee_form").html());
  });

});