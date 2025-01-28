// aqui eh onde criamos as nossas variaveis
// sera as variaveis bases dele

velh = 0; // velocidade na horizontal inicial
velv = 0; // velocidade na vertical inicial
vel = 4;   // essa eh a velocidade base de quando ele for se mover
grav	= .5;   // o quanto o personagem sera afetado pela gravidade. e ela eh um valor pequeno pq ela eh cumulativa
vel_jump = 8.3;

dano = false;
tempo_dano =  game_get_speed(gamespeed_fps) * 0.6; // ele vai tomar dano por 1 segundo (nesse tempo ele nao vai conseguir se mexer)
timer_dano = 0;

inv_tempo =  game_get_speed(gamespeed_fps) * 2;  // o player vai ficar invencivel por 3 segundos depois que tomar dano
inv_timer = 0;  // o player so pode tomar dano se o inv_timer for 0


// criando uma estrutura para as entradas do teclado
inputs = {
		
		left	: ord("A"),		// andar para a esquerda
		rigrh	: ord("D"),		// andar para a direita
		jump	: vk_space		// pular
		
}
