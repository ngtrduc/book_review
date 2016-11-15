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
//= require dataTables/jquery.dataTables
//= require bootstrap
//= require turbolinks
//= require_tree .
//= require social-share-button
//= require jquery.raty
//= require ratyrate

var make_select_box = function(){
  $('.select-category').niceSelect();
}
$(document).ready(make_select_box);
$(document).on('page:load', make_select_box);

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

function textAreaAdjust(o) {
  o.style.height = "1px";
  o.style.height = (25+o.scrollHeight)+"px";
}

function keepStateNavUser() {
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      // save the latest tab; use cookies if you like 'em better:
      localStorage.setItem('lastTab', $(this).attr('href'));
  });

  // go to the latest tab, if it exists:
  var lastTab = localStorage.getItem('lastTab');
  if (lastTab) {
      $('[href="' + lastTab + '"]').tab('show');
  }
}

$(document).ready(keepStateNavUser);
$(document).on('page:load', keepStateNavUser);
