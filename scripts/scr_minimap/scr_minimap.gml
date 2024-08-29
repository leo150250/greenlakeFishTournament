globalvar tilemaps;

tilemaps = [
	"Camada_de_Blocos_1"
];

function minimap_background_check() {
	if (!surface_exists(background_surface)) {
		minimap_background_refresh();
	}
}	

function minimap_background_refresh() {
	background_surface = surface_create(width, height);
	var _temp_surface = surface_create(room_width, room_height);
	
	surface_set_target(_temp_surface);
	
	draw_clear_alpha(c_black, 1);
	draw_rectangle(0, 0, room_width, room_height, true)
	array_foreach(tilemaps, minimap_draw_tilemap);
	
	surface_reset_target();
	surface_set_target(background_surface);
	
	draw_surface_stretched(_temp_surface, 0, 0, width, height);
	
	surface_reset_target();
	surface_free(_temp_surface);
}

/// @param {String} layer_name
function minimap_draw_tilemap(_layer_name) {	
	var _layer = layer_get_id(_layer_name);
	var _tilemap = layer_tilemap_get_id(_layer);
	draw_tilemap(_tilemap, 0, 0);
}

function minimap_draw_objects() {
	with(object) {
		var _x = other.x + x / other.scale_w;
		var _y = other.y + y / other.scale_h;
		
		draw_set_color(other.object_color);
		draw_circle(
			_x, 
			_y, 
			2, 
			false
		);	
	}
}	

function minimap_draw_camera() {	
	draw_set_color(camera_color);
	
	var _x = camera_get_view_x(camera);
	var _y = camera_get_view_y(camera);
	var _w = camera_get_view_width(camera);
	var _h = camera_get_view_height(camera);
	
	var _x1 = x + _x / scale_w;
	var _y1 = y + _y / scale_h;
	var _x2 = _x1 + _w / scale_w;
	var _y2 = _y1 + _h / scale_h;
	
	draw_rectangle(_x1, _y1, _x2, _y2, true);
}