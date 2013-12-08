# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@CommentPoller =
  poll: ->
    setTimeout @request, 1000
  request: ->
    $.get $("#comments").data("url")

jQuery ->
  CommentPoller.poll()  if $("#comments").length > 0
