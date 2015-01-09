STORAGE_ID = 'todos-angularjs-coffee'

module.exports =
  get: ->
    todos = JSON.parse localStorage.getItem STORAGE_ID
    todos or []
  put: (todos) ->
    localStorage.setItem STORAGE_ID, JSON.stringify todos