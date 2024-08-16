global.peixes = [];
//Classes
function Comportamento(_frequencia,_velocidade) constructor {
	frequencia = _frequencia;
	velocidade = _velocidade;
};
function Peixe(_nome, _spriteIcone, _spritePeixe, _valor, _descricao, _comportamento) constructor {
	nome = _nome;
	spriteIcone = _spriteIcone;
	spritePeixe = _spritePeixe;
	valor = _valor;
	descricao = _descricao;
	comportamento = _comportamento;
	if (spritePeixe==sprPeixeTeste) || (spriteIcone=sprPeixeTeste_icone) {
		show_debug_message("Peixe "+nome+" está com sprites padrões!");
	}
};
//Funções
function SelecionarPeixeAleatorio(_idPeixes) {
	var indice = 0;
	//Quanto maior a array de idPeixes, menor a probabilidade de se obter o último peixe da array
	var peixeSelecionado = false;
	while (!peixeSelecionado) {
		if (choose(true,false)) {
			peixeSelecionado=true;
		} else {
			indice=(indice+1)%array_length(_idPeixes);
		}
	}
	return _idPeixes[indice];
}
//Definições
array_push(global.peixes,new Peixe("Tilápia",sprPeixeTeste_icone,sprTilapia,140,"Esse peixe é a estrela dos lagos e rios. É resistente, cresce rápido e se adapta em qualquer lugar, tipo aquele amigo que se dá bem em qualquer festa. Versátil, saborosa e popular, a tilápia é o peixinho que todo mundo ama!",new Comportamento(2,2)));
array_push(global.peixes,new Peixe("Carpa",sprPeixeTeste_icone,sprCarpa,180,"Grande e colorida, parece um peixe de aquário gigante. Ela é tranquila, vegetariana e adora um lodo. Pode viver décadas e cresce como se estivesse em academia de peixes. A carpa é aquela veterana da turma, cheia de histórias e comilança garantida!",new Comportamento(3,3)));
array_push(global.peixes,new Peixe("Tucunaré",sprPeixeTeste_icone,sprTucunare,400,"Esse peixe é o troféu dos pescadores, sempre pronto para uma briga boa na ponta da linha. Com suas cores vibrantes e agressividade, ele não deixa ninguém entediado. É como aquele amigo competitivo que anima qualquer jogo!",new Comportamento(4,4)));
array_push(global.peixes,new Peixe("Lambari",sprPeixeTeste_icone,sprLambari,50,"Pequeno, rápido e cheio de energia, é a diversão dos pescadores iniciantes. Fácil de pegar e sempre em cardume, o lambari é o peixe que chega chegando em qualquer lago ou rio!",new Comportamento(1,1)));
array_push(global.peixes,new Peixe("Bagre",sprPeixeTeste_icone,sprBagre,240,"Com seu bigode estiloso e jeito tranquilo, ele prefere os fundos dos rios e lagos, curtindo a vida na calmaria. Fácil de pegar, é famoso pela resistência e pelo sabor. O bagre é aquele amigo sossegado que está sempre de boa, mas quando precisa, sabe se defender.",new Comportamento(3,3)));
array_push(global.peixes,new Peixe("Dourado",sprPeixeTeste_icone,sprPeixeTeste,600,"Com suas escamas douradas e dentes afiados, ele é o sonho dos pescadores. Rápido e forte, dá um show de acrobacias quando fisgado. É aquele peixe que faz a adrenalina subir e a história de pescador ficar ainda melhor. O dourado é a estrela que brilha em qualquer rio!",new Comportamento(5,5)));
array_push(global.peixes,new Peixe("Piranha",sprPeixeTeste_icone,sprPeixeTeste,280,"Pequena, mas cheia de atitude, com dentes afiados e fama de ser feroz. É o peixe que todo mundo respeita, capaz de devorar rápido o que encontra. A piranha é a rebelde do grupo, sempre pronta para causar e deixar sua marca!",new Comportamento(4,4)));
array_push(global.peixes,new Peixe("Pacu",sprPeixeTeste_icone,sprPeixeTeste,270,"Com uma mordida poderosa e dentes parecidos com os humanos, ele prefere uma dieta à base de frutas e sementes. Tranquilo e amigável, é aquele peixe que vai com a maré, curtindo a vida nas águas calmas. O pacu é o bonachão dos rios, sempre pronto para um lanche saudável!",new Comportamento(3,3)));
array_push(global.peixes,new Peixe("Pintado",sprPeixeTeste_icone,sprPeixeTeste,440,"Com seu corpo alongado e pintas características, ele é um peixe imponente e elegante. Forte, mas pacífico, prefere nadar nas águas profundas. O pintado é aquele amigo grandão e tranquilo, sempre impressionando pela presença e sabor!",new Comportamento(4,4)));
array_push(global.peixes,new Peixe("Curimbatá",sprPeixeTeste_icone,sprPeixeTeste,120,"Com seu corpo elegante e escamas prateadas, ele nada com uma graça natural. Adaptável e tranquilo, é o peixe que sabe como se comportar em diferentes ambientes aquáticos. O curimbatá é o amigo que está sempre por perto, agregando beleza e calma às águas onde vive.",new Comportamento(2,2)));
array_push(global.peixes,new Peixe("Atum",sprPeixeTeste_icone,sprPeixeTeste,750,"Grande, veloz e com uma presença imponente, ele domina as águas com sua força e agilidade. Com uma vida ativa e migratória, é o peixe que viaja longas distâncias, sempre em movimento. O atum é o astro do oceano, sempre impressionando com seu estilo de vida aventureiro e seu status de lenda marinha!",new Comportamento(5,5)));
array_push(global.peixes,new Peixe("Sardinha",sprPeixeTeste_icone,sprPeixeTeste,40,"Pequena e ágil, ela nada em grandes cardumes, sempre acompanhada de muitos amigos. Com sua vida ativa e sociável, é a peixe que dá ritmo às águas. A sardinha é a animadora do oceano, sempre cheia de energia e charme, fazendo sua presença ser notada em qualquer cardume!",new Comportamento(1,1)));
array_push(global.peixes,new Peixe("Badejo",sprPeixeTeste_icone,sprPeixeTeste,360,"Com seu corpo robusto e cores marcantes, ele patrulha os recifes com uma presença impressionante. Forte e astuto, é o peixe que domina seu território com confiança. O badejo é o destemido líder do recife, sempre pronto para uma boa caçada e para exibir sua imponência no fundo do mar!",new Comportamento(4,4)));
array_push(global.peixes,new Peixe("Garoupa",sprPeixeTeste_icone,sprPeixeTeste,400,"Com seu corpo robusto e padrões coloridos, ela nada com uma mistura de elegância e força. Popular entre mergulhadores e pescadores, é a peixe que sempre atrai olhares com seu charme e tamanho imponente. A garoupa é a estrela dos recifes, sempre deslumbrando com sua beleza e presença marcante!",new Comportamento(4,4)));
array_push(global.peixes,new Peixe("Anchova",sprPeixeTeste_icone,sprPeixeTeste,240,"Ágil e com um corpo esguio, ela se move rapidamente entre as ondas e é conhecida por sua habilidade de caça. Com uma personalidade de líder nos cardumes e um apetite voraz, a anchova é a mestre da furtividade marinha. Sempre em movimento e cheia de energia, ela faz a vida no mar parecer uma grande aventura!",new Comportamento(3,3)));
