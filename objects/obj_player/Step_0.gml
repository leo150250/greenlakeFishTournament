if (podeMover) {
	var _direction = move_direction();

	var _dx = velocity * _direction.x;
	var _dy = velocity * _direction.y;

	move_and_collide(_dx, _dy, objCampoDePesca, 2);

	stay_inside_room();
}

if (ControleAcao()) && (!instance_exists(objMinigame)) {
	instance_create_layer(0,0,layer,objMinigame);
	podeMover=false;
}