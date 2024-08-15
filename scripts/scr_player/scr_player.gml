function move_direction() {
	return {
		x: keyboard_check(vk_right) - keyboard_check(vk_left),
		y: keyboard_check(vk_down) - keyboard_check(vk_up)
	};
}

function stay_inside_room() {
	x = clamp(x, 0 + sprite_xoffset, room_width - sprite_xoffset);
	y = clamp(y, 0 + sprite_yoffset, room_height - sprite_yoffset);	
}
