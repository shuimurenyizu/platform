editor_ctrl = ($scope) ->
  $scope.editor = 'neal'



$ ->

  $('#core_editor').bind 'input', ->
    alert 'sb'
    if window.getSelection().anchorNode.parentElement.nodeName != 'WORD' 
      alert window.getSelection().anchorNode.parentElement.nodeName

  $('#core_editor').keypress (e) ->
    e.preventDefault()
    alert e.keyCode
    
    

  $('word').bind 'dblclick', ->
    $('.selected_word').removeClass('selected_word')
    $(this).addClass('selected_word')
    $('.slected_word').removeClass('selected_word')
    $(this).addClass('selected_word')
    $('#attr_pick').html('')
    word = $(this).text()
    $.ajax 'query',
      type: 'GET'
      data: {'word': word}
      dataType: 'json'
      success: (data)->
        $(data.result).each (index, elem)->
          $('#attr_pick').append("<div><input type='radio' name='meaning' value=#{index}>#{elem}</div>")
        $('#attr_pick').append('<a id="save_class" class="btn btn-success">保存</a>')
        $('#save_class').bind 'click', ->
          if (selected_value = $('input[name=meaning]:checked').val())?
            $('.selected_word').attr('meanging', selected_value)
          else
            alert 'choose one'

