#region Auxiliares gamepad
global.gamepad_axis_values=[];
for (var i=0; i<gamepad_get_device_count(); i++) {
	global.gamepad_axis_values[i][0][0]=-1;
	global.gamepad_axis_values[i][0][1]=-1;
	global.gamepad_axis_values[i][1][0]=-1;
	global.gamepad_axis_values[i][1][1]=-1;
}
function gamepad_axis_value_pressed(argDispositivo, argEixo, argDirecao) {
	var retorno=false;
	var indiceDirecao=0;
	if (argDirecao==1) {
		indiceDirecao=1;
	}
	var indiceEixo=0;
	switch (indiceEixo) {
		case gp_axislv: indiceEixo=0; break;
		case gp_axislh: indiceEixo=1; break;
	}
	if (gamepad_axis_value(argDispositivo,argEixo)) {
		if (global.gamepad_axis_values[argDispositivo][indiceEixo][indiceDirecao]==-1) {
			retorno = true;
			global.gamepad_axis_values[argDispositivo][indiceEixo][indiceDirecao]=current_time;
		}
	} else {
		if (global.gamepad_axis_values[argDispositivo][indiceEixo][indiceDirecao]!=-1) {
			global.gamepad_axis_values[argDispositivo][indiceEixo][indiceDirecao]=-1;
		}
	}
	return retorno;
}
#endregion

#region Controles jogador
function ControleAcima() {
	var retorno=false;
	if (keyboard_check(vk_up))
	or (keyboard_check(ord("W")))
	or (gamepad_axis_value(0,gp_axislv)<0) {
		retorno=true;
	}
	return retorno;
}
function ControleAbaixo() {
	var retorno=false;
	if (keyboard_check(vk_down))
	or (keyboard_check(ord("S")))
	or (gamepad_axis_value(0,gp_axislv)>0) {
		retorno=true;
	}
	return retorno;
}
function ControleDireita() {
	var retorno=false;
	if (keyboard_check(vk_right))
	or (keyboard_check(ord("D")))
	or (gamepad_axis_value(0,gp_axislh)>0) {
		retorno=true;
	}
	return retorno;
}
function ControleEsquerda() {
	var retorno=false;
	if (keyboard_check(vk_left))
	or (keyboard_check(ord("A")))
	or (gamepad_axis_value(0,gp_axislh)<0) {
		retorno=true;
	}
	return retorno;
}
function ControleAcao() {
	var retorno=false;
	if (keyboard_check_pressed(vk_space))
	or (mouse_check_button_pressed(mb_left))
	or (gamepad_button_check_pressed(0,gp_face1)) {
		retorno=true;
	}
	return retorno;
}
function ControleAcao_soltar() {
	var retorno=false;
	if (keyboard_check_released(vk_space))
	or (mouse_check_button_released(mb_left))
	or (gamepad_button_check_released(0,gp_face1)) {
		retorno=true;
	}
	return retorno;
}
function ControleAcao2() {
	var retorno=false;
	if (keyboard_check_pressed(vk_enter))
	or (keyboard_check_pressed(ord("E")))
	or (gamepad_button_check_pressed(0,gp_face3)) {
		retorno=true;
	}
	return retorno;
}
function ControleAcao2_soltar() {
	var retorno=false;
	if (keyboard_check_released(vk_enter))
	or (keyboard_check_released(ord("E")))
	or (gamepad_button_check_released(0,gp_face3)) {
		retorno=true;
	}
	return retorno;
}
#endregion
#region Controles menu
function ControleMenuAcima() {
	var retorno=false;
	if (keyboard_check_pressed(vk_up))
	or (keyboard_check_pressed(ord("W")))
	or (gamepad_axis_value_pressed(0,gp_axislv,-1)) {
		retorno=true;
	}
	return retorno;
}
function ControleMenuAbaixo() {
	var retorno=false;
	if (keyboard_check_pressed(vk_down))
	or (keyboard_check_pressed(ord("S")))
	or (gamepad_axis_value_pressed(0,gp_axislv,1)) {
		retorno=true;
	}
	return retorno;
}
function ControleMenuDireita() {
	var retorno=false;
	if (keyboard_check_pressed(vk_right))
	or (keyboard_check_pressed(ord("D")))
	or (gamepad_axis_value_pressed(0,gp_axislh,1)) {
		retorno=true;
	}
	return retorno;
}
function ControleMenuEsquerda() {
	var retorno=false;
	if (keyboard_check_pressed(vk_left))
	or (keyboard_check_pressed(ord("A")))
	or (gamepad_axis_value_pressed(0,gp_axislh,-1)) {
		retorno=true;
	}
	return retorno;
}
function ControleMenu() {
	var retorno=false;
	if (keyboard_check_pressed(vk_escape))
	or (gamepad_button_check_pressed(0,gp_start)) {
		retorno=true;
	}
	return retorno;

function ControleAplicar() {
	var retorno=false;
	if (keyboard_check_pressed(vk_enter))
	or (mouse_check_button_pressed(mb_left))
	or (gamepad_button_check_pressed(0,gp_face1)) {
		retorno=true;
	}
	return retorno;
}
function ControleRetornar() {
	var retorno=false;
	if (keyboard_check_pressed(vk_escape))
	or (gamepad_button_check_pressed(0,gp_face2)) {
		retorno=true;
	}
	return retorno;
}
#endregion