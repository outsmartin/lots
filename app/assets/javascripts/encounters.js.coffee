# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  health = parseInt $("#encounter_health").val()
  $("#slider").slider
    range: "min"
    value: health
    min: 0
    max: 100
    slide: (event, ui) ->
      $("#encounter_health").val ui.value + "%"

  $("#encounter_health").val $("#slider").slider("value") + "%"
  $("#encounter_started_at").datetimepicker
    dateFormat: 'dd.mm.yy'

