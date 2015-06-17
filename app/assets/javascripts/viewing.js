/**
 * Created by maxclifordjean on 17/06/15.
 */
jQuery(document).ready(function($){ //init jquery
    $(".media-like-button").on("click", function(){
        $.post($(this).data("button-like"),{media_like_button:$(this).val(),_method:"get"})
    })
});

jQuery(document).ready(function($){ //init jquery
    $(".media-dislike-button").on("click", function(){
        $.post($(this).data("dislike-button"),{media_dislike_button:$(this).val(),_method:"get"})
    })
});