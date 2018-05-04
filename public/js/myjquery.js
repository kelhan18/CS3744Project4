$(document).ready(function(){
    $('#input-username').focus(function(){

        $('#input-username').blur();

    });

  //On button press show information to update table
  $('#addRelButton').click(function(){
    $('#addRelForm').show();
    $('#eventName').focus();
    $('#addRelForm').find('.text').each(function(){
        $(this).val('');
    });
  });

  //On button press insert new information into table
  $("#submitRelButton").click(function() {
          var name = $("#eventName").val();
          var relationship = $("#eventRelationship").val();
          var example = "<tr><td>" + name +"</td><td>" +
              relationship + "</td></tr>";
          $("#relationships").append(example);
          var data = "<input type='hidden' name='name[]' value='"+name+"' style='display:none;'>" +
          "</input><input type='hidden' name='relationship[]' value='"+relationship+"' style='display:none;'></input>"
          $(".addfam").append(data);
  });

  //On button press insert new information into table
  $("#LewisCit").click(function() {
          alert('Valiantly placing himself at the head of his squad, Cpl. Bausell led the charge forward against a hostile pillbox which was covering a vital sector of the beach and, as the first to reach the emplacement, immediately started firing his automatic into the aperture while the remainder of his men closed in on the enemy. Swift to act, as a Japanese grenade was hurled into their midst, Cpl. Bausell threw himself on the deadly weapon, taking the full blast of the explosion and sacrificing his own life to save his men. His unwavering loyalty and inspiring courage reflect the highest credit upon Cpl. Bausell and the U.S. Naval Service. He gallantly gave his life for his country.');
  });

  $("#ArthurCit").click(function() {
          alert();
  });

  $("#RichardCit").click(function() {
          var cit = 'Unhesitatingly volunteering for the extremely hazardous mission of evacuating a wounded comrade from the front lines, Pfc. Kraus and three companions courageously made their way forward and successfully penetrated the lines for some distance before the enemy opened with an intense, devastating barrage of hand grenades which forced the stretcher party to take cover and subsequently abandon the mission. While returning to the rear, they observed two men approaching who appeared to be Marines and immediately demanded the password. When, instead of answering, one of the two Japanese threw a hand grenade into the midst of the group, Pfc. Kraus heroically flung himself upon the grenade and, covering it with his body, absorbed the full impact of the explosion and was instantly killed. By his prompt action and great personal valor in the face of almost certain death, he saved the lives of his three companions, and his loyal spirit of self-sacrifice reflects the highest';
          var cit2 = ' credit upon himself and the U.S. Naval Service. He gallantly gave his life for his comrades.';
          alert(cit + cit2);
  });



  // Removes the last relationship added
  $('#removeLastButton').on("click", function(){
    $('#relationships tr:last').remove();
  });

  // When Deceased radio button is pressed, show death date input
  $('input[type=radio][name=status]').change(function() {
        if (this.value == 'Deceased') {
            $('input[type=date][name=Deathdate]').show();
            $('#ifDead').show();
        }
        else if (this.value == 'Alive') {
            $('input[type=date][name=Deathdate]').hide();
            $('#ifDead').hide();
        }
    });

});
