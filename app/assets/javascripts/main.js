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
    var companies_table = $('#companies-table').DataTable().order([0, 'desc']).draw();

    $('#companies-table tbody').on('click', 'a', function(event) {
      event.preventDefault();

      var to_update_company_tr = $(this).parents('tr');
      var to_update_company_data = companies_table.row(to_update_company_tr).data();
      var company_name = to_update_company_data[1];
      var is_approve = to_update_company_data[6].indexOf('批准') !== -1
      $.ajax({
        url: is_approve ? "/companies/approve" : "/companies/freeze",
        dataType: "json",
        type: "patch",
        data: {
          name: company_name
        }
      }).done(function(data) {
        if(is_approve) {
          to_update_company_data[6]='<a class=\"btn btn-danger btn-sm\" href=\"#\">冻结</a>';
        } else {
          to_update_company_data[6]='<a class=\"btn btn-success btn-sm\" href=\"#\">批准</a>';
        }
        companies_table.row(to_update_company_tr).data(to_update_company_data).draw('full-hold');

        $.notify({
          message: data.notice,
          icon: 'fa fa-check'
        }, {
          type: "info"
        });
      });
    });
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
