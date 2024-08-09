#region Movimentação
xFX += (xFoco - x) / 50;
x += (xFX - x) / 50;
yFX += (yFoco - y) / 50;
y += (yFX - y) / 50;
image_angle = point_direction(x,y,xFX,yFX);
if (point_distance(x,y,150,150)>500) && (!fisgado) {
	instance_destroy();
}
if (abs(objMinigame.movSpeedX)>0.1 || abs(objMinigame.movSpeedY)>0.1) && (!fisgado) {
	var distanciaDaMira = point_distance(x,y,150,150);
	if (distanciaDaMira < 100) {
		xFoco += lengthdir_x(200-distanciaDaMira,point_direction(x,y,150,150)+180)/2;
		yFoco += lengthdir_y(200-distanciaDaMira,point_direction(x,y,150,150)+180)/2;
	}
}
#endregion