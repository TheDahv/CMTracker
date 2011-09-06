$(function () {
  if (document.location.pathname === '/children/checkin') {
    // Home page JavaScript
    $('input[type="checkbox"]').click(function (e) {
      var dataset = e.currentTarget.dataset,
          name = '',
          id = '',
          checkin_form;
      
      for(var d in dataset) {
        console.log(dataset[d]);
      }
      name = dataset['name'];
      id = dataset['id'];

      console.log(e);

      checkin_form = $('.checkin_form');
      checkin_form.show();
      checkin_form.html(checkin_form.html().replace(/{replace_name}/g, name));

      $('.checkin_form input[type="button"]').click(function (b) {
        var action = b.currentTarget.value;
        if (action === 'save') {
          // Do some ajax stuff 
          $(e.currentTarget).parent().remove();
        }
        console.log($(e.currentTarget).prop('checked', false));
        checkin_form.hide();
      });
    });
  }
});
