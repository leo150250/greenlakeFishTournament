function SelecionarPeixeAleatorio() {
	var indice = 0;
	//Quanto maior a array de idPeixes, menor a probabilidade de se obter o último peixe da array
	var peixeSelecionado = false;
	while (!peixeSelecionado) {
		if (choose(true,false)) {
			peixeSelecionado=true;
		} else {
			indice=(indice+1)%array_length(idPeixes);
		}
	}
	return global.peixes[idPeixes[indice]];
}