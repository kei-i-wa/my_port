$(document).on 'turbolinks:load', ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote
      height: 300,
      toolbar: [
                ["style", ["style"]]
                ["color", ["color"]],
                ["style", ["bold", "italic"]],
                ['insert', ['picture', 'link']],
                ["table", ["table"]],
             ]