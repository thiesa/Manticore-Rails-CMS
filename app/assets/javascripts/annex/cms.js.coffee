ready = ->
  post_url = "/annex/blocks"

  redactor_options = {
    focus: true
    buttonSource: true
    plugins: [
      "definedlinks"
      "fontsize"
      "fontcolor"
      "table"
      "filemanager"
      "imagemanager"
      "video"
      "clips"
      "fullscreen"
      "save"
    ]
    toolbarFixed: false
    formatting: ['p', 'blockquote', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6']
    formattingAdd: [
      {
        tag: 'pre'
        title: 'pre'
      }
      {
        tag: 'code'
        title: 'code'
      }
    ]
  }

  # cmd+s saves the editor contents
  $(window).keydown (e) ->
    $(".redactor").addClass "active"  if (e.which is "17") and (e.ctrlKey or e.metaKey)
    return

  # on click of .redactor, fire up a redactor instance
  $("body").on "click", ".redactor", ->
    unless $(this).hasClass("redactor-editor")
      $(this).redactor(redactor_options)

    return

  return

$(document).ready(ready)
$(document).on('page:load', ready)
