// aqui eh onde criamos as nossas variaveis
// sera as variaveis bases dele

velh = 0; // velocidade na horizontal inicial
velv = 0; // velocidade na vertical inicial
vel = 4;   // essa eh a velocidade base de quando ele for se mover
grav	= .3;   // o quanto o personagem sera afetado pela gravidade. e ela eh um valor pequeno pq ela eh cumulativa
vel_jump = 6;

// criando uma estrutura para as entradas do teclado
inputs = {
		
		left	: ord("A"),		// andar para a esquerda
		rigrh	: ord("D"),		// andar para a direita
		jump	: vk_space		// pular
		
}
