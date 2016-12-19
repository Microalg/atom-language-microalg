console.log 'Starting atom-language-microalg'
MicroAlgView = require './microalg-view'
EMULISP_CORE = require './emulisp_core'
{CompositeDisposable} = require 'atom'

module.exports = MicroAlg =
  MicroAlgView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @MicroAlgView = new MicroAlgView(state.MicroAlgViewState)
    @modalPanel = atom.workspace.addModalPanel( \
                             item: @MicroAlgView.getElement(), \
                            visible: false)

    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace',
      'microalg:exec': => @exec()
    @subscriptions.add atom.commands.add 'atom-workspace',
      'microalg:hide_result': => @hide_result()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @wordcountView.destroy()

  serialize: ->
    MicroAlgViewState: @MicroAlgView.serialize()

  exec: ->
    console.log 'MicroAlg exec-ed!'

    if !@modalPanel.isVisible()
      editor = atom.workspace.getActiveTextEditor()
      result = EMULISP_CORE.eval(editor.getText())
      @MicroAlgView.setResult(result)
      @modalPanel.show()

  hide_result: ->
    console.log 'MicroAlg hidden!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
