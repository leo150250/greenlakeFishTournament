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
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false,false,false,true);
draw_set_alpha(0);
draw_set_color(c_black);
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_circle(posX-1,posY-1,107*raioMinigame,false);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);
gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
//draw_sprite_ext(sprMinigame,1,posX,posY,raioMinigame,raioMinigame,0,c_white,1);
draw_sprite_tiled(sprTexLago,0,posMinigameX/2,posMinigameY/2);
gpu_set_blendmode_ext(bm_src_alpha,bm_inv_dest_alpha);
draw_sprite_tiled_ext(sprTexFXLago,0,(posMinigameX/2)+(current_time/100),(posMinigameY/2)+(current_time/100),1,1,c_white,sin(degtorad(current_time/10))/10);
draw_sprite_tiled_ext(sprTexFXLago,1,(posMinigameX/2)+(current_time/100),(posMinigameY/2)+(current_time/100),1,1,c_white,sin(degtorad((current_time/10)+120))/10);
draw_sprite_tiled_ext(sprTexFXLago,2,(posMinigameX/2)+(current_time/100),(posMinigameY/2)+(current_time/100),1,1,c_white,sin(degtorad((current_time/10)+240))/10);
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);
#endregion
//draw_surface_ext(surfaceInterface,posX-(150*raioMinigame),posY-(150*raioMinigame),raioMinigame,raioMinigame,0,c_white,1);