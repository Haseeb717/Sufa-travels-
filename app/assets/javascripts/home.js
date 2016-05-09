$(document).ready(function(){

	function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          var last = input.id;
          reader.onload = function (e) {
            var file = e.target;
            $('.preview_image').attr('src', e.target.result);
            $('.preview_image').show();
            $('.edit_image').hide();
          }
          reader.readAsDataURL(input.files[0]);
      }
      else
      {
        var last = input.id;
        $('.preview_image').hide();
      }
    } 
	$(document).on('change', '.image', function(){
	  readURL(this);
	});

  $('.start_date').datepicker({
    dateFormat: 'yy-mm-dd',
    onSelect: function () {
        $('.end_date').datepicker('option', {
            minDate: $(this).datepicker('getDate')
        });
    }
  });

  $('.end_date').datepicker({
      dateFormat: 'yy-mm-dd' 
  });


  




	

});

