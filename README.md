# simple_hello_world

trying to find out how to flutter... :)

## Getting Started

add docs,   
what how, why?

## points

- vm should be created outside and just be passed on to the screen
- vm should not know about MyScaffoldValue, concrete things/widgets in/on the screen.  
  &nbsp;&nbsp;&nbsp;&nbsp;screen should transform if required for particular widgets

## idea

idea is simple vm is passed on to the screen.
vm doesn't know what's on the screen. and its fully decoupled.
vm is a logical representation of 'data' that should be displayed on screen.
screen knows whats on the screen. widgets and all that.
it knows about what widgets want.
so screen does the mapping/transformation of data from the vm to what widgets want.

vm's job is the middle layer. so now ui can is completely changed without affecting anything.
same data different ui.
same way data can be completely changed without affecting ui. touching ui.
vm is the mapping layer in a way. decoupling things.

that i don't want vm to have any dependency on ui in any way.
so no widget model reference in any way.

secondly, i want the widgets to be composable.
3 level of widgets.
small, which are stateless mostly no provider.watch like Text and things
medium, which are composed on these small widgets, uses them to display data.
they are reusable blocks used across screens. they might use providers they might not.
depends on case to case.
and then screen, which is composed on medium and small widgets. mostly i would say medium.
i don't want 100 lines of code creating same widget tree everywhere. when a medium widget could had
easily solved.
what i want to enforce is compose-ability.

what i don't like about most pattern is they remove the middle layer. vm.
imo, its very important.
else, how will you know. context.
multiple screens could be using same widgets but have vastly different data.

and secondly those huge widget trees.
now my screen can be composed of medium widgets rather than huge widget tree for each screen file.
and which is 70% same in most cases.

now with this project what i have done/achieved/spiked all of this.
i do not need them everytime. but when i do, i have the code. i know how to do.
i know i can do things like this way.

KISS