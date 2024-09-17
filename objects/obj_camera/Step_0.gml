middle = camera_middle(camera);

if (target) {
	var _x = target.x - middle.w;
	var _y = target.y - middle.h;
	camera_set_view_pos(camera, _x, _y);
}