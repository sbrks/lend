$(document).ready(function() {
  $('select').material_select();
  $('.modal-trigger').leanModal();
  //parallax slider
  $('.parallax').parallax();
  $('.slider').slider({
    full_width: true,
    height: 250,
    transition: 200,
    interval: 1500
    });

//hover
  $('.materialboxed').hover(
  function() { $(this).addClass('hover') },
  function() { $(this).removeClass('hover') } 
  );



});
//dropdown
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


