extends Node2D

var hp = 100;
var max_hp = 100;
var has_shield = false;


func take_damage(amount : int):
	if (has_shield):
		amount /= 2;
	
	hp = max(hp - amount, 0);
