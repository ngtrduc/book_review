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
//= require jquery_ujs
//= require bootstrap
//= require dataTables/jquery.dataTables
//= require turbolinks
//= require_tree .
//= require adminlte
//= require moment
//= require bootstrap-datetimepicker
//= require pickers
//= require highcharts
//= require highcharts/highcharts-more

var dataTab = function() {
  $('#data_table').DataTable();
}
$(document).ready(dataTab);
$(document).on('page:load', dataTab);


function set_timeout() {
  $('.alert').delay(3000).slideUp();
}
$(document).ready(set_timeout);
$(document).on('page:load', set_timeout);

function image_preview() {
  var preview = $(".upload-preview img");

  $(".file").change(function(event){
     var input = $(event.currentTarget);
     var file = input[0].files[0];
     var reader = new FileReader();
     reader.onload = function(e){
         image_base64 = e.target.result;
         preview.attr("src", image_base64);
     };
     reader.readAsDataURL(file);
  });
}
$(document).ready(image_preview);
$(document).on('page:load', image_preview);

$(document).ready(function() {
  var data_chart = $('#new-review-chart').data('chart');
  $('#new-review-chart').highcharts({
    chart: {
      type: 'column'
    },
    title: {
      text: "New Review count per day"
    },
    xAxis: {
      type: 'category'
    },
    yAxis: {
      allowDecimals: false,
      min: 0,
      title: {
        text: "New Reviews'count"
      }
    },
    legend: {
      enabled: false
    },
    credits: {
      enabled: false
    },
    tooltip: {
      pointFormat: "Number of reviews"
    },
    series: [{
      data: data_chart,
      dataLabels: {
        enabled: true,
        color: '#FFFFFF',
        align: 'center',
        format: '{point.y:.1f}',
        y: 5,
        style: {
          fontSize: '16px',
          fontFamily: 'Verdana, sans-serif'
        }
      }
    }]
  });
});
