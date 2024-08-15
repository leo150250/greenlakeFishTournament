function camera_middle(camera) {
	return {
		w: camera_get_view_width(camera) / 2,
		h: camera_get_view_height(camera) / 2
	};
}

/*
function move_direction() {
	return {
		x: keyboard_check(vk_right) - keyboard_check(vk_left),
		y: keyboard_check(vk_down) - keyboard_check(vk_up)
	};
}
*/