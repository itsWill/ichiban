# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@allowDrop = (ev) ->
  ev.preventDefault()
  if ev.target.getAttribute("nodrop") == "true"
    ev.dataTransfer.dropEffect = "none"
  else
    ev.dataTransfer.dropEffect = "all"
  return

@drag = (ev) ->
  ev.dataTransfer.setData("id", ev.target.id)
  return

@drop = (ev) ->
  ev.preventDefault();
  id = ev.dataTransfer.getData("id")
  dragged = document.getElementById(id)
  status = ev.target.getAttribute("status")
  $.ajax
    type: 'PATCH'
    url: "todos/" + id
    data: 'todo': 'status': status
    timeout: 5000
    success: () ->
      ev.target.appendChild(dragged)
    error: () ->
      alert("couldn't updated todo's :(")
  return