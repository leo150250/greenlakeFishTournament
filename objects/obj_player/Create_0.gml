velocity = 3;
direcao = 0;
estado = estadosJogador.normal;
potenciaIsca = 0;
iscaX = x;
iscaY = y;
iscaZ = 0;
iscaZspeed = 0;
podePescar = true;
homem=true;

function obterSpriteJogador(argSprite) {
	if (homem) {
		switch (argSprite) {
			case sprJogadorF_paradoLado: return sprJogadorM_paradoLado; break;
			case sprJogadorF_paradoCima: return sprJogadorM_paradoCima; break;
			case sprJogadorF_paradoBaixo: return sprJogadorM_paradoBaixo; break;
			case sprJogadorF_andandoLado: return sprJogadorM_andandoLado; break;
			case sprJogadorF_andandoCima: return sprJogadorM_andandoCima; break;
			case sprJogadorF_andandoBaixo: return sprJogadorM_andandoBaixo; break;
			case sprJogadorF_pescandoLado: return sprJogadorM_pescandoLado; break;
			case sprJogadorF_pescandoCima: return sprJogadorM_pescandoCima; break;
			case sprJogadorF_pescandoBaixo: return sprJogadorM_pescandoBaixo; break;
		}
	} else {
		return argSprite;
	}
}

minimap = instance_create_layer(0, 0, layer, obj_minimap);

somCarregarIsca = -1;