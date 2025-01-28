// aqui eh onde nos vamos pegar o input (ou seja, os controles do navegador)


// controlando o player
var _left, _right, _jump;
var _chao = place_meeting(x, y+1, obj_chao);  // var pra saber se o player esta ou nao no chao. se o chao esta a 1 pixel a baixo dele, ele nao esta no chao

// verificando se o jogador esta apertando os botoes

_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.rigrh);
_jump = keyboard_check_pressed(inputs.jump);   // eu quero que ele pule so quando eu apertar o botao

// o player so pode se mexer se ele nao estiver tomando dano (se o timer do dano estiver zerado)
if(timer_dano <= 0){
	velh = (_right - _left) * vel;
}else{
	velh = 0;
}
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
		
		sprite_index = spr_player_run; // mudo para a sprite de correr
		
		// faço ele olha para aonde eu estou indo
		
		// se velh for positivo, ele fica fica virado para a direita. se for negativo, ele flipa para a esq
		image_xscale = sign(velh);  // se o valor for positivo essa funcao retorna 1. se ele for negativo ela vai retornar -1
	
	}else{
		
		sprite_index = spr_player_idle; // mudo para a sprite de ficar parado
	}
	
}else{  // NAO ESTOU NO CHAO
	
	if(velv < 0){
		// estou subindo
		sprite_index = spr_player_jump; // mudando para a sprite de pulo
	}else{
		// estou descendo
		sprite_index = spr_player_fall; // mudando para a sprite de queda
		
		// se eu estou indo pra baixo ai eu posso cair na cabeça do inimigo
		// y+1 = embaixo do player. coloquei +5 para ter uma folginha
		var _inimigo = instance_place(x, y+5, obj_inimigo_pai);
		
		// se eu cai no inimigo E ele ainda estiver vivo
		if(_inimigo and _inimigo.morto == false){
		
			// o player nao pode tomar dano nesse cenario aonde ele encostou no inimigo pela cabeça dele
			dano = false;
			 //show_message("teste");
			// subo no ar novamente (quica)
			velv -= vel_jump;
			
			// avisando para o inimigo que eu o acertei e que por isso ele tomou dano
			_inimigo.dano = true;
			
		}
	}
	
	// aplicando a gravidade apenas quando eu NAO  estiver no chao
	velv += grav
	
	// aplicando para ele virar para o lado certo quando estiver no ar
	if(velh != 0){
		image_xscale = sin(velh);
	}

}


// PLAYER TOMANDO DANO

var _inimigo = instance_place(x, y, obj_inimigo_pai); //  verifico se de fato eu colidi com o inimigo

// se o timer do dano é maior que zero eu diminuo ele
if(timer_dano > 0){
	timer_dano--;
}else{
	// acabou o timer do dano
	dano = false;
}

// diminuindo o tempo de invencibilidade depois que eu tomei dano
if(inv_timer > 0){
	inv_timer--;
	
	// deixando ele transparente para saber que ele esta invencivel
	image_alpha = 0.5;
}else{
	image_alpha = 1;
}

// o player so pode tomar dano se colidir com o inimigo E se o inv_timer for <=0
if(_inimigo && inv_timer <= 0){
	
	
	if(_inimigo.morto == false && _inimigo.dano == false){
		sprite_index = spr_player_dano;  // mudando a sprite
		dano = true;  // player tomou dano
			
		// dando o valor do timer dano
		timer_dano = tempo_dano;
		
		inv_timer = inv_tempo;
		
		// se o player estiver tomando dano, eu diminuo o timer_dano
		//timer_dano--;

	}
}