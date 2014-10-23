var TabWindow = require('components/tabwindow');

// this sets the background color of the master UIView (when there are no
// windows/tab groups on it)
Titanium.UI.setBackgroundColor('#000');

var tabGroup = Titanium.UI.createTabGroup();

var tabWindows = [
  new TabWindow(L('tab_1'), 'KS_nav_views.png', L('i_am_window_1')),
  new TabWindow(L('tab_2'), 'KS_nav_ui.png',    L('i_am_window_2'))
];

tabWindows.forEach(function(tab) {
  tabGroup.addTab(tab.view);
});

tabGroup.open();
