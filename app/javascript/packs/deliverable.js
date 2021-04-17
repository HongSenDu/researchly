$(function () {
    $('.remove-file').click(function () {
        $(this).parent('.col').parent('.file').remove();
    });
});