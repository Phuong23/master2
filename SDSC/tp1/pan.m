#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM termine */
	case 3: // STATE 1 - _spin_nvr.tmp:3 - [(!((encours==0)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!( !((now.encours==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 13 - _spin_nvr.tmp:10 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 5: // STATE 1 - ex2.prm:40 - [(run filtre(i,c))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!(addproc(II, 1, 0, ((P1 *)this)->i, ((P1 *)this)->c)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - ex2.prm:43 - [((i<20))] (4:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!((((P1 *)this)->i<20)))
			continue;
		/* merge: i = (i+1)(0, 3, 4) */
		reached[1][3] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->i;
		((P1 *)this)->i = (((P1 *)this)->i+1);
#ifdef VAR_RANGES
		logval(":init::i", ((P1 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 7: // STATE 4 - ex2.prm:45 - [c!i,NOMBRE] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (q_full(((P1 *)this)->c))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)this)->c);
		sprintf(simtmp, "%d", ((P1 *)this)->i); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)this)->c, 0, ((P1 *)this)->i, 2, 2);
		_m = 2; goto P999; /* 0 */
	case 8: // STATE 6 - ex2.prm:46 - [c!i,TERMINAISON] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (q_full(((P1 *)this)->c))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)this)->c);
		sprintf(simtmp, "%d", ((P1 *)this)->i); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)this)->c, 0, ((P1 *)this)->i, 1, 2);
		_m = 2; goto P999; /* 0 */
	case 9: // STATE 11 - ex2.prm:49 - [encours = (encours-1)] (0:0:1 - 3)
		IfNotBlocked
		reached[1][11] = 1;
		(trpt+1)->bup.oval = now.encours;
		now.encours = (now.encours-1);
#ifdef VAR_RANGES
		logval("encours", now.encours);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 12 - ex2.prm:50 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC filtre */
	case 11: // STATE 1 - ex2.prm:12 - [printf('%d est premier !!\\n',n)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		Printf("%d est premier !!\n", ((P0 *)this)->n);
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 2 - ex2.prm:14 - [encours = (encours+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = now.encours;
		now.encours = (now.encours+1);
#ifdef VAR_RANGES
		logval("encours", now.encours);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 3 - ex2.prm:17 - [cin?r,NOMBRE] (0:0:1 - 1)
		reached[0][3] = 1;
		if (q_len(((P0 *)this)->cin) == 0) continue;

		XX=1;
		if (2 != qrecv(((P0 *)this)->cin, 0, 1, 0)) continue;
		(trpt+1)->bup.oval = ((P0 *)this)->r;
		;
		((P0 *)this)->r = qrecv(((P0 *)this)->cin, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("filtre:r", ((P0 *)this)->r);
#endif
		;
		qrecv(((P0 *)this)->cin, XX-1, 1, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)this)->cin);
		sprintf(simtmp, "%d", ((P0 *)this)->r); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 14: // STATE 4 - ex2.prm:20 - [(((r%n)!=0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (!(((((P0 *)this)->r%((P0 *)this)->n)!=0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 5 - ex2.prm:22 - [(lastCreated)] (7:0:2 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!(((int)((P0 *)this)->lastCreated)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: lastCreated */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->lastCreated;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->lastCreated = 0;
		/* merge: lastCreated = 0(0, 6, 7) */
		reached[0][6] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->lastCreated);
		((P0 *)this)->lastCreated = 0;
#ifdef VAR_RANGES
		logval("filtre:lastCreated", ((int)((P0 *)this)->lastCreated));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 16: // STATE 7 - ex2.prm:22 - [(run filtre(r,cout))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		if (!(addproc(II, 1, 0, ((P0 *)this)->r, ((P0 *)this)->cout)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: r */  (trpt+1)->bup.oval = ((P0 *)this)->r;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->r = 0;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 9 - ex2.prm:23 - [cout!r,NOMBRE] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (q_full(((P0 *)this)->cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->cout);
		sprintf(simtmp, "%d", ((P0 *)this)->r); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->cout, 0, ((P0 *)this)->r, 2, 2);
		_m = 2; goto P999; /* 0 */
	case 18: // STATE 13 - ex2.prm:25 - [printf('%d est pas premier !\\n',r)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		Printf("%d est pas premier !\n", ((P0 *)this)->r);
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 16 - ex2.prm:28 - [cin?r,TERMINAISON] (0:0:1 - 1)
		reached[0][16] = 1;
		if (q_len(((P0 *)this)->cin) == 0) continue;

		XX=1;
		if (1 != qrecv(((P0 *)this)->cin, 0, 1, 0)) continue;
		(trpt+1)->bup.oval = ((P0 *)this)->r;
		;
		((P0 *)this)->r = qrecv(((P0 *)this)->cin, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("filtre:r", ((P0 *)this)->r);
#endif
		;
		qrecv(((P0 *)this)->cin, XX-1, 1, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)this)->cin);
		sprintf(simtmp, "%d", ((P0 *)this)->r); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 20: // STATE 17 - ex2.prm:28 - [cout!r,TERMINAISON] (0:0:0 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		if (q_full(((P0 *)this)->cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->cout);
		sprintf(simtmp, "%d", ((P0 *)this)->r); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->cout, 0, ((P0 *)this)->r, 1, 2);
		_m = 2; goto P999; /* 0 */
	case 21: // STATE 22 - ex2.prm:31 - [printf('Filtre %d fini\\n',n)] (0:23:0 - 3)
		IfNotBlocked
		reached[0][22] = 1;
		Printf("Filtre %d fini\n", ((P0 *)this)->n);
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 23 - ex2.prm:33 - [encours = (encours-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][23] = 1;
		(trpt+1)->bup.oval = now.encours;
		now.encours = (now.encours-1);
#ifdef VAR_RANGES
		logval("encours", now.encours);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 24 - ex2.prm:35 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][24] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

