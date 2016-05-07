Probably you present a similar talk at different events. That's one of the 
reasons we separated talk management (i.e. creating and editing them) from the 
submission phase. We think it's better to have a dedicated section for talks: 
once they are ready, they can be easily submitted to chosen events by simply 
selecting them from a list.

We also track all changes made to talks and we will soon add a functionality to 
go back and forward in its revision history.

Additionally for each talk you can see which talk version was submitted to 
which event.

# Title

Embedding C/C++ in the Control Language Céu, a Case Study:
Rewriting the Video Game Pingus.

# Abstract
(Public abstract, displayed on the website, max 512 characters)

In this talk, we explore the synergy between C/C++ and Céu in the context of
rewriting the video game "Pingus" (from C++ to Céu).
We discuss how we made an incremental rewriting without ever breaking the game 
for long.
<!--
, focusing on the bi-directional communication between the two languages.
-->

Céu extends classical structured programming with deterministic and composable 
lines of execution that can await and hold state across reactions to the
environment.
Céu is ideal for systems with complex control-flow patterns, such as embedded 
systems and video games.

<!--
With Céu, we can write code in a direct/sequential style to avoid the "callback 
hell".
-->

# Private Abstract
(Top-level talk outline, main idea/topics your talk will cover. Only available 
for organizers and reviewers.)

This talk is based on the (still under review) report "On Rewriting Pingus from 
C++ to Céu" which promotes the synchronous programming model of Céu in the 
context of video games:

http://htmlpreview.github.io/?https://github.com/fsantanna/pingus/blob/ceu/ceu/README.html

The outline of the talk is as follows:

Given the "polyglot" mindset of the conference, for this talk we will focus on 
the interaction between C/C++ and Céu.

* Introduction: On rewriting Pingus
    * Warm up: Detecting "Double Clicks" is the new "Hello World"
    * Incremental rewriting
        1. Start from the working game
        2. Rewrite a class/behavior in Céu
        3. Never break the game for long
    * What and What not to rewrite
        * Yes: control-flow behaviors
            * inter-frame functionality
        * No: data and pure functions
            * intra-frame functionality
    * Common control-flow patterns in Pingus (a glimpse)
        * `Finite State Machines`, `Continuation Passing`, `Dispatching Hierarchies`,
          `Containers and Lifespan`, `Signaling Mechanisms`, `Wall-Clock Timers`,
          `Pausing`, `Resource Acquisition and Release`
* Core: Céu and C/C++ integration in Pingus
    * Embedding (C => Céu) vs Extending (Céu call C)
        * `ceu_sys_go()` vs `_f()`
    * Inlining C
    * Safe resource management
        * Local vs External resource
        * Céu `finalize` vs C++ `RAII` vs Java `finalize`
            1. special syntax
            2. deterministic
            3. compile-time safe
        * Pointers vs Aliases
* Conclusion

# Talk History
(Please list all instances where you have or may give this talk prior to the 
conference and whether videos of the talk are available)

I have never given this talk before.
However, there are some talks about Céu:

* 2015: Curry-On! --- *"Mixing Control and Data Flow in Céu"*
    * Video: https://www.youtube.com/watch?v=aivVg9WMuMs
    * Site: http://curry-on.org/2015/sessions/structured-synchronous-programming.html
* 2014: Strange Loop / Future of Programming Workshop --- *"Dynamic Organisms in Céu"*
    * Video: https://vimeo.com/110512582
    * Site:  http://www.future-programming.org/2014/program.html

<!--
Also, some academic talks:
    * http://www.ceu-lang.org/chico/

## Non-Academic talks:

* 2009: Lua Workshop --- *"LuaGravity: A reactive language"*
    * Video (in portuguese): https://www.youtube.com/watch?v=6XMbQ3xjkzI

## Academic talks:

* 2015: REBLS workshop paper
    --- *"Reactive Traversal of Recursive Data Types"*
    * Site: http://www.guidosalvaneschi.com/REBLS/REBLS2015/
* 2015: Modularity conference paper
    --- *"Structured Synchronous Reactive Programming with Céu"*
    * Site: http://www.aosd.net/2015/
* 2014: REBLS workshop paper
    --- *"Structured Reactive Programming with Céu"*
    * Site: http://www.guidosalvaneschi.com/REBLS/REBLS2014/
* 2013: SenSys conference paper
    --- *"Safe Concurrent Abstractions for Wireless Sensor Networks"*
    * Site: http://sensys.acm.org/2013/index.html
* 2013: REM workshop paper
    --- *"Advanced Control Reactivity for Embedded Systems"*
    * Site: http://soft.vub.ac.be/REM13/
-->
