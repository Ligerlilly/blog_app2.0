$(function(){
  
  $(document).ready(function(){ 
    $(document).on('click', '.comment_closer', function(){
      $('#comment_form').remove();
      $("#comment_button-" + this.id).show();
      $('#show_comments-' + this.id).show();
    });
     
    $(document).on('click', '.show_comments', function(){
      var entry_id = /\d+/.exec(this.id);
      $('#comment_list-' + entry_id).show();
      $('#show_comments-' + entry_id).hide();
    });
     
  });
}());
  

