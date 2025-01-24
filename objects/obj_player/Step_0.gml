// aqui eh onde nos vamos pegar o input (ou seja, os controles do navegador)


// controlando o player
var _left, _right, _jump;
var _chao = place_meeting(x, y+1, obj_chao);  // var pra saber se o player esta ou nao no chao. se o chao esta a 1 pixel a baixo dele, ele nao esta no chao

// verificando se o jogador esta apertando os botoes

_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.rigrh);
_jump = keyboard_check_pressed(inputs.jump);   // eu quero que ele pule so quando eu apertar o botao

velh = (_right - _left) * vel;
// esse comando acima funciona da seguinte forma: se eu tiver apertando para a direita vai ser 1 - 0 = 1, ou seja
// um valor positivo, logo ele vai para a direita. se for o contrario, vai ser 0 - 1 = -1, dai ele vai para a esq
// multiplicando pela vel pq dai eu me movo de acordo com a minha velocidade



// ===== FAZENDO O PULO
// se eu estou no chao eu pulo
if(_chao)
{
	if(_jump){
	
		velv = -vel_jump;
	}
	
	// se eu estou no chao E velh != 0 = estou me movendo
	if(velh != 0){
			
		// mudo para a sprite de correr
		sprite_index = spr_player_run;
		
		// faço ele olha para aonde eu estou indo
		
		// se velh for positivo, ele fica fica virado para a direita. se for negativo, ele flipa para a esq
		image_xscale = sign(velh);  // se o valor for positivo essa funcao retorna 1. se ele for negativo ela vai retornar -1
	
	}else{
		
		// mudo para a sprite de ficar parado
		sprite_index = spr_player_idle;
	}
	
}else{  // NAO ESTOU NO CHAO
	
	// estou subindo
	if(velv < 0){
		// mudando para a sprite de pulo
		sprite_index = spr_player_jump;
	}else{
		// estou descendo
		// mudando para a sprite de queda
		sprite_index = spr_player_fall;
	}
	
	
	
	// aplicando a gravidade apenas quando eu NAO  estiver no chao
	velv += grav
	
	// aplicando para ele virar para o lado certo quando estiver no ar
	if(velh != 0){
		image_xscale = sin(velh);
	}

}
