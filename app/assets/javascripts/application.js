// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

jQuery(document).ready(function(){
    jQuery('button').click(function(){
        var id = jQuery(this).parent().attr('id');
        var li = jQuery('li[id=' + id + ']');
        jQuery(this).attr('disabled', true)
        jQuery(this).after('<img src="images/ajax-loader.gif" alt="" />');
        jQuery.ajax({
            url: '/rsmapi_ajax/get',
            type: 'post',
            dataTypeString: 'json',
            data: {
                id: id
            },
            success: function(data) {
                if(data.status == 'success') {
                    jQuery(li).children('button').after('<a href="video/' + id + '.flv">flv</a> <a href="video/' + id + '.avi">avi</a>');
                    jQuery(li).children('button').remove();
                }
            },
            complete: function() {
                jQuery(li).children('img').remove();
            }
        })
        return false;
    });

    //for cucumber test
    jQuery('#ready').ajaxStart(function(){jQuery(this).hide();}).ajaxStop(function(){jQuery(this).show();});
});