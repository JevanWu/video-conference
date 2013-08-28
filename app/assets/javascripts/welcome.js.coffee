# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#Put event listeners into place
window.addEventListener "DOMContentLoaded", (->
  #grab elements, create settings, etc.
  canvas = document.getElementById("canvas")
  context = canvas.getContext("2d")
  video = document.getElementById("video")
  videoObj = video: true
  errBack = (error) ->
    console.log "Video capture error: ", error.code

  # put video listeners into place
  if navigator.getUserMedia
    navigator.getUserMedia videoObj, ((stream) ->
      video.src = stream
      video.play()
    ), errBack
  else if navigator.webkitGetUserMedia
    navigator.webkitGetUserMedia videoObj, ((stream) ->
      video.src = window.webkitURL.createObjectURL(stream)
      video.play()
    ), errBack

  document.getElementById("snap").addEventListener "click", (->
    context.drawImage(video, 0, 0, 640, 480)
  )
  
), false
