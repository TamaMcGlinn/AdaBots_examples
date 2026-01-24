Your AdaBots project
====================

Welcome to your AdaBots project! Inside 'programs' you will find a test.adb
file to start from. Right now, it just makes the bot move up and down.

Feel free to change it, it's yours!

When you want to add a new program, type Cntrl + e, n (hold cntrl while pressing e,
and then press n) and type in the name for your new program.

Be sure to follow the [AdaBots Newbe Guide on adabots.net/guide](https://adabots.net/guide)
for your first steps in AdaBots.

Happy coding!

Build & Run
===========

Press Control+Shift+B to build the file you have open.

Check if there are any errors in the terminal window.

Then press F5 to run it in the debugger.

Debugging
=========

For the program to run, you need:
- Minetest server running
- A bot (adabots:turtle placed)
- nearby a player
- listening
- to this code workspace
- botname in your program is left out, set to empty string, or set to the bot's actual name

[The intro guide](https://adabots.net/guide/0_intro) has screenshots of each step.

Make sure your minetest world is running; in your AdaBots workspaces you can
click "open world" and it will start your server and connect through the browser.
The world remains active while clients are connected, but shuts down a few minutes
after the last player leaves.

You can either craft an adabots:turtle, or use `/giveme adabots:turtle`
(see [the admin guide](https://adabots.net/guide/4_admin) for help with permissions).
Once it is placed in the world, you can right-click it, select this code workspace
from the dropdown and press the green button so the bot starts listening.

Finally, make sure the Bot's in your program matches the Bot's name in minetest.
In minetest, the Bot's name is shown above the Bot and can be edited in the turtle
menu. In your program, you can make a program for Tom like this:

```ada
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle ("Tom");
```

If you leave out the bot name, or use an empty name, then any bot listening will
pick up the instructions, and you will have to make sure there is only one listening.

```ada
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle (""); -- these are the same
```

If something still isn't working, [drop us a message!](https://adabots.net/contact)
