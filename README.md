Nimit's Gamemaker project

September 2024, 
Started a GameMaker Studio 2D Platformer Project. Using Various online guides to learn syntax and basic functionalities.
Learned how collitions work. How to read keyboard and controller imputs, and use them to control characters on screen. 
Learned how to implement input buffering, coyote jump time, coyote hang time, using arrays, how to allow double jumps of various speeds, how to reset jumps on touching the floor, how the create scripts. 
Learned how to implement half pixel collitions, which are useful when dealing with sloped surfaces. 
Experimented with diffrent values of jump, movement, and gravity speeds to find a combination which works for my game; took multiple attempts.  

Early November, 
Learned how to make persistant objects, how to make an initialisation room which will run at the start of the game and contain all persistant objects.
Learned how to make a camera which tracks the player and is clamped at the borders of the room, which means that the camera will not clip outside of the play area. 
Learned how to animate the player; diffrent animations will play for walking, jumping, falling, and being idle. All these actions will now play diffrent animations. 

15th November,
Started researching how to create enemeis, their pathing, movement and collitions. 

16th November,
Started working on my first enemy. Bug fixes and learning how to code enemeis which will change direction when detecting a collition with a wall (and not phase throught them). Implementing Gravity on enemies. 

15-17th November,
Learned about parent objects, created enemy and walls parent object, so that I would not have to individually code everything for each and every new enemy or terrain object. 
Sucessfully created enemy_parent, which will be used to create the first basic enemy. 

18th November,
Finished work on first basic enemy, started researching how to make more complext enemy AI. 

20th November,
Learning how State Machines works. Added Crusher Enemies, which cycles between diffrent states. Learned how to use inbult timers. The crusher enemy has 3 states; waiting, falling and rising. 
It waits for 3 seconds, beforing entering the falling state, falling rapidly and and squishing anything under it. Then it enters rising state and slowly goes back to its orignal positions. Then it re-enters the waiting state. 

21th November, 
Started work on making the Character Dash. Sucessiflly creased a 1 frame dash long dash. Running into a bug where trying to have a dash longer than 1 frame either causes the speed to permamantly be set to dash speed or no dash happening at all. 

22th Novemeber,
Tried to use both inbuild timers and Gamemaker Studio Alarms (the inbuild timers) but had no luck. 

23th November,
Tried to use state machiens to create a "DashState" and a "FreeState". DashState is a state where the player had no gravity and has a high xspd, while in FreeState the character behaves and moves normally. Seems to be working, but holding the Dash keys makes the player constanlty be in dash state; unable to give dash state a cooldown. 

24th November,
Back to using manual timers; dash works but player now affected by gravity while dashing. Uploading all progress to GitHub to all save rerolls if project assets are accidentally deleated. Created a simple Dashing animation.  


November 25-27th
Finally managed to make dash state work, added a dash cooldown, made it so that dash only resets after touching the ground and 0.5 seconds have passed since a dash. Dash state now has proper collition

November 28-December 3rd
Enemies now do damage, They have varaiable damage between both enemy types and enemy state at the time of damage. 

Decemeber 4-12th
Player now has an HP bar, when it depelates the game restarts. Created a UI which spawns the Camera and game settings which means a single object is all i need to wory about to include them. Player has invincability frames after taking damage. Player flashes while (created a shader for the flash) invincable. 
Created a hurt state where player is briefly slowed and cant jump for half a second; can use dash to skip most of the slow.  
