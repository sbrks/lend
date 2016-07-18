$(document).ready(function() {
  $('select').material_select();
  $('.modal-trigger').leanModal();
  $('.parallax').parallax();


  $('.materialboxed').hover(
  function() { $(this).addClass('hover') },
  function() { $(this).removeClass('hover') } 
  );





});
//if i use this, remove turbolinks gem

  $('.dropdown-button').dropdown({
      inDuration: 500,
      outDuration: 225,
      constrain_width: false, // Does not change width of dropdown to that of the activator
      hover: true, // Activate on hover
      gutter: 0, // Spacing from edge
      belowOrigin: false, // Displays dropdown below the button
      alignment: 'left' // Displays dropdown with edge aligned to the left of button
    }
  );


