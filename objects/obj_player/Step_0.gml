if (cJogo.estado=estadosJogo.moverJogador) {
	switch (estado) {
		case estadosJogador.normal: {
			//Mover jogador
			var _direction = move_direction();
			var _dx = velocity * _direction.x;
			var _dy = velocity * _direction.y;
			move_and_collide(_dx, _dy, objCampoDePesca, 2);
			//Carregar a isca
			if (ControleAcao()) && (podePescar) {
				potenciaIsca=0;
				estado=estadosJogador.carregandoIsca;
			}
		} break;
		case estadosJogador.carregandoIsca: {
			potenciaIsca+=0.01;
			if (potenciaIsca>1) {
				potenciaIsca-=1;
			}
			if (ControleAcao_soltar()) {
				potenciaIsca=1-abs((frac(potenciaIsca)*2)-1);
				estado=estadosJogador.lancandoIsca;
				iscaX=x;
				iscaY=y;
				iscaZ=0;
				iscaZspeed=-5-(potenciaIsca*2);
			}
		} break;
		case estadosJogador.lancandoIsca: {
			iscaX+=lengthdir_x(potenciaIsca*8,direcao);
			iscaY+=lengthdir_y(potenciaIsca*8,direcao);
			iscaZ+=iscaZspeed;
			iscaZspeed+=0.5;
			if (iscaZ>=0) {
				iscaZ=0;
				var campoPescaCaiu=collision_point(iscaX,iscaY,objCampoDePesca,true,true);
				if (campoPescaCaiu!=noone) {
					instance_create_layer(0,0,layer,objMinigame,{
						idPeixes:campoPescaCaiu.idPeixes
					});
					estado=estadosJogador.aguardando;
				} else {
					estado=estadosJogador.normal;
				}
			}
		} break;
		case estadosJogador.aguardando: {
			iscaZ=-1+random(2);
		} break;
	}
}
stay_inside_room();