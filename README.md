# SwiftyDemo

* One of the main impediment to software progress is the untainable belief in the existence of "silver bullets" that will kill, once for all, every single problem that we face when trying to make reliable, fast, maintainable code that satisfies its intended users first.

* Another reason is that we, as a profession, tend to value technology beyond its practical applicability.

* And we create irrealistic monsters, which, though possibly "clever" in some dimension, introduce intractable complexity that our brain just cannot cope with as a whole.

* I am not going to pick on Apple here, as, by and large, their frameworks and libraries are well thought out and have stood the test of time, but there are a few failures that most people do not even acknowldege as failures and blindly reuse, not understanding that the reason their code has become a mess is because of early wrong decisions based on ... Apple's own recommendations!

## This project is here to name and shame:

* Interface Builder and Storyboards
* The whole fiasco otherwise known as "View Controllers"
* AutoLayout whose name is well chosen if you accept that "Auto" refers to the automatic pain you get when debugging it
* CoreData

### What's wrong with Interface Builder and Storyboards?
In one word: magic.
* You have lost control.
* You do not know where things are.
* People abuse them by putting way too many, otherwise independents UI elements in the same place. And the apparition of "segues" have just made things impossibly worse.
* And forget about merging and sharing across more than one team member

### What's wrong with View Controllers
* View Controllers are the wrong abstraction to start with. MVC is wrong. MVVM is wrong. (MVVVVM)^n is wrong.
* You do NOT have a _single_ model, nor a _single_ view and even less a _single_ controller. However many of each _entirely depends on the application you build and cannot be reduced to a single formula to memorise_
* The only _pretend_ to offer you a skeleton to build upon when in reality they are only a trap you sink into fast.

### What's wrong with AutoLayout
* Pretty much everything. Starting with the very concept (though CoreData -- see below -- pushes inadequation to new heights)
* It is wrong to even try to reduce the _infinite_ possible varitions in layout by looking at many, even possibly a lot, of cases and designing exceptions to cover each interesting odd ball case. However many layout samples you they get to model from, even Apple doesn't have the resources to model infinity many edge cases.
* <code>contentHuggingPriorityForAxis</code> anyone? Yes we need some love, but not _that kind_ of love.

### What's wrong with CoreData
* This is the killer number 1: CoreData is about _shared mutable state_. You dodn't even need to read any further
* Killer number 2: it is _not needed_ on iOS *because iOS devices are _client_ devices* and not server devices.
* There isn't and won't ever be in the foreseable future a single iOS app needing to handle 100s or 1000s of requests!
* If, despite this, you still think you need some kind of database, then you are thinking wrong. From Microsfot Word and Excel and Powerpoint, to Adobe Photoshop, InDesign, through Apple's iPhoto or Garage Band, the mature software industry has realised that they needed their own file formats for persistence, if only because brain dead SQL has no idea about the kind of data typoes those apps support, short of collectiong them all into "blobs" and calling it a day.
* If you still think you need a database now, then you are trying to solve the wrong problem.

## SwiftyDemo
* Is an Objective-C based project whose main logic is in Swift
* It exhibits a single `rootViewController` (because Apple's framework _requires_ one)
* It handles rotation as appropriate
* It lets views _decide_ on the layout of their subviews _as they are designed to be_, and offers a select few <code>CGRect</code> extensions that allows you to create most layouts you can think of with a single line of code in most cases, _without preventing you from going fancy_ when you need to.
* It shows cross language access, from ObjC to Swift and fromn Swift to ObjC
* It offers and shows a Binding system where which `component` talks to which other `component` is at the highest possible level, the level of the policies (or "business logic") _things that change_ leaving the mechanisms _things that do not change but carry the actual work_ as oblivious as possible of any other dependency.

# Design is hard, Simplicity is hard. It requires a willingness to throw away anything that doesn't have a measurable pay-off _today_.

