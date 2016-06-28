I define the behavior of an object that listen to a WPModel.

The following methods **must** be overrided by the classes using me:
- #handleCloseRequest: For actions to be done when the user quit the windows previewer.
- #handleOpenRequest: For actions to be done when the user open the window previewer.
- #handleWindowSelected: For actions to be done when the user selected another window.