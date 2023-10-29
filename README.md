# flutter spike - state management

## gist

- divided into screens
- multiple type/level of widgets
  - small
  - medium
    - composed of small widgets
  - screen
    - composed of medium and small widgets
- smaller widget tree
- no direct ref. to domain from view/widgets
  - views/widgets do not know about domain objects.
  - screen/vm knows and does the translation.
- no datastore or anything which views ref. directly.
  - views get their data from above object which composes them.
    - small
      - screen
      - medium
    - medium
      - screen

## concept

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

## why vm

one can say why vm is needed.
agree no need.
i can't mock them anyways.
they exist in android due to android limitations. they are not needed.
i am directly using the domain interfaces in spring controllers and
they work out much better and easier than service layer in middle.
easier to test and easier to write. no duplication.
when you want to place the request on different thread than view thread. then it makes sense.
decouple that from view.
but in flutter/dart that's issue is solved by the language itself.
so no need for that layer.

i know rn i feel a bit biased but if i put it side by side to service layer with controller.
it feels bad. its the unneeded service layer. more unneeded code. duplicating the efforts
unnecessarily.
but i cannot directly compare. it gives me upper hand.
decoupling. an indirection. 2 things can evolve independently.
and it will map between them.
and feels more suited here.
but again. "KISS"
if we need it we would add or we might get better idea. than vm.

with this there are 2 mappings, one by vm for screen, and other by screen for widgets.
screen to widgets cannot go. reducing other, and doing the bare minimum is the way to go.
hexagonal, ports and adapter and outside in. failing e2e first. and making them pass. xp.
doing the bare minimum.
"KISS"

but still its different from those patters where widget get direct access to datastore.
here only screen knows and it makes/transforms that.

now as you can see if screen starts doing mapping or something else, that concern can be and should
be extracted out.
SRP.
its just refactoring, extraction of class, following the principles.

anyways let this project contain. this is you can say spikes to extreme...

went to extremes, did that and now have better idea, architecture.
idea is to follow evolutionary architecture.


## why not lifting the state 

this means passing the state to every intermediate widget. also idk how repainting works. invalidating every intermediate object. unnecessary diff computation.
why try to reinvent, solve what provider already did.
only refreshing the required widget. with no intermediate clutter. 
