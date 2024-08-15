var _direction = move_direction();

var _dx = velocity * _direction.x;
var _dy = velocity * _direction.y;

move_and_collide(_dx, _dy, obj_obstacle, 2);

stay_inside_room();