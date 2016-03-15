/**
 * Created by maxclifordjean on 18/05/15.
 */
var video = document.querySelector('video');
video.style.top = "15%";
$("#player").children().css("width","100%");
/*
$.ajax({
    url: "/test"
}).done(function(html) {
    return $("#results").append(html);
});*/

jQuery(document).ready(function($){ //init jquery
    $(".media-like-button").on("click", function(){
        alert("work");
        $.post($(this).data("button-like"),{media_like_button:$(this).val(),_method:"get"})
    })
});

jQuery(document).ready(function($){ //init jquery
    $(".media-dislike-button").on("click", function(){
        $.post($(this).data("dislike-button"),{media_dislike_button:$(this).val(),_method:"get"})
    })
});

/*
jQuery(document).ready(function($){ //init jquery
    $(".add-media-timeline-OnTop").on("click", function(){
        $(".media_timelines-list-body").prepend()
        //$.post($(this).data("media-timeline"),{add_media_timeline:$(this).val(),_method:"get"})
    })
});

jQuery(document).ready(function($){ //init jquery
    $(".add-media-timeline-afterElement").on("click", function(){
        $.post($(this).data("media-timeline"),{add_media_timeline:$(this).val(),_method:"get"})
    })
});
*/
