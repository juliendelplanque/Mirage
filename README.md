# WindowsPreviewer
A windows switcher with a previewer for Pharo.
![Demo](https://raw.githubusercontent.com/juliendelplanque/WindowsPreviewer/dev/misc/gif/demo.gif)


# Install
## Stable version
Simply evaluate the following code snippet:
~~~
Metacello new
    repository: 'github://JulienDelplanque/WindowsPreviewer/repository';
    baseline: 'WindowsPreviewer';
    load
~~~

## Development version
Simply evaluate the following code snippet:
~~~
Metacello new
    repository: 'github://JulienDelplanque/WindowsPreviewer:dev/repository';
    baseline: 'WindowsPreviewer';
    load
~~~

# Setup
Go to the 'Settings browser' and check the 'Activate' button in 'Windows Previewer' group.
Then, you can choose the view you want to use by checking the buttons corresponding.

- If the default shortcut to open the previewer does not fit with you, you can change it from settings as well.
- It is also possible to change the order used to display windows in the previewer by selecting one the method in "Windows management" setting.

![Settings browser](https://raw.githubusercontent.com/juliendelplanque/WindowsPreviewer/dev/misc/img/settings.png)

# How to use
Once you activated the 'Windows Previewer' in the 'Settings browser' hit 'Ctrl+Tab' to open the previewer.
You can now use left/right arrow to choose a window and hit the space key to open it.

| Key                  | Purpose                                                                   |
|:---------------------|:--------------------------------------------------------------------------|
| (Ctrl/Shift)+Tab     | Open the previewer (Ctrl for Linux, Shift for Windows and Mac OS).        |
| Left arrow           | Select window on the left of the current window.                          |
| Right arrow/Tab      | Select the window on the right of the current window.                     |
| Space/Enter          | Set the window selected in the previewer on top.                          |
| Esc                  | Quit the windows previewer without changing the current window.           |

# How to create your own view
## Listening to WPModel announcements
WindowsPreviewer graphical elements are all listening to the announcements of a WPModel object to update their state.
The following list contains the announcements that can be announced by a WPModel:

| Announcement      | Purpose                                                    |
|:------------------|:-----------------------------------------------------------|
| WPOpenRequest     | Announced when the previewer is opened.                    |
| WPWindowSelected  | Announced when the user selected a window in the previewer.|
| WPCloseRequest    | Announced when the previewer is closed.                    |

Each graphical element must uses WPModelListener trait and override the following methods (defined in the trait):

| Method                 | Purpose                                                               |
|:-----------------------|:----------------------------------------------------------------------|
| #handleOpenRequest:    | Defines what it should do when the previewer is opened.               |
| #handleWindowSelected: | Defines what it should do when the previewer's current window change. |
| #handleCloseRequest:   | Defines what if should do when the previwer is closed.                |

These methods receive the corresponding announcement when they are called.

## Making the view appear in the Setting browser
To let the user enable/disable the view you created and let WPModel know it can use your view, you have to make it use WPViewSetting trait.
This trait adds methods on the class side and some of them need to be overrided:

| Method        | Purpose                                                                        |
|:--------------|:-------------------------------------------------------------------------------|
| #activate:    | Enable/disable the view according to a Boolean given as parameter.             |
| #isActivated  | Returns true if the view is enabled, else returns false.                       |
| #wpSettingOn: | Create the setting node in the setting browser using #buildSettingNamed:with:. |

## Example: WPTaskbarTasksHighlighter
As an example we will explain how WPTaskbarTasksHighlighter is implemented.
This view highlight the taskbar task's button associated with the window currently selected.

### WPButtonHighlighterMorph
First of all we create an object that inherits from morph and have the duty to highlight a button givent as parameter:
~~~
Morph subclass: #WPButtonHighlighterMorph
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'WindowsPreviewer-Highlighter'
~~~

We override the #initialize method:
~~~
initialize
    super initialize.
    self
        height: Smalltalk ui theme wpTaskbarTasksHighlighterHeight;
        color: Smalltalk ui theme wpTaskbarTasksHighlighterColor
~~~

Then, we create a method that make the morph "highlight" a button given as parameter:
~~~
highlightButton: aButton
    self
        position: aButton position - (0@self height);
        width: aButton width
~~~

Now we are ready to implement our view.

### WPTaskbarTasksHighlighter
Let's create our object that uses WPModelListener and WPViewSetting traits:
~~~
Object subclass: #WPTaskbarTasksHighlighter
    uses: WPModelListener + WPViewSetting
    instanceVariableNames: 'buttonHighlighter'
    classVariableNames: ''
    package: 'WindowsPreviewer-Highlighter'
~~~

with its #initialize method:
~~~
initialize
    super initialize.
    buttonHighlighter := WPButtonHighlighterMorph new
~~~

#### Reacting to announcements
Now, we define the behavior of the object when the previewer open (it adds the buttonHighlighter as submorph of the background):
~~~
handleOpenRequest: aWPOpenRequest
    aWPOpenRequest background addMorph: buttonHighlighter
~~~

Then, we define the behavior of the object when the previewer close (it unsubscribes from the WPModel announcements):
~~~
handleCloseRequest: aWPCloseRequest
    aWPCloseRequest model announcer unsubscribe: self
~~~

And finally, we define the behavior of the object when the selected window of the previewer change (it highlights the taskbar button corresponding):
~~~
handleWindowSelected: aWPThumbnailSelected
    buttonHighlighter
        highlightButton: (aWPThumbnailSelected window worldTaskbar buttonForMorph: aWPThumbnailSelected window)
~~~

#### Appearing in the Settings browser
To do that, we go the class side of WPTaskbarTasksHighlighter and override the following methods:

- #activate: and #isActivated to let know if the view is activated or not.
~~~
activate: aBoolean
    isActivated := aBoolean
~~~

~~~
isActivated
    ^ isActivated
~~~

- #wpSettingOn: To actually buid the setting node in the System browser.
~~~
wpSettingOn: aBuilder
    <systemsettings>
    (self buildSettingNamed: #wpTaskbarTasksHighlighterSetting with: aBuilder)
        label: 'Taskbar tasks highlighter';
        description: 'Activate the taskbar tasks highlighter' translated
~~~

### Finished
The example is now complete. It is already implemented in the 'WindowsPreviewer-Highlighter' package, have a look!

