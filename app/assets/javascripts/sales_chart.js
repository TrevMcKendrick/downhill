        new Morris.Line({
  // ID of the element in which to draw the chart.
  element: 'sales_chart',
  // Chart data records -- each entry in this array corresponds to a point on
  // the chart.
  data: $('#sales_chart').data('sales'),
  // The name of the data record attribute that contains x-values.
  xkey: 'created_at',
  // A list of names of data record attributes that contain y-values.
  ykeys: ['amount'],
  // Labels for the ykeys -- will be displayed when you hover over the
  // chart.
  labels: ['Revenue'],

  preUnits: "$",

  xLabelFormat: function (date) {
  var m_names = new Array("Jan", "Feb", "Mar", 
  "Apr", "May", "June", "July", "Aug", "Sep", 
  "Oct", "Nov", "Dec"); 
    var curr_date = date.getDate();
    var curr_month = date.getMonth();
    var curr_year = date.getFullYear();
    return m_names[curr_month] + " " + curr_date + ", " + curr_year; 
  }
});