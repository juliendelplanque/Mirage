# WindowsPreviewer
A windows switcher with a previewer for Pharo.

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
![Settings browser](https://raw.githubusercontent.com/juliendelplanque/WindowsPreviewer/dev/misc/img/settings.png)

# How to use
Once you activated the 'Windows Previewer' in the 'Settings browser' hit 'Ctrl+Tab' to open the previewer.
You can now use left/right arrow to choose a window and hit the space key to open it.

| Key                  | Purpose                                                                   |
|:---------------------|:--------------------------------------------------------------------------|
| (Ctrl/Cmd/Shift)+Tab | Open the previewer (Ctrl for Linux, Cmd for Mac OS and Shift for Windows. |
| Left arrow           | Select window on the left of the current window.                          |
| Right arrow/Tab      | Select the window on the right of the current window.                     |
| Esc                  | Quit the windows previewer without changing the current window.           |
