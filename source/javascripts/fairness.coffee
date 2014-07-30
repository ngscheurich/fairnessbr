#= require bootstrap
#= require_tree .

$ ->
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover
    placement: 'auto top',
    html: true
  $('[data-toggle="popover"]').on 'click', (e) ->
    e.preventDefault()
