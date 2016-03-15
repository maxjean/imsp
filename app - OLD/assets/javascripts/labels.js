jQuery(function($){
    $("body.labels").on("change","#label_label_type",function(){
        if($(this).val() == "quiz"){
            cont = $('[data-type-label]');
            cont.hide();
            cont.load( cont.data('type-label') );
            cont.fadeIn(1500);
        }else if($(this).val() == "score"){
            cont = $('[data-type-label]');
            cont.hide();
            cont.load( cont.data('type-label') );
            cont.fadeIn(1500);
        }else{
            setTimeout(function(){
                cont.fadeOut(800);
                setTimeout(function(){
                    $('[data-type-label]').children().remove();
                }, 1500);
            },0);
        }
    });

    /*$("body.mail_messages").on("change","#mail_message_event_id",function(){
        if($("#mail_message_recipient>option:selected").val() == "specific"){
            var cont = $('[data-specific-recipients]');
            cont.fadeOut(800, function() {
                $(this).delay(1300).children().remove();
            })
        }
        $("#mail_message_recipient>option:selected").prop('selected', false);
    });*/
});

