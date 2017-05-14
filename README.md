# Minigolf in Processing

Hey guys. I've created this new repository for the group project so that we can set down branch structure that actually reflects the program itself (rather than just having separate branches for each of us). Here's what we've got so far:

* **master** is the only protected branch, meaning you can't commit directly to it, but need to open a pull request from another branch.
* **entities** is for classes that are subject to the collision physics, like the ball and environmental obstacles.
* **environments** is for creating the various levels ("holes") in the game. At this stage I'm thinking that these will need to be defined using environmental object classes that have yet to be created, so maybe leave these for now.
* **menus** is for in-game menus (obviously); basically a place for Josh to put all the awesome work he's already done on these.

Anyone can commit directly into any branch except **master**. This means, in theory, that you can break a branch, although we can *always* roll back to an earlier commit. But if in doubt, feel free to create a new branch from any of the existing ones and work within that. When you create a new branch, it's initial state will be based on that of the currently selected branch. So if I wanted to mess around with **entities** in a new branch called **entities-rob**, I'd first select entities from the drop-down, then open the drop-down again, and add the new branch. That way, **entities-rob** would be created with all of the files in **entities**, in their current states.

If anyone thinks there should be a new base branch, go ahead and make it, or ask me to.

Cheers,

**Rob**
