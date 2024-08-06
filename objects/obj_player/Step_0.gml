var _horizontal_direction = keyboard_check(vk_right) - keyboard_check(vk_left);
var _vertical_direction = keyboard_check(vk_down) - keyboard_check(vk_up);

var _dx = velocity * _horizontal_direction;
var _dy = velocity * _vertical_direction;

move_and_collide(_dx, _dy, obj_player, 2);