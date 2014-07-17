parser = require('./parser')

module.exports =
  activate: ->
    atom.workspaceView.command "align-tab:align-tab", => @alignTab()

  alignTab: ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection()

    parser.parse_input 'foobar/l3f'
