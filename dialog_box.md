# Dialog Box

The friendly.bash library provides a function to create customizable dialog boxes for user interaction.

This is currently an experimental function. Some things may not work correctly.

`dialogBox [--title=<title>] [--message=<message>] [--button=<button_label:button_code> ...]`

Creates a dialog box with a specified title, message, and buttons. The available options are:

--title=<title>: Sets the title of the dialog box.
--message=<message>: Sets the message displayed in the dialog box.
--button=<button_label:button_code>: Adds a button to the dialog box with the specified label and code. The button code is the exit code returned when the button is selected.
If no options are provided, the dialog box will have a default title of "Dialog Box" and a default message of "Are you sure?" with a single "OK" button.

Example usage:
```
dialogBox --title="Confirmation" --message="Do you want to proceed?" --button="Yes:0" --button="No:1"
button_code=$?
echo "Selected button: $button_code"
```

```
╔══════════════════════════╗
║       Confirmation       ║
║                          ║
║ Do you want to proceed?  ║
║                          ║
║      [Yes]  [No]         ║
╚══════════════════════════╝

Selected button: 1

```

In the example above, a dialog box with the title "Confirmation" and the message "Do you want to proceed?" is displayed. It has two buttons, "Yes" and "No", which return exit codes 0 and 1, respectively. The exit code of the selected button is stored in the button_code variable.