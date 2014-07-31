#= require bootstrap/transition
#= require bootstrap/tooltip
#= require bootstrap/popover
#= require_tree .

$ ->
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover
    placement: 'auto top',
    html: true
  $('[data-toggle="popover"]').on 'click', (e) ->
    e.preventDefault()
  $('body').on 'click', (e) ->
    $('[data-toggle="popover"]').each ->
      if !$(this).is(e.target)
        $(this).popover('hide')
