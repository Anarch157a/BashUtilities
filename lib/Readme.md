To use pprint function in your scripts, source it with:

source colorify.sh

or

. colorify.sh

It can also be used interactivelly from the command line. Just run it like:

$ colorify.sh "String to be formated"

When calling the function or running from an interactive shell, the strings can
be formatted using the following codes:

%%RS = Reset attributes. Everything after will be printed in the default colors
%%BO = Activates bold attribute
%%IT = Turns italics on (if supported by the terminal and font)
%%UN = Underlines text (if supported by the terminal and font)
%%FL = Flashing/blinking text
%%IN = Inverted. Inverts foreground and background colors

%%BK = Black
%%RE = Red
%%GR = Green
%%YE = Yellow
%%BL = Blue
%%MA = Magenta
%%CY = Cyan
%%WH = White

Example:

From command line:

$ colorify.sh "%%FLThis is a blinking text.%%RS"

Will print a flashing string like:

This is a blinking text.

From a script:

source colorify.sh

pprint "%%REThis text is %%BLblue%%RS"

Will print:

This text is blue

Remember to always end your strings with the reset code %%RS. Otherwise everything
printed aftwards with in the terminal will still be using the last attributes set
by the function.

