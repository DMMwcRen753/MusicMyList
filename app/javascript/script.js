/* global $*/
alert('Hello World');
$(function() {
  $('.navbar-toggler-icon').on('click', function(event) {
    $(this).toggleClass('active');
    $('#navbarNavDropdown').fadeToggle();
    event.preventDefault();
  });
});