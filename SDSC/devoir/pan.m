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

		 /* CLAIM protocTermi */
	case 3: // STATE 1 - _spin_nvr.tmp:3 - [(!((nbProcDemarre==nbProcFini)))] (0:0:0 - 1)
		
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
		if (!( !((now.nbProcDemarre==now.nbProcFini))))
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
	case 5: // STATE 1 - q1-1.prm:62 - [(run noeud(2,0,1,c,c27,c29))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!(addproc(II, 1, 0, 2, 0, 1, ((P1 *)this)->c, ((P1 *)this)->c27, ((P1 *)this)->c29)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - q1-1.prm:63 - [(run noeud(7,0,0,c27,c73,c74))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!(addproc(II, 1, 0, 7, 0, 0, ((P1 *)this)->c27, ((P1 *)this)->c73, ((P1 *)this)->c74)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 3 - q1-1.prm:64 - [(run noeud(9,0,0,c29,c95,c91))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (!(addproc(II, 1, 0, 9, 0, 0, ((P1 *)this)->c29, ((P1 *)this)->c95, ((P1 *)this)->c91)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 4 - q1-1.prm:65 - [(run noeud(3,1,0,c73,c,c))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!(addproc(II, 1, 0, 3, 1, 0, ((P1 *)this)->c73, ((P1 *)this)->c, ((P1 *)this)->c)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 5 - q1-1.prm:66 - [(run noeud(4,1,0,c74,c,c))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!(addproc(II, 1, 0, 4, 1, 0, ((P1 *)this)->c74, ((P1 *)this)->c, ((P1 *)this)->c)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 6 - q1-1.prm:67 - [(run noeud(5,1,0,c95,c,c))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (!(addproc(II, 1, 0, 5, 1, 0, ((P1 *)this)->c95, ((P1 *)this)->c, ((P1 *)this)->c)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 7 - q1-1.prm:68 - [(run noeud(1,1,0,c91,c,c))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		if (!(addproc(II, 1, 0, 1, 1, 0, ((P1 *)this)->c91, ((P1 *)this)->c, ((P1 *)this)->c)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 8 - q1-1.prm:69 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC noeud */
	case 13: // STATE 1 - q1-1.prm:7 - [nbProcDemarre = (nbProcDemarre+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = now.nbProcDemarre;
		now.nbProcDemarre = (now.nbProcDemarre+1);
#ifdef VAR_RANGES
		logval("nbProcDemarre", now.nbProcDemarre);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 2 - q1-1.prm:11 - [val_g = 0] (0:17:3 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->val_g;
		((P0 *)this)->val_g = 0;
#ifdef VAR_RANGES
		logval("noeud:val_g", ((P0 *)this)->val_g);
#endif
		;
		/* merge: val_d = 0(17, 3, 17) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->val_d;
		((P0 *)this)->val_d = 0;
#ifdef VAR_RANGES
		logval("noeud:val_d", ((P0 *)this)->val_d);
#endif
		;
		/* merge: somme = 0(17, 4, 17) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->somme;
		((P0 *)this)->somme = 0;
#ifdef VAR_RANGES
		logval("noeud:somme", ((P0 *)this)->somme);
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 15: // STATE 5 - q1-1.prm:15 - [((feuille==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)((P0 *)this)->feuille)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 6 - q1-1.prm:16 - [cparent!valeur] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		if (q_len(((P0 *)this)->cparent))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->cparent);
		sprintf(simtmp, "%d", ((P0 *)this)->valeur); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->cparent, 0, ((P0 *)this)->valeur, 1);
		{ boq = ((P0 *)this)->cparent; };
		_m = 2; goto P999; /* 0 */
	case 17: // STATE 7 - q1-1.prm:18 - [((feuille==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		if (!((((int)((P0 *)this)->feuille)==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 8 - q1-1.prm:19 - [cgauche?val_g] (0:0:1 - 1)
		reached[0][8] = 1;
		if (boq != ((P0 *)this)->cgauche) continue;
		if (q_len(((P0 *)this)->cgauche) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->val_g;
		;
		((P0 *)this)->val_g = qrecv(((P0 *)this)->cgauche, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("noeud:val_g", ((P0 *)this)->val_g);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)this)->cgauche);
		sprintf(simtmp, "%d", ((P0 *)this)->val_g); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P0 *)this)->cgauche))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 19: // STATE 9 - q1-1.prm:20 - [cdroite?val_d] (0:0:1 - 1)
		reached[0][9] = 1;
		if (boq != ((P0 *)this)->cdroite) continue;
		if (q_len(((P0 *)this)->cdroite) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->val_d;
		;
		((P0 *)this)->val_d = qrecv(((P0 *)this)->cdroite, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("noeud:val_d", ((P0 *)this)->val_d);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)this)->cdroite);
		sprintf(simtmp, "%d", ((P0 *)this)->val_d); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P0 *)this)->cdroite))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 20: // STATE 10 - q1-1.prm:21 - [somme = ((valeur+val_g)+val_d)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->somme;
		((P0 *)this)->somme = ((((P0 *)this)->valeur+((P0 *)this)->val_g)+((P0 *)this)->val_d);
#ifdef VAR_RANGES
		logval("noeud:somme", ((P0 *)this)->somme);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 11 - q1-1.prm:25 - [((racine==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		if (!((((int)((P0 *)this)->racine)==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 12 - q1-1.prm:25 - [cparent!somme] (0:0:0 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		if (q_len(((P0 *)this)->cparent))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->cparent);
		sprintf(simtmp, "%d", ((P0 *)this)->somme); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->cparent, 0, ((P0 *)this)->somme, 1);
		{ boq = ((P0 *)this)->cparent; };
		_m = 2; goto P999; /* 0 */
	case 23: // STATE 19 - q1-1.prm:32 - [((racine==0))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		if (!((((int)((P0 *)this)->racine)==0)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: racine */  (trpt+1)->bup.oval = ((P0 *)this)->racine;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->racine = 0;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 20 - q1-1.prm:33 - [cparent?somme] (0:0:1 - 1)
		reached[0][20] = 1;
		if (boq != ((P0 *)this)->cparent) continue;
		if (q_len(((P0 *)this)->cparent) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->somme;
		;
		((P0 *)this)->somme = qrecv(((P0 *)this)->cparent, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("noeud:somme", ((P0 *)this)->somme);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)this)->cparent);
		sprintf(simtmp, "%d", ((P0 *)this)->somme); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P0 *)this)->cparent))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 25: // STATE 25 - q1-1.prm:40 - [((feuille==0))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][25] = 1;
		if (!((((int)((P0 *)this)->feuille)==0)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: feuille */  (trpt+1)->bup.oval = ((P0 *)this)->feuille;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->feuille = 0;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 26 - q1-1.prm:41 - [cgauche!somme] (0:0:0 - 1)
		IfNotBlocked
		reached[0][26] = 1;
		if (q_len(((P0 *)this)->cgauche))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->cgauche);
		sprintf(simtmp, "%d", ((P0 *)this)->somme); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->cgauche, 0, ((P0 *)this)->somme, 1);
		{ boq = ((P0 *)this)->cgauche; };
		_m = 2; goto P999; /* 0 */
	case 27: // STATE 27 - q1-1.prm:42 - [cdroite!somme] (0:0:0 - 1)
		IfNotBlocked
		reached[0][27] = 1;
		if (q_len(((P0 *)this)->cdroite))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->cdroite);
		sprintf(simtmp, "%d", ((P0 *)this)->somme); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->cdroite, 0, ((P0 *)this)->somme, 1);
		{ boq = ((P0 *)this)->cdroite; };
		_m = 2; goto P999; /* 0 */
	case 28: // STATE 29 - q1-1.prm:43 - [(1)] (33:0:0 - 1)
		IfNotBlocked
		reached[0][29] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(33, 31, 33) */
		reached[0][31] = 1;
		;
		/* merge: printf('[noeud %d] : somme = %d\\n',valeur,somme)(33, 32, 33) */
		reached[0][32] = 1;
		Printf("[noeud %d] : somme = %d\n", ((P0 *)this)->valeur, ((P0 *)this)->somme);
		_m = 3; goto P999; /* 2 */
	case 29: // STATE 32 - q1-1.prm:47 - [printf('[noeud %d] : somme = %d\\n',valeur,somme)] (0:33:0 - 3)
		IfNotBlocked
		reached[0][32] = 1;
		Printf("[noeud %d] : somme = %d\n", ((P0 *)this)->valeur, ((P0 *)this)->somme);
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 33 - q1-1.prm:50 - [nbProcFini = (nbProcFini+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][33] = 1;
		(trpt+1)->bup.oval = now.nbProcFini;
		now.nbProcFini = (now.nbProcFini+1);
#ifdef VAR_RANGES
		logval("nbProcFini", now.nbProcFini);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 34 - q1-1.prm:52 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][34] = 1;
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

