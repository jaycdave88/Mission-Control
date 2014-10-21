var HelpsPoller = function(delay, view) {
  this.delay = delay;
  this.currentTime = new Date();
  this.currentTime = this.currentTime.toJSON();
  this.view = view;
}

HelpsPoller.prototype = {

  checkDatabase: function() {
    var that = this
    $.ajax("/users/"+this.user_id+"/recent/"+this.currentTime)
        .done(function(data){
          that.view.update(data.length);
        })
        .fail(function(){
          console.log("error");
        })
  },
  setUser: function(user_id){
    this.user_id = user_id;
  },
  start: function(){
    setInterval(this.checkDatabase.bind(this), this.delay)
  }

}

var NotificationView = function(){
  this.area = "#notifications"
}

NotificationView.prototype = {

  update: function(value){
    $(this.area).find("a").text(value)
  }

}
