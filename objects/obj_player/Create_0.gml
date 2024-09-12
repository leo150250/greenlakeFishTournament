velocity = 3;
direcao = 0;
estado = estadosJogador.normal;
potenciaIsca = 0;
iscaX = x;
iscaY = y;
iscaZ = 0;
iscaZspeed = 0;
podePescar = true;
homem=false;

function obterSpriteJogador(argSprite) {
	if (homem) {
		switch (argSprite) {
			case sprJogadorF_paradoLado: return spr_player; break;
			case sprJogadorF_paradoCima: return spr_player; break;
			case sprJogadorF_paradoBaixo: return spr_player; break;
			case sprJogadorF_andandoLado: return spr_player; break;
			case sprJogadorF_andandoCima: return spr_player; break;
			case sprJogadorF_andandoBaixo: return spr_player; break;
			case sprJogadorF_pescandoLado: return spr_player; break;
			case sprJogadorF_pescandoCima: return spr_player; break;
			case sprJogadorF_pescandoBaixo: return spr_player; break;
		}
	} else {
		return argSprite;
	}
}

minimap = instance_create_layer(0, 0, layer, obj_minimap);