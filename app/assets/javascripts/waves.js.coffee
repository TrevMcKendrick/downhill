
// $ ()->
//   $("form.new_wave").on "ajax:success", (event, data, status, xhr) ->
//     $("form.new_wave")[0].reset()
//     $('#new_wave_modal').modal('hide')

//     $('#error_explanation').hide()

//   $("form.new_wave").on "ajax:error", (event, xhr, status, error) ->
//     errors = jQuery.parseJSON(xhr.responseText)
//     errorcount = errors.length
//     $('#error_explanation').empty()
//     if errorcount > 1
//       $('#error_explanation').append('<div class="alert alert-error">The form contains ' + errorcount + ' errors.</div>')
//     else
//       $('#error_explanation').append('<div class="alert alert-error">The form contains 1 error</div>')
//     $('#error_explanation').append('<ul>')
//     for e in errors
//       $('#error_explanation').append('<li>' + e + '</li>')
//     $('#error_explanation').append('</ul>')
//     $('#error_explanation').show()