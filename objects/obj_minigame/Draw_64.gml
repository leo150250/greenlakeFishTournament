var posX=(display_get_gui_width()/2);
var posY=(display_get_gui_height()/2);
#region Barra do Minigame
draw_sprite_ext(sprMinigame,0,posX,posY,raioMinigameBarra,raioMinigameBarra,0,c_white,1);
var corBarra=make_color_hsv(porcentagemFisgada*80,255,255);
draw_set_color(corBarra);
/*
for (var i = 0; i < porcentagemFisgada*36; i++) {
	draw_circle(posX-sin(degtorad(i*10))*145,posY-cos(degtorad(i*10))*145,4,false);
	draw_circle(posX-sin(degtorad(i*10))*115,posY-cos(degtorad(i*10))*115,4,false);
}
draw_circle(posX-sin(degtorad(porcentagemFisgada*360))*145,posY-cos(degtorad(porcentagemFisgada*360))*145,4,false);
draw_circle(posX-sin(degtorad(porcentagemFisgada*360))*115,posY-cos(degtorad(porcentagemFisgada*360))*115,4,false);
*/
draw_primitive_begin_texture(pr_trianglestrip,texBarra);
var texX=1;
for (var i = 0; i < porcentagemFisgada*36; i++) {
	draw_vertex_texture(posX-sin(degtorad(i*10))*(145*raioMinigameBarra),posY-cos(degtorad(i*10))*(145*raioMinigameBarra),texX,0);
	draw_vertex_texture(posX-sin(degtorad(i*10))*(115*raioMinigameBarra),posY-cos(degtorad(i*10))*(115*raioMinigameBarra),texX,1);
	if (texX==1) {
		texX=0;
	} else {
		texX=1;
	}
}
draw_vertex_texture(posX-sin(degtorad(porcentagemFisgada*360))*(145*raioMinigameBarra),posY-cos(degtorad(porcentagemFisgada*360))*(145*raioMinigameBarra),texX,0);
draw_vertex_texture(posX-sin(degtorad(porcentagemFisgada*360))*(115*raioMinigameBarra),posY-cos(degtorad(porcentagemFisgada*360))*(115*raioMinigameBarra),texX,1);
draw_primitive_end();
#endregion
#region Região do Minigame
draw_sprite_ext(sprMinigame,1,posX,posY,raioMinigame,raioMinigame,0,c_white,1);
#endregion
//draw_surface_ext(surfaceInterface,posX-(150*raioMinigame),posY-(150*raioMinigame),raioMinigame,raioMinigame,0,c_white,1);