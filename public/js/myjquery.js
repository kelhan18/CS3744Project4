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

    $("#LewisCit").click(function() {
            alert('Valiantly placing himself at the head of his squad, Cpl. Bausell led the charge forward against a hostile pillbox which was covering a vital sector of the beach and, as the first to reach the emplacement, immediately started firing his automatic into the aperture while the remainder of his men closed in on the enemy. Swift to act, as a Japanese grenade was hurled into their midst, Cpl. Bausell threw himself on the deadly weapon, taking the full blast of the explosion and sacrificing his own life to save his men. His unwavering loyalty and inspiring courage reflect the highest credit upon Cpl. Bausell and the U.S. Naval Service. He gallantly gave his life for his country.');
    });

    $("#ArthurCit").click(function() {
            var cit = 'Boldly taking the initiative when his platoon\'s left flank advance was held up by the fire of Japanese troops concealed in strongly fortified positions, Pfc. Jackson unhesitatingly proceeded forward of our lines and, courageously defying the heavy barrages, charged a large pillbox housing approximately 35 enemy soldiers. Pouring his automatic fire into the opening of the fixed installation to trap the occupying troops, he hurled white phosphorus grenades and explosive charges brought up by a fellow Marine, demolishing the pillbox and killing all of the enemy. Advancing alone under the continuous fire from other hostile emplacements, he employed similar means to smash two smaller positions in the immediate vicinity. Determined to crush the entire pocket of resistance although harassed on all sides by the shattering blasts of Japanese weapons and covered only by small rifle parties, he stormed one gun position after another, dealing death';
            var cit2= '  and destruction to the savagely fighting enemy in his inexorable drive against the remaining defenses, and succeeded in wiping out a total of 12 pillboxes and 50 Japanese soldiers. Stouthearted and indomitable despite the terrific odds. Pfc. Jackson resolutely maintained control of the platoon\'s left flank movement throughout his valiant 1-man assault and, by his cool decision and relentless fighting spirit during a critical situation, contributed essentially to the complete annihilation of the enemy in the southern sector of the island. His gallant initiative and heroic conduct in the face of extreme peril reflect the highest credit upon Pfc. Jackson and the U.S. Naval Service.';
            alert(cit + cit2);
    });

    $("#RichardCit").click(function() {
            var cit = 'Unhesitatingly volunteering for the extremely hazardous mission of evacuating a wounded comrade from the front lines, Pfc. Kraus and three companions courageously made their way forward and successfully penetrated the lines for some distance before the enemy opened with an intense, devastating barrage of hand grenades which forced the stretcher party to take cover and subsequently abandon the mission. While returning to the rear, they observed two men approaching who appeared to be Marines and immediately demanded the password. When, instead of answering, one of the two Japanese threw a hand grenade into the midst of the group, Pfc. Kraus heroically flung himself upon the grenade and, covering it with his body, absorbed the full impact of the explosion and was instantly killed. By his prompt action and great personal valor in the face of almost certain death, he saved the lives of his three companions, and his loyal spirit of self-sacrifice reflects the highest';
            var cit2 = ' credit upon himself and the U.S. Naval Service. He gallantly gave his life for his comrades.';
            alert(cit + cit2);
    });

    $("#JohnCit").click(function() {
            alert('When a Japanese soldier emerged from a cave in a cliff directly below an observation post and suddenly hurled a grenade into the position from which two of our men were directing mortar fire against enemy emplacements, Pfc. New instantly perceived the dire peril to the other Marines and, with utter disregard for his own safety, unhesitatingly flung himself upon the grenade and absorbed the full impact of the explosion, thus saving the lives of the two observers. Pfc. New\'s great personal valor and selfless conduct in the face of almost certain death reflect the highest credit upon himself and the U.S. Naval Service. He gallantly gave his life for his country. ');
    });

    $("#WesleyCit").click(function() {
            alert('Stationed with another Marine in an advanced position when a Japanese handgrenade landed in his foxhole Pfc. Phelps instantly shouted a warning to his comrade and rolled over on the deadly bomb, absorbing with his own body the full, shattering Impact of the exploding charge. Courageous and indomitable, Pfc. Phelps fearlessly gave his life that another might be spared serious injury, and his great valor and heroic devotion to duty in the face of certain death reflect the highest credit upon himself and the U.S. Naval Service. He gallantly gave his life for his country. ');
    });

    $("#EverettCit").click(function() {
            cit = 'Subjected to pointblank cannon fire which caused heavy casualties and badly disorganized his company while assaulting a steep coral hill, Capt. Pope rallied his men and gallantly led them to the summit in the face of machinegun, mortar, and sniper fire. Forced by widespread hostile attack to deploy the remnants of his company thinly in order to hold the ground won, and with his machineguns out of order and insufficient water and ammunition, he remained on the exposed hill with 12 men and one wounded officer determined to hold through the night. ';
            cit2 = 'Attacked continuously with grenades, machineguns, and rifles from three sides, he and his valiant men fiercely beat back or destroyed the enemy, resorting to hand-to-hand combat as the supply of ammunition dwindled, and still maintaining his lines with his 8 remaining riflemen when daylight brought more deadly fire and he was ordered to withdraw. His valiant leadership against devastating odds while protecting the units below from heavy Japanese attack reflects the highest credit upon Capt. Pope and the U.S. Naval Service. ';
            alert(cit + cit2);
    });

    $("#CharlesCit").click(function() {
            cit = 'Shortly after his leader ordered a withdrawal upon discovering that the squad was partly cut off from their company as a result of the rapid advance along an exposed ridge during an aggressive attack on the strongly entrenched enemy, Pfc. Roan and his companions were suddenly engaged in a furious exchange of handgrenades by Japanese forces emplaced in a cave on higher ground and to the rear of the squad. Seeking protection with four other Marines in a depression in the rocky, broken terrain, Pfc. Roan';
            cit2 = ' was wounded by an enemy grenade which fell close to their position and, immediately realizing the eminent peril to his comrades when another grenade landed in the midst of the group, unhesitatingly flung himself upon it, covering it with his body and absorbing the full impact of the explosion. By his prompt action and selfless conduct in the face of almost certain death, he saved the lives of four men. His great personal valor reflects the highest credit upon himself and the U.S. Naval Service. He gallantly gave his life for his comrades. ';
            alert(cit + cit2);
    });

    $("#CarltonCit").click(function() {
            alert(' Before permitting his men to use an enemy dugout as a position for an 81-mm. mortar observation post, 1st Lt. Rouh made a personal reconnaissance of the pillbox and, upon entering, was severely wounded by Japanese rifle fire from within. Emerging from the dugout, he was immediately assisted by 2 Marines to a less exposed area but, while receiving first aid, was further endangered by an enemy grenade which was thrown into their midst. Quick to act in spite of his weakened condition, he lurched to a crouching position and thrust both men aside, placing his own body between them and the grenade and taking the full blast of the explosion himself. His exceptional spirit of loyalty and self-sacrifice in the face of almost certain death reflects the highest credit upon 1st Lt. Rouh and the U.S. Naval Service. ');
    });

});
