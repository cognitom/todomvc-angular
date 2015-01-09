todoStorage = require '../../lib/todoStorage'

module.exports = ($scope, $location, $filter) ->
  todos = $scope.todos = todoStorage.get()

  $scope.newTodo = ''
  filter = $filter 'filter'
  remaining = filter todos, completed: false
  $scope.remainingCount = remaining.length
  $scope.editedTodo = null

  $location.path '/' if $location.path() == ''

  $scope.location = $location

  $scope.$watch 'location.path()', (path) ->
    routes =
      '/active': completed: false
      '/completed': completed: true
    $scope.statusFilter = routes[path]

  $scope.$watch 'remainingCount == 0', (val) -> $scope.allChecked = val

  $scope.addTodo = () ->
    newTodo = $scope.newTodo.trim()
    return if newTodo.length == 0

    todos.push
      title: newTodo,
      completed: false
    todoStorage.put todos

    $scope.newTodo = ''
    $scope.remainingCount++

  $scope.editTodo = (todo) ->
    $scope.editedTodo = todo
    # Clone the original todo to restore it on demand.
    $scope.originalTodo = angular.extend {}, todo

  $scope.doneEditing = (todo) ->
    $scope.editedTodo = null
    todo.title = todo.title.trim()

    $scope.removeTodo todo unless todo.title
    todoStorage.put todos

  $scope.revertEditing = (todo) ->
    todos[todos.indexOf todo] = $scope.originalTodo
    $scope.doneEditing $scope.originalTodo

  $scope.removeTodo = (todo) ->
    $scope.remainingCount -= 1 unless todo.completed
    todos.splice todos.indexOf(todo), 1
    todoStorage.put todos

  $scope.todoCompleted = (todo) ->
    $scope.remainingCount += if todo.completed then -1 else 1
    todoStorage.put todos

  $scope.clearCompletedTodos = ->
    $scope.todos = todos = todos.filter (val) -> !val.completed
    todoStorage.put todos

  $scope.markAll = (completed) ->
    todo.completed = !completed for todo in todos
    $scope.remainingCount = todos.length if completed
    todoStorage.put todos
