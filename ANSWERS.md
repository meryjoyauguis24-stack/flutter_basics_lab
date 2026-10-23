Review Questions

1. What is the difference between a StatelessWidget and a StatefulWidget? Give one example of each from this lab.

A StatelessWidget does not change its data while running, like the Profile Card in Activity 1. A StatefulWidget can update its screen when its state changes, like the Water Tracker in Activity 2.

2. Why is a StatefulWidget written as two classes? What does each class do?

The first class creates the widget. The second class manages its changing state and builds the user interface.

3. In Activity 2, what happened when you changed _glasses outside setState()? Why?

The number changed in the variable, but the screen did not update immediately because Flutter was not notified to rebuild the widget.

4. Looking at the Debug Console in Activity 2, when is build() called?

The build() method is called when Flutter creates the widget and when the widget needs to rebuild after a state change.

5. Explain the main axis and the cross axis of a Row and of a Column.

In a Row, the main axis is horizontal and the cross axis is vertical. In a Column, the main axis is vertical and the cross axis is horizontal.

6. In Activity 3, what happened when you removed Expanded from a StatBox? What does Expanded do?

Without Expanded, the layout may not distribute the available space properly and can overflow. Expanded allows a widget to use the available space in a Row or Column.

7. Why do we use GridView.builder for the menu instead of a Column with many children?

GridView.builder displays items in a grid and builds them as needed, making it useful for menus with multiple items.

8. How do Stack and Positioned create the Best seller badge in Activity 4?

Stack allows widgets to overlap, while Positioned places the Best seller badge at a specific position over the menu item.

9. What is the difference between customizing with ThemeData and with a style on one widget? Give one example of each from Activity 5.

ThemeData applies common styles throughout the app, such as the color scheme. A widget-specific style changes only one widget, such as the text style of a title.

10. When you flip the dark-mode switch in Activity 5, which widget holds the state, and how does the change reach MaterialApp?

The stateful settings page holds the dark-mode state. When the switch changes, the state is updated and the app rebuilds with the appropriate theme in MaterialApp.

Observations

 Activity 2: Water Tracker
When I tapped the plus (+) button, the number of glasses increased. The screen updated because the variable was changed inside `setState()`. When the variable was changed outside `setState()`, the screen did not update immediately.

Activity 3: Weather Dashboard
The Row widget arranges items horizontally, while the Column widget arranges items vertically. Expanded helps a widget use the available space in a Row or Column.

Activity 5: Settings Page
ThemeData customizes the overall theme of the application. When I enabled dark mode, the app's appearance changed to a dark theme. Pressing the Save button displayed a SnackBar message.

## Last Three build() Called Lines

```text
build() called: 0 glasses
build() called: 1 glasses
build() called: 2 glasses
```