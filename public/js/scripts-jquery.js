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

  $('#postButton').on('click', function(e){
    e.preventDefault();
    // grab the data from the form
    var post = $('#postfield').val();
    var profileid = $('#profile_id').val();
    var topicid = $('#topic_id').val();

    console.log("postButton clicked" + post + profileid + topicid);
    // send form data via Ajax
    $.post(
      window.location.href +'/newpost/',
      {
        description: post,
        profile_id: profileid,
        topic_id: topicid
      },
      function(data){
        if(data.success == 'success') {
          // data was saved successfully on the server
          // build the title and details paragraph
          var firstname = data.firstname;
          var lastname = data.lastname;
          var date = data.date;
          var censoredpost = data.censored;

          var fullpost = $('<div class="container" style="margin-top: 20px; margin-bottom: 20px;"><div class="row panel"><div class="col-md-8  col-xs-12"><div class="header"><h4 style="margin-left:20px;margin-top:8px;color: red;">' + firstname + ' ' + lastname + '</h4><h5 style="margin-left:20px;margin-top:8px;">' + censoredpost +'</h5><p  style="margin-left:20px;margin-top:8px;">' + date + '</p></div></div></div>');

          // add new content to events list
          $('#postHolder').append(fullpost);

        } else {
          // server data wasn't saved successfully
          alert('Server error: ' + data.error);
        }
      })
      .fail(function ( jqXHR, textStatus, errorThrown ) {
          console.log(jqXHR);
          console.log(textStatus);
          console.log(errorThrown);
      });
  });

    (function(){
        function VerticalTimeline( element ) {
            this.element = element;
            this.blocks = this.element.getElementsByClassName("js-cd-block");
            this.images = this.element.getElementsByClassName("js-cd-img");
            this.contents = this.element.getElementsByClassName("js-cd-content");
            this.offset = 0.8;
            this.hideBlocks();
        };

        VerticalTimeline.prototype.hideBlocks = function() {
            //hide timeline blocks which are outside the viewport
            if ( !"classList" in document.documentElement ) {
                return;
            }
            var self = this;
            for( var i = 0; i < this.blocks.length; i++) {
                (function(i){
                    if( self.blocks[i].getBoundingClientRect().top > window.innerHeight*self.offset ) {
                        self.images[i].classList.add("cd-is-hidden");
                        self.contents[i].classList.add("cd-is-hidden");
                    }
                })(i);
            }
        };

        VerticalTimeline.prototype.showBlocks = function() {
            if ( ! "classList" in document.documentElement ) {
                return;
            }
            var self = this;
            for( var i = 0; i < this.blocks.length; i++) {
                (function(i){
                    if( self.contents[i].classList.contains("cd-is-hidden") && self.blocks[i].getBoundingClientRect().top <= window.innerHeight*self.offset ) {
                        // add bounce-in animation
                        self.images[i].classList.add("cd-timeline__img--bounce-in");
                        self.contents[i].classList.add("cd-timeline__content--bounce-in");
                        self.images[i].classList.remove("cd-is-hidden");
                        self.contents[i].classList.remove("cd-is-hidden");
                    }
                })(i);
            }
        };

        var verticalTimelines = document.getElementsByClassName("js-cd-timeline"),
            verticalTimelinesArray = [],
            scrolling = false;
        if( verticalTimelines.length > 0 ) {
            for( var i = 0; i < verticalTimelines.length; i++) {
                (function(i){
                    verticalTimelinesArray.push(new VerticalTimeline(verticalTimelines[i]));
                })(i);
            }

            //show timeline blocks on scrolling
            window.addEventListener("scroll", function(event) {
                if( !scrolling ) {
                    scrolling = true;
                    (!window.requestAnimationFrame) ? setTimeout(checkTimelineScroll, 250) : window.requestAnimationFrame(checkTimelineScroll);
                }
            });
        }

        function checkTimelineScroll() {
            verticalTimelinesArray.forEach(function(timeline){
                timeline.showBlocks();
            });
            scrolling = false;
        };
    })();


});
