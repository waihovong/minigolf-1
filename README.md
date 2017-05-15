# Minigolf in Processing

Hey guys. I've created this new repository for the group project so that we can set down branch structure that actually reflects the program itself (rather than just having separate branches for each of us). Here's what we've got so far:

* **master** is where finalized parts of the codebase go once we're all happy with them.
* **entities** is for classes that are subject to the collision physics, like the ball and environmental obstacles.
* **environments** is for creating the various levels ("holes") in the game. At this stage I'm thinking that these will need to be defined using environmental object classes that have yet to be created, so maybe leave these for now.
* **menus** is for in-game menus (obviously); basically a place for Josh to put all the awesome work he's already done on these.

**All of the branches in this repository are protected**, meaning no one can commit directly to them. This is just so we don't accidentally overwrite each others work or anything similar. This isn't actually that big a deal, since commits can be wound back, but it can get confusing. That doesn't mean you can mess around with things though. Just click **Fork** on the top-right to create a copy of the repository under your account, **clone** that copy to your computer, and make whatever changes you like. (In effect, this means that this is my copy of the repo, since there's no real hierarchy to forks.) I'll show everybody how to merge changes made in other people's forks tomorrow, as well as how to open **pull requests** to push changes to a different fork.

Cheers,

**Rob**
