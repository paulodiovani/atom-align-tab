Parser    = require("./parser")
Formatter = require("./formatter")

module.exports =
  formatter: null

  activate: ->
    # atom.workspaceView.command "align-tab:align-tab", => @alignTab()
    atom.workspaceView.command "align-tab:equals", => @alignTab('=/f')

    # init Formatter
    @formatter = new Formatter

  alignTab: (pattern = null) ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection()

    # if not pattern?
      # get user input

    parser = new Parser(pattern)
    @formatter.setParser parser

    text = @formatter.format selection.getText()
    selection.insertText text
