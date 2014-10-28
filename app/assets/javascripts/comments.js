$(function(){
  
  $(document).ready(function(){ 
    $(document).on('click', '.comment_closer', function(){
      $('#comment_form').remove();
      $("#comment_button-" + this.id).show();
    });
  
  
  	
  
   
    
    
    $(document).on('click', '.show_comments', function(){
      $('#comment_list-' + this.id).show();
      $('#' + this.id).hide();
    });
    
   
    
  });
}());
  

