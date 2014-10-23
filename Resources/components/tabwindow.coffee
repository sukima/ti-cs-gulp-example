class TabWindow
  constructor: (title, icon, text) ->
    @win = Titanium.UI.createWindow {
      title
      background: "#FFF"
    }

    @label = Titanium.UI.createLabel {
      text
      color:     "#999"
      textAlign: "center"
      width:     "auto"
      font:
        fontSize:   20
        fontFamily: "Helvetica Neue"
    }

    @view = Titanium.UI.createTab {
      icon
      title
      window: @win
    }

    @win.add @label

module.exports = TabWindow
