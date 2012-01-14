# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

root = exports ? window
$ = jQuery

$ ->
  $(document).on 'click', 'button', (event) ->
    $(this)
      .toggleClass('dibsy')
      .toggleClass('called')
    return
  return
