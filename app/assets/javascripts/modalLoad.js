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

  $.ajax("/sessions/status")
      .done(function(data){
        if (data.logged){
          poller = new HelpsPoller(5000, new NotificationView());
          poller.setUser(data.user_id);
          poller.start();
        }
      })
})
