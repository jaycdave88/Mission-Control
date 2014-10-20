var HelpsPoller = function(delay) {
  this.delay = delay
  this.currentTime = new Date();
  this.currentTime = this.currentTime.toJSON();
}

HelpsPoller.prototype = {

  checkDatabase: function() {
    $.ajax("/users/1/data"+this.currentTime)
        .done()
        .fail(function(){
          console.log("error");
        })
  },
  start: function(){
    setInterval(this.checkDatabase.bind(this), this.delay)
  }

}
