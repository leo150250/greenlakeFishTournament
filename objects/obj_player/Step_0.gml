if (cJogo.estado=estadosJogo.moverJogador) {
	switch (estado) {
		case estadosJogador.normal: {
			//Mover jogador
			var _direction = move_direction();
			var _dx = velocity * _direction.x;
			var _dy = velocity * _direction.y;
			if (_direction.speed==0) {
				image_speed = 0;
				switch (direcao) {
					case 0: sprite_index = obterSpriteJogador(sprJogadorF_paradoLado); image_xscale=1; break;
					case 90: sprite_index = obterSpriteJogador(sprJogadorF_paradoCima); break;
					case 180: sprite_index = obterSpriteJogador(sprJogadorF_paradoLado); image_xscale=-1; break;
					case 270: sprite_index = obterSpriteJogador(sprJogadorF_paradoBaixo); break;
				}
			} else {
				image_speed = 1;
				if (!audio_is_playing(sndPassos)) {
					executarSom(sndPassos);
				}
				switch (direcao) {
					case 0: sprite_index = obterSpriteJogador(sprJogadorF_andandoLado); image_xscale=1; break;
					case 90: sprite_index = obterSpriteJogador(sprJogadorF_andandoCima); break;
					case 180: sprite_index = obterSpriteJogador(sprJogadorF_andandoLado); image_xscale=-1; break;
					case 270: sprite_index = obterSpriteJogador(sprJogadorF_andandoBaixo); break;
				}
			}
			move_and_collide(_dx, _dy, objCampoDePesca, 2);
			//Carregar a isca
			if (ControleAcao()) && (podePescar) {
				potenciaIsca=0;
				estado=estadosJogador.carregandoIsca;
			}
		} break;
		case estadosJogador.carregandoIsca: {
			image_speed = 0;
			image_index = 0;
			switch (direcao) {
				case 0: sprite_index = obterSpriteJogador(sprJogadorF_pescandoLado); image_xscale=1; break;
				case 90: sprite_index = obterSpriteJogador(sprJogadorF_pescandoCima); break;
				case 180: sprite_index = obterSpriteJogador(sprJogadorF_pescandoLado); image_xscale=-1; break;
				case 270: sprite_index = obterSpriteJogador(sprJogadorF_pescandoBaixo); break;
			}
			potenciaIsca+=0.01;
			if (potenciaIsca>1) {
				potenciaIsca-=1;
			}
			if (somCarregarIsca==-1) {
				somCarregarIsca=executarSom(sndLoopAnzol,true);
			}
			audio_sound_pitch(somCarregarIsca,5+((1-abs((frac(potenciaIsca)*2)-1))*10));
			if (ControleAcao_soltar()) {
				audio_stop_sound(somCarregarIsca);
				somCarregarIsca=-1;
				executarSom(sndAnzolLancamento);
				potenciaIsca=1-abs((frac(potenciaIsca)*2)-1);
				estado=estadosJogador.lancandoIsca;
				iscaX=x;
				iscaY=y;
				iscaZ=-32;
				iscaZspeed=-5-(potenciaIsca*2);
			}
		} break;
		case estadosJogador.lancandoIsca: {
			image_index = 1;
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
					image_index = 2;
					estado=estadosJogador.aguardando;
					executarSom(sndAnzolAgua);
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

