module.exports =
class MicroAlgView
  constructor: (serializedState) ->
    @element = document.createElement('div')
    @element.classList.add('microalg')
    message = document.createElement('div')
    message.textContent = "MicroAlg is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  serialize: ->

  destroy: ->
    @element.remove()

  getElement: ->
    @element

  setResult: (src) ->
    @element.children[0].textContent = src
