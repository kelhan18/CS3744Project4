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
          alert(Boldly taking the initiative when his platoons left flank advance was held up by the fire of Japanese troops concealed in strongly fortified positions, Pfc. Jackson unhesitatingly proceeded forward of our lines and, courageously defying the heavy barrages, charged a large pillbox housing approximately 35 enemy soldiers. Pouring his automatic fire into the opening of the fixed installation to trap the occupying troops, he hurled white phosphorus grenades and explosive charges brought up by a fellow Marine, demolishing the pillbox and killing all of the enemy. Advancing alone under the continuous fire from other hostile emplacements, he employed similar means to smash two smaller positions in the immediate vicinity. Determined to crush the entire pocket of resistance although harassed on all sides by the shattering blasts of Japanese weapons and covered only by small rifle parties, he stormed one gun position after another, dealing death and destruction to the savagely fighting enemy in his inexorable drive against the remaining defenses, and succeeded in wiping out a total of 12 pillboxes and 50 Japanese soldiers. Stouthearted and indomitable despite the terrific odds. Pfc. Jackson resolutely maintained control of the platoons left flank movement throughout his valiant 1-man assault and, by his cool decision and relentless fighting spirit during a critical situation, contributed essentially to the complete annihilation of the enemy in the southern sector of the island. His gallant initiative and heroic conduct in the face of extreme peril reflect the highest credit upon Pfc. Jackson and the U.S. Naval Service.);
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
