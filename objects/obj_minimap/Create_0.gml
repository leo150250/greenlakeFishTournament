camera = view_camera[0];
camera_color = c_white;

object = obj_player;
object_color = c_red;

width = window_get_width()/10.66666666666667;
height = window_get_height()/6;

scale_w = room_width / width;
scale_h = room_height / height;



margin_x = window_get_width()/18.6046511627907;
margin_y = window_get_height()/18.75;
x = camera_get_view_width(camera) - width - margin_x - window_get_height()/67.79661016949153;
y = camera_get_view_height(camera) - height - margin_y;

background_surface = surface_create(room_width, room_height);

minimap_background_refresh();