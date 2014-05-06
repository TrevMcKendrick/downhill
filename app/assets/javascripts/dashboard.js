$(document).ready(function() {
  $('#sales_date_range').daterangepicker(
  { 
    format: 'YYYY-MM-DD',
    startDate: $.now,
    endDate: $.now
  },
  function(start, end, label) {
    var now = new Date();
    var start_days_ago = (now - start) / 86400000;
    var end_days_ago = (now - end) / 86400000;
    start_days_ago = start_days_ago.toFixed();
    end_days_ago = end_days_ago.toFixed();
  }
);

});

function start_day() {
 return start_days_ago;
}