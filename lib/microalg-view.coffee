module.exports =
class MicroAlgView
  constructor: (serializedState) ->
    @element = document.createElement('div')
    @element.classList.add('microalg')
    @message = document.createElement('div')
    @element.appendChild(@message)

  serialize: ->

  destroy: ->
    @element.remove()

  getElement: ->
    @element

  setResult: (src) ->
    @message.classList = ['message']
    @message.textContent = src

  setError: (msg) ->
    @message.classList = ['error']
    @message.textContent = msg
