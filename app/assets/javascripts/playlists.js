jQuery(function($){ //init jquery
    var body = $("body.playlists");
    body.on("change","select[name='category[]']",function(){
        $.post($(this).data("url"),{category_ids:$(this).val(),_method:"put"})
    });


    $("body.playlists").change(function(){
        $(this).find('option:selected').css('background-color','red');
    }).trigger('change');
});