#region Variables

width = 1280;
height = 720;

middle = { w: 0, h: 0 };
coordinate = { x: 0, y: 0 };

borderw = 64;
borderh = 64;

peepw = 200;
peeph = 150;

viewport = 0;
camera = noone;

#endregion

#region Config

camera = camera_create_view(0, 0, width, height, 0, target, -1, -1, borderw, borderh);
surface_resize(application_surface, width, height);

view_enabled = true;
view_visible[viewport] = true;
view_wport[viewport] = width;
view_hport[viewport] = height;
view_camera[viewport] = camera;

#endregion