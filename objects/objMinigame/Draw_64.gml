
//Posicionamento do Minigame na tela
var posX=(display_get_gui_width()/2);
var posY=(display_get_gui_height()/2);

#region Surface do minigame
draw_set_alpha(1);
if (!surface_exists(surfaceMinigame)) {
	surfaceMinigame=surface_create(300,300);
}
surface_set_target(surfaceMinigame);
draw_sprite_tiled(sprTexLago,0,posMinigameX/2,posMinigameY/2);
with (objMinigamePeixe) {
	part_system_drawit(particulas);
	draw_self();
	if (other.etapaFisgada==0) {
		if (point_distance(x,y,150,150)<16) {
			draw_sprite_ext(sprMinigameMira,1,x,y,2,2,0,c_white,sin(current_time/30)>0);
		}
	}
	if (fisgado) {
		draw_line_color(x,y,150,150,c_gray,c_white);
	}
}
gpu_set_blendmode(bm_add);
draw_sprite_tiled_ext(sprTexFXLago,0,(posMinigameX/2)+(current_time/100)+sin(current_time/151),(posMinigameY/2)+(current_time/100)+sin(current_time/154),2,2,c_white,sin(degtorad(current_time/10))/10);
draw_sprite_tiled_ext(sprTexFXLago,1,(posMinigameX/2)+(current_time/100)+sin(current_time/152),(posMinigameY/2)+(current_time/100)+sin(current_time/155),2,2,c_white,sin(degtorad((current_time/10)+120))/10);
draw_sprite_tiled_ext(sprTexFXLago,2,(posMinigameX/2)+(current_time/100)+sin(current_time/153),(posMinigameY/2)+(current_time/100)+sin(current_time/156),2,2,c_white,sin(degtorad((current_time/10)+240))/10);
draw_sprite_ext(sprMinigame,1,150,150,1,1,0,c_white,1);
gpu_set_blendmode(bm_normal);
surface_reset_target();
#endregion

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
	if (texX==1) || (texX==0.7) {
		texX=0.3;
	} else {
		texX=0.7;
	}
}
texX=round(texX);
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
draw_surface_ext(surfaceMinigame,posX-(150*raioMinigame),posY-(150*raioMinigame),raioMinigame,raioMinigame,0,c_white,1);
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);
switch (etapaFisgada) {
	case 0: {
		draw_sprite(sprMinigameMira,0,posX,posY);
	} break;
	case 1: {
		draw_sprite_ext(sprMinigameMira,0,posX,posY,2,2,0,c_white,sin(current_time/30)>0);
	} break;
}
#endregion