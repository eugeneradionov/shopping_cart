ready = ->
  $('.fa-plus').on 'click', ->
    input = $(this).parent().children('#quantity')
    input.val(Number(input.val()) + 1)

  $('.fa-minus').on 'click', ->
    input = $(this).parent().children('#quantity')
    value = Number(input.val())
    if (value > 1)
      input.val(value - 1)

$(document).ready ->
  ready()
