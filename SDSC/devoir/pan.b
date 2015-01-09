	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 6: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 7: // STATE 5
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 8: // STATE 6
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 9: // STATE 7
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 10: // STATE 8
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC noeud */
;
		;
		
	case 12: // STATE 2
		;
		_m = unsend(((P0 *)this)->cparent);
		;
		goto R999;
;
		;
		
	case 14: // STATE 4
		;
		XX = 1;
		unrecv(((P0 *)this)->cgauche, XX-1, 0, ((P0 *)this)->val_g, 1);
		((P0 *)this)->val_g = trpt->bup.oval;
		;
		;
		goto R999;

	case 15: // STATE 5
		;
		XX = 1;
		unrecv(((P0 *)this)->cdroite, XX-1, 0, ((P0 *)this)->val_d, 1);
		((P0 *)this)->val_d = trpt->bup.oval;
		;
		;
		goto R999;

	case 16: // STATE 6
		;
		((P0 *)this)->somme = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 18: // STATE 8
		;
		_m = unsend(((P0 *)this)->cparent);
		;
		goto R999;

	case 19: // STATE 13
		;
	/* 0 */	((P0 *)this)->racine = trpt->bup.oval;
		;
		;
		goto R999;

	case 20: // STATE 14
		;
		XX = 1;
		unrecv(((P0 *)this)->cparent, XX-1, 0, ((P0 *)this)->somme, 1);
		((P0 *)this)->somme = trpt->bup.oval;
		;
		;
		goto R999;

	case 21: // STATE 17
		;
	/* 0 */	((P0 *)this)->feuille = trpt->bup.oval;
		;
		;
		goto R999;

	case 22: // STATE 19
		;
		_m = unsend(((P0 *)this)->cgauche);
		;
		goto R999;

	case 23: // STATE 20
		;
		_m = unsend(((P0 *)this)->cdroite);
		;
		goto R999;

	case 24: // STATE 23
		;
		p_restor(II);
		;
		;
		goto R999;
	}

