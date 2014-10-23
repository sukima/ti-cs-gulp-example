var TabWindow = require('components/tabwindow');

// this sets the background color of the master UIView (when there are no
// windows/tab groups on it)
Titanium.UI.setBackgroundColor('#000');

var tabGroup = Titanium.UI.createTabGroup();

var tabWindows = [
  new TabWindow('Tab 1', 'KS_nav_views.png', 'I am Window 1'),
  new TabWindow('Tab 2', 'KS_nav_ui.png', 'I am Window 2')
];

tabWindows.forEach(function(tab) {
  tabGroup.addTab(tab.view);
});

tabGroup.open();
