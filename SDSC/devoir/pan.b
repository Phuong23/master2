	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM somCorrecte */
;
		;
		
	case 4: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM connaisSom */
;
		;
		
	case 6: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM protocTermi */
;
		;
		
	case 8: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 9: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 10: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 12: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 13: // STATE 5
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 14: // STATE 6
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 15: // STATE 7
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 16: // STATE 8
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC noeud */

	case 17: // STATE 1
		;
		now.nbProcDemarre = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 4
		;
		((P0 *)this)->somme = trpt->bup.ovals[2];
		((P0 *)this)->val_d = trpt->bup.ovals[1];
		((P0 *)this)->val_g = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		;
		
	case 20: // STATE 6
		;
		_m = unsend(((P0 *)this)->cparent);
		;
		goto R999;
;
		;
		
	case 22: // STATE 8
		;
		XX = 1;
		unrecv(((P0 *)this)->cgauche, XX-1, 0, ((P0 *)this)->val_g, 1);
		((P0 *)this)->val_g = trpt->bup.oval;
		;
		;
		goto R999;

	case 23: // STATE 9
		;
		XX = 1;
		unrecv(((P0 *)this)->cdroite, XX-1, 0, ((P0 *)this)->val_d, 1);
		((P0 *)this)->val_d = trpt->bup.oval;
		;
		;
		goto R999;

	case 24: // STATE 10
		;
		((P0 *)this)->somme = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 26: // STATE 12
		;
		_m = unsend(((P0 *)this)->cparent);
		;
		goto R999;

	case 27: // STATE 19
		;
	/* 0 */	((P0 *)this)->racine = trpt->bup.oval;
		;
		;
		goto R999;

	case 28: // STATE 20
		;
		XX = 1;
		unrecv(((P0 *)this)->cparent, XX-1, 0, ((P0 *)this)->somme, 1);
		((P0 *)this)->somme = trpt->bup.oval;
		;
		;
		goto R999;

	case 29: // STATE 21
		;
		now.jeConnaisSomme = trpt->bup.oval;
		;
		goto R999;

	case 30: // STATE 23
		;
		now.jeConnaisSomme = trpt->bup.oval;
		;
		goto R999;

	case 31: // STATE 24
		;
		now.sommeTotale = trpt->bup.oval;
		;
		goto R999;

	case 32: // STATE 27
		;
	/* 0 */	((P0 *)this)->feuille = trpt->bup.oval;
		;
		;
		goto R999;

	case 33: // STATE 28
		;
		_m = unsend(((P0 *)this)->cgauche);
		;
		goto R999;

	case 34: // STATE 29
		;
		_m = unsend(((P0 *)this)->cdroite);
		;
		goto R999;
;
		
	case 35: // STATE 31
		goto R999;
;
		
	case 36: // STATE 34
		goto R999;

	case 37: // STATE 35
		;
		now.nbProcFini = trpt->bup.oval;
		;
		goto R999;

	case 38: // STATE 36
		;
		p_restor(II);
		;
		;
		goto R999;
	}

