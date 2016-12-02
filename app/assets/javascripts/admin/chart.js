function review_chart() {
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
};

$(document).ready(review_chart);
$(document).on('page:load', review_chart);

function request_chart() {
  var data_chart = $('#new-request-chart').data('chart');
  $('#new-request-chart').highcharts({
    chart: {
      type: 'column'
    },
    title: {
      text: "New Request's count per day"
    },
    xAxis: {
      type: 'category'
    },
    yAxis: {
      allowDecimals: false,
      min: 0,
      title: {
        text: "New Requests'count"
      }
    },
    legend: {
      enabled: false
    },
    credits: {
      enabled: false
    },
    tooltip: {
      pointFormat: "Number of requests"
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
};

$(document).ready(request_chart);
$(document).on('page:load', request_chart);

$(document).ready(review_chart);
$(document).on('page:load', review_chart);

function user_chart() {
  var data_chart = $('#new-user-chart').data('chart');
  $('#new-user-chart').highcharts({
    chart: {
      type: 'column'
    },
    title: {
      text: "New registrations per day"
    },
    xAxis: {
      type: 'category'
    },
    yAxis: {
      allowDecimals: false,
      min: 0,
      title: {
        text: "New Users'count"
      }
    },
    legend: {
      enabled: false
    },
    credits: {
      enabled: false
    },
    tooltip: {
      pointFormat: "Number of Users"
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
};

$(document).ready(user_chart);
$(document).on('page:load', user_chart);
