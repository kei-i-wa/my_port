$(document).on 'turbolinks:load', ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote
      height: 300,
      lang: "ja-JP",
      fontNames: ["sans-serif"],

