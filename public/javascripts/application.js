$(function () {
  var filter;

  if (document.location.pathname === '/') {
    $('.checkin_button').click(function (e) {
      var child_id, service_id, classroom_id;
      child_id = e.currentTarget.dataset['id'];

      service_id = $('#service_id').val();
      classroom_id = $('#class_id').val();

      $.post('/processCheckin', 
        {
          service_id: service_id,
          classroom_id: classroom_id,
          child_id: child_id
        },
        function (data) {
          var targetButton = $(e.currentTarget);

          if (data === 'OK') {
            // Success! 
            // Add a notification
            targetButton.before("<p>'Checked in'</p>");
            targetButton.parent().addClass("checked_in");
            targetButton.remove();
          } else {
            console.log(data);
          }
        }
      );
    });

    filter = function (q) {
      $('.child_listing > article').each(function () {
        ($(this).text().search(new RegExp(q, 'i')) < 0) ? $(this).hide() : $(this).show();
      });
    };

    $('#child_search').keyup(function (e) {
      if (e.keyCode === 27 || $(this).val() === '') {
        // handle esc. clear out text and bring back all kids
        $('#child_search').val('');
        $('.child_listing > article').show();        
      } else {
        filter($(this).val());  
      }
    });
  }

  if (document.location.pathname === '/reports/attendances') {
    $('#start_date, #end_date').datepicker({
      defaultDate: '+lw',
      changeMonth: true,
      numberOfMonths: 3,
      onSelect: function( selectedDate ) {
        var option = this.id == "start_date" ? "minDate" : "maxDate",
          instance = $( this ).data( "datepicker" ),
          date = $.datepicker.parseDate(
                        instance.settings.dateFormat ||
                                    $.datepicker._defaults.dateFormat,
                                                selectedDate, instance.settings );
        dates.not( this ).datepicker( "option", option, date );
      }
    });
  }
});
