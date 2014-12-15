	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM termine */
;
		;
		
	case 4: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 5: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 6: // STATE 3
		;
		((P1 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 4
		;
		_m = unsend(((P1 *)this)->c);
		;
		goto R999;

	case 8: // STATE 6
		;
		_m = unsend(((P1 *)this)->c);
		;
		goto R999;

	case 9: // STATE 11
		;
		now.encours = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 12
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC filtre */
;
		;
		
	case 12: // STATE 2
		;
		now.encours = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 3
		;
		XX = 1;
		unrecv(((P0 *)this)->cin, XX-1, 0, ((P0 *)this)->r, 1);
		unrecv(((P0 *)this)->cin, XX-1, 1, 2, 0);
		((P0 *)this)->r = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 15: // STATE 6
		;
		((P0 *)this)->lastCreated = trpt->bup.ovals[1];
	/* 0 */	((P0 *)this)->lastCreated = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 16: // STATE 7
		;
	/* 0 */	((P0 *)this)->r = trpt->bup.oval;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 17: // STATE 9
		;
		_m = unsend(((P0 *)this)->cout);
		;
		goto R999;
;
		;
		
	case 19: // STATE 16
		;
		XX = 1;
		unrecv(((P0 *)this)->cin, XX-1, 0, ((P0 *)this)->r, 1);
		unrecv(((P0 *)this)->cin, XX-1, 1, 1, 0);
		((P0 *)this)->r = trpt->bup.oval;
		;
		;
		goto R999;

	case 20: // STATE 17
		;
		_m = unsend(((P0 *)this)->cout);
		;
		goto R999;
;
		
	case 21: // STATE 22
		goto R999;

	case 22: // STATE 23
		;
		now.encours = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 24
		;
		p_restor(II);
		;
		;
		goto R999;
	}

