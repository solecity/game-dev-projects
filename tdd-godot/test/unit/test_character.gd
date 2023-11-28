extends "res://addons/gut/test.gd"

var Character = load("res://character.gd");

var _character = null;


func before_each():
	_character = Character.new();


func after_each():
	_character.free();


func test_take_damage():
	_character.hp = 100;
	_character.take_damage(10);
	
	assert_eq(_character.hp, 90, "HP should be 90");


func test_take_damage_not_below_zero():
	_character.hp = 5;
	_character.take_damage(10);
	
	assert_eq(_character.hp, 0, "HP should be 0");


func test_take_damage_with_shield():
	_character.hp = 100;
	_character.has_shield = true;
	_character.take_damage(10);
	
	assert_true(_character.hp > 90, "HP should be greater than 95");
