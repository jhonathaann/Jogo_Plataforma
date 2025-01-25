// OBS: PARA EVITAR REPETIÇÕES DE CODIGO FOI CRIADO ESSE OBJ ENTIDADE,
// PARA QUE ESSE OBJ FUNCIONE COMO CLASSE PAI DE ALGUNS OUTROS OBJS QUE TEM CÓDIGOS PARECIDOS


// onde nos vamos fazer a movimentacao de fato do nosso player


// ===== FAZENDO A COLISÃO HORIZONTAL

// checando se eu estou colidindo com a parede
// checando na horizontal
var _col_h	= instance_place(x + velh, y, obj_chao);  // essa funcao checa se vc esta colidindo com alguem. e ela ainda fala com quem vc colidiu

// se eu colidi eu grudo em quem eu colidi
if(_col_h){
	
	// se eu estou indo para a direita eu grudo na esquerda da parede
	if(velh > 0){
		// grudando na parte esquerda da parede
		x = _col_h.bbox_left + (x - bbox_right);  // essa operacao do parenteses eh para criar uma distanciazinha entre o centro do obj_payer e a parade a direita
		
	}
	
	// se eu estou indo para a esquerda eu grudo na direita da parede
	if(velh < 0){
		// grudando na parte direita da parede
		x = _col_h.bbox_right + (x - bbox_left);
	}
	
	// uma vez q eu colidi, nao importa o lado, eu paro
	velh = 0;

}



// movendo de fato o personagem. na horizontal
x += velh;

// ===== FAZENDO A COLISÃO VERTICAL
 var _col_v	= instance_place(x, y + velv, obj_chao);
 
 if(_col_v){
 
	// indo para baixo
	if(velv > 0){
		
		y = _col_v.bbox_top + (y - bbox_bottom);
	}
	
	// indo para cima
	if(velv < 0){
		
		y = _col_v.bbox_bottom + (y - bbox_top);
	}
	
	velv = 0;
 
 }

// aplicando a gravidade 

y += velv

