minimap_background_check();
draw_sprite(sprHUDMapa,0,x-5,y-5);
draw_surface_ext(background_surface, x, y,1,1,0,c_aqua,1);
minimap_draw_objects();
minimap_draw_camera();