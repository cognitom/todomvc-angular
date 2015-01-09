module.exports = ->
  ESCAPE_KEY = 27

  (scope, elem, attrs) ->
    elem.bind 'keydown', (event) ->
      scope.$apply attrs.todoEscape if event.keyCode == ESCAPE_KEY
