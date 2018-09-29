document.addEventListener("turbolinks:load", function() {
  "use strict";

  var treeviewMenu = $('.app-menu');

  // Toggle Sidebar
  $('[data-toggle="sidebar"]').click(function(event) {
    event.preventDefault();
    $('.app').toggleClass('sidenav-toggled');
  });

  // Activate sidebar treeview toggle
  $("[data-toggle='treeview']").click(function(event) {
    event.preventDefault();
    if(!$(this).parent().hasClass('is-expanded')) {
      treeviewMenu.find("[data-toggle='treeview']").parent().removeClass('is-expanded');
    }
    $(this).parent().toggleClass('is-expanded');
  });

  // Set initial active toggle
  $("[data-toggle='treeview.'].is-expanded").parent().toggleClass('is-expanded');

  //Activate bootstrip tooltips
  $("[data-toggle='tooltip']").tooltip();

  var notice_text = $('body').data('notice');
  if(notice_text) {
    $.notify({
      message: notice_text,
      icon: 'fa fa-check'
    },{
      type: "info"
    });
  }
  var alert_text = $('body').data('alert');
  if(alert_text) {
    $.notify({
      message: alert_text,
      icon: 'fa fa-alert'
    },{
      type: "warning"
    });
  }

  // Login Page Flipbox control
  $('.login-content [data-toggle="flip"]').click(function() {
    $('.login-box').toggleClass('flipped');
    return false;
  });

  if ($("#users-table_wrapper").length == 0) {
    $('#users-table').DataTable().order([0, 'desc']).draw();
  }
  if ($("#companies-table_wrapper").length == 0) {
    $('#companies-table').DataTable().order([0, 'desc']).draw();
  }
  if ($("#courses-table_wrapper").length == 0) {
    $('#courses-table').DataTable().order([0, 'desc']).draw();
  }
  if ($("#course-trainees-table_wrapper").length == 0) {
    $('#course-trainees-table').DataTable();
  }

  $('#circular-vertical-markets-select').select2();
  $('#course-vertical-markets-select').select2();
  $('#to-filter-company-id').select2();
})
