$(document).ready(function(){

  $("a[href='/users/new']").on("click", function(){
  $.ajax("/users/new").done(function(data){
       $("#SignupModal").append(data);
     });
  })

  $("#sticky-list").on("click", function(e){
    e.preventDefault();
  $.ajax(e.target.href).done(function(data){
       $("#StickyModal").html(data);
     });
  })
})
