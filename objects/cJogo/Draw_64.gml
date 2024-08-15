draw_set_alpha(1);
draw_sprite(sprHUDTopo,0,display_get_gui_width()-136,8);
if (!surface_exists(surfaceHorario)) {
	surfaceHorario=surface_create(99,47);
}
surface_set_target(surfaceHorario);
draw_clear_alpha(c_black,0);
draw_set_font(fntMenu);
draw_set_color(c_maroon);
draw_set_halign(fa_center);
draw_set_alpha(0.75);
draw_text(11,-3+numerosFX[0],"2\n0\n1\n2\n0");
draw_text(11+24,-3+numerosFX[1],"9\n0\n1\n2\n3\n4\n5\n6\n7\n8\n9\n0");
draw_text(64,-3+numerosFX[2],"5\n0\n1\n2\n3\n4\n5\n0");
draw_text(64+24,-3+numerosFX[3],"9\n0\n1\n2\n3\n4\n5\n6\n7\n8\n9\n0");
surface_reset_target();
draw_surface(surfaceHorario,display_get_gui_width()-110,12);