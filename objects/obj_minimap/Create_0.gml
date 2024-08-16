camera = view_camera[0];
camera_color = c_white;

object = obj_player;
object_color = c_red;

width = 150;
height = 150;

scale_w = room_width / width;
scale_h = room_height / height;

margin_x = 15;
margin_y = 15;

x = camera_get_view_width(camera) - width - margin_x;
y = camera_get_view_height(camera) - height - margin_y;

background_surface = surface_create(room_width, room_height);

minimap_background_refresh();