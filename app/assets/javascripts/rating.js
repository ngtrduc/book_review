$(document).on('ready page:load',function(){
  $('.review-rating').raty({
    readOnly:false,
    score: function() {
      return $(this).attr('data-score');
    },
    path: '/assets/'
  });
  $('.average-review-rating').raty({
    readOnly:true,
    path: '/assets/',
    score: function() {
      return $(this).attr('data-score');
    }
  });
});
