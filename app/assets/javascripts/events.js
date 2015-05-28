/**
 * Created by maxclifordjean on 28/05/15.
 */
console.log("there");

jQuery(document).ready(function($){ //init jquery
    $(".add-media-timeline-OnTop").on("click", function(){
        alert("hello");
        //$.post($(this).data("media-timeline"),{add_media_timeline:$(this).val(),_method:"get"})
    })
});

jQuery(document).ready(function($){ //init jquery
    $(".add-media-timeline-afterElement").on("click", function(){
        $.post($(this).data("media-timeline"),{add_media_timeline:$(this).val(),_method:"get"})
    })
});

