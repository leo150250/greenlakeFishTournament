#region Movimentação
xFX += (xFoco - x) / divisorMovimento;
x += (xFX - x) / divisorMovimento;
yFX += (yFoco - y) / divisorMovimento;
y += (yFX - y) / divisorMovimento;
image_angle = point_direction(x,y,xFX,yFX);
if (point_distance(x,y,150,150)>500) && (!fisgado) {
	instance_destroy();
}
if (instance_exists(objMinigame)) {
	if (abs(objMinigame.movSpeedX)>0.1 || abs(objMinigame.movSpeedY)>0.1) && (!fisgado) {
		var distanciaDaMira = point_distance(x,y,150,150);
		if (distanciaDaMira < 100) {
			xFoco += lengthdir_x(200-distanciaDaMira,point_direction(x,y,150,150)+180)/2;
			yFoco += lengthdir_y(200-distanciaDaMira,point_direction(x,y,150,150)+180)/2;
		}
	}
	part_system_position(particulas,objMinigame.posMinigameX,objMinigame.posMinigameY);
	part_emitter_region(particulas,0,x-objMinigame.posMinigameX,x-objMinigame.posMinigameX,y-objMinigame.posMinigameY,y-objMinigame.posMinigameY,ps_shape_ellipse,ps_distr_linear);
}
#endregion