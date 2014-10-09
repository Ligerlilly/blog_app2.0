$(function(){
  $(document).on('click', '.comment_closer', function(){
    $('#comment_form').remove();
    $("#comment_button-" + this.id).show();
});
});
  

