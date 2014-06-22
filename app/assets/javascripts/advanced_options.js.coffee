$ ->
  $(".advanced_options_toggler").click (event) ->
    event.preventDefault()
    $(".advanced_options").toggle()

    $("html, body").animate scrollTop: $(this).offset().top, 250
