$(document).ready(function(){

  //alert('document is ready');

  $('#addEventButton').click(function(){
    //alert('clicked');
    // console.log("add event clicked");
    $('#addEventForm').show(); // show the form
    $('#eventYear').focus(); // position cursor at event year

    // clear the text boxes
    $('#addEventForm').find('.text').each(function(){
      $(this).val('');
    });
  });

  $('#submitEventButton').click(function(){
    // build the title
    var year = $('#eventYear').val();
    var title = $('#eventTitle').val();
    var fullTitle = $('<h4>' + year + ' - ' + title + '</h4>');

    // build the details paragraph
    var details = $('#eventDescription').val();
    var fullDetails = $('<p class="details">' + details + '</p>');

    // add new content to events list
    $('#events').append(fullTitle).append(fullDetails);

    // now that we've submitted the form, hide it
    $('#addEventForm').hide();
  });


});
