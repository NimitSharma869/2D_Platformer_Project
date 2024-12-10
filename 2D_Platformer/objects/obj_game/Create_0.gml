/// @description Insert description here
// You can write your code in this editor

global.playerHealthMax = 3;
global.playerHealth = global.playerHealthMax;

global.iCamera = instance_create_layer(0,0,layer,obj_Camera); //this create a persistant camra
global.iUI = instance_create_layer(0,0,layer,obj_UI); //this creates the UI at the start of the game
