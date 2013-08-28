// Put event listeners into place
window.addEventListener("DOMContentLoaded", function() {
// Grab elements, create settings, etc.
  var canvas = document.getElementById("canvas"),
  context = canvas.getContext("2d"),
  video = document.getElementById("video"),
  videoObj = { "video": true },
  errBack = function(error) {
    console.log("Video capture error: ", error.code); 
  };

  //Put video listeners into place
  if (navigator.getUserMedia) {
    navigator.getUserMedia(videoObj, function(stream) {
      video.src = stream;
      video.play();
    }, errBack);
  }else if(navigator.webkitGetUserMedia) {
    navigator.webkitGetUserMedia(videoObj, function(stream) {
      video.src = window.webkitURL.createObjURL(stream);
      video.play();
    }, errBack);
  }
}, false);
