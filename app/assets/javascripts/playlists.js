jQuery(function($){ //init jquery
    var body = $("body.playlists");
    body.on("change","select[name='category[]']",function(){
        $.post($(this).data("url"),{category_ids:$(this).val(),_method:"put"})
    });

    $("body.playlists").change(function(){
        $(this).find('option:selected').css('background-color','#B3B3B3');
    }).trigger('change');

    function stylize_selected_contents(element){
        $("." + selected_categories["playlist_id"] + " #category option:eq(" + element.index + ")").css('background-color', '#f2f2f2');
    }

    //parsing JSON datas & select corresponding DOM datas for stylizing
    $.ajax({
        type: 'GET',
        url: '/playlists.json',
        dataType: 'json',
        success: function (data) {
            if(data["selected_categories"]){
                for( var i=0; i < data["selected_categories"].length; i++){
                    selected_categories = data["selected_categories"][i][0];
                    if(selected_categories){
                        for( var j=0; j < selected_categories["categories_ids"][0].length; j++) {
                            current_categorie = selected_categories["categories_ids"][0][j];
                            dom_elements = $("." + selected_categories["playlist_id"] + " #category option");
                            _.each(dom_elements, function(item){
                                if((item.value) == current_categorie){
                                    stylize_selected_contents(item);
                                }
                            });
                        }
                    }
                }
            }
        }
    });
});
