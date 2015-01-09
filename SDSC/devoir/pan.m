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

		 /* PROC :init: */
	case 3: // STATE 1 - q1-1.prm:47 - [(run noeud(2,0,1,c,c27,c29))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!(addproc(II, 1, 0, 2, 0, 1, ((P1 *)this)->c, ((P1 *)this)->c27, ((P1 *)this)->c29)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - q1-1.prm:48 - [(run noeud(7,0,0,c27,c73,c74))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!(addproc(II, 1, 0, 7, 0, 0, ((P1 *)this)->c27, ((P1 *)this)->c73, ((P1 *)this)->c74)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - q1-1.prm:49 - [(run noeud(9,0,0,c29,c95,c91))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (!(addproc(II, 1, 0, 9, 0, 0, ((P1 *)this)->c29, ((P1 *)this)->c95, ((P1 *)this)->c91)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - q1-1.prm:50 - [(run noeud(3,1,0,c73,c,c))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!(addproc(II, 1, 0, 3, 1, 0, ((P1 *)this)->c73, ((P1 *)this)->c, ((P1 *)this)->c)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - q1-1.prm:51 - [(run noeud(4,1,0,c74,c,c))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!(addproc(II, 1, 0, 4, 1, 0, ((P1 *)this)->c74, ((P1 *)this)->c, ((P1 *)this)->c)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 6 - q1-1.prm:52 - [(run noeud(5,1,0,c95,c,c))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (!(addproc(II, 1, 0, 5, 1, 0, ((P1 *)this)->c95, ((P1 *)this)->c, ((P1 *)this)->c)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 7 - q1-1.prm:53 - [(run noeud(1,1,0,c91,c,c))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		if (!(addproc(II, 1, 0, 1, 1, 0, ((P1 *)this)->c91, ((P1 *)this)->c, ((P1 *)this)->c)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 8 - q1-1.prm:54 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC noeud */
	case 11: // STATE 1 - q1-1.prm:9 - [((feuille==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((int)((P0 *)this)->feuille)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 2 - q1-1.prm:10 - [cparent!valeur] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
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
	case 13: // STATE 3 - q1-1.prm:12 - [((feuille==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!((((int)((P0 *)this)->feuille)==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 4 - q1-1.prm:13 - [cgauche?val_g] (0:0:1 - 1)
		reached[0][4] = 1;
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
	case 15: // STATE 5 - q1-1.prm:14 - [cdroite?val_d] (0:0:1 - 1)
		reached[0][5] = 1;
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
	case 16: // STATE 6 - q1-1.prm:15 - [somme = ((valeur+val_g)+val_d)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->somme;
		((P0 *)this)->somme = ((((P0 *)this)->valeur+((P0 *)this)->val_g)+((P0 *)this)->val_d);
#ifdef VAR_RANGES
		logval("noeud:somme", ((P0 *)this)->somme);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 7 - q1-1.prm:19 - [((racine==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		if (!((((int)((P0 *)this)->racine)==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 8 - q1-1.prm:19 - [cparent!somme] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
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
	case 19: // STATE 13 - q1-1.prm:25 - [((racine==0))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!((((int)((P0 *)this)->racine)==0)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: racine */  (trpt+1)->bup.oval = ((P0 *)this)->racine;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->racine = 0;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 14 - q1-1.prm:26 - [cparent?somme] (0:0:1 - 1)
		reached[0][14] = 1;
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
	case 21: // STATE 17 - q1-1.prm:32 - [((feuille==0))] (19:0:1 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		if (!((((int)((P0 *)this)->feuille)==0)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: feuille */  (trpt+1)->bup.oval = ((P0 *)this)->feuille;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->feuille = 0;
		/* merge: printf('[noeud %d] : somme = %d',valeur,somme)(0, 18, 19) */
		reached[0][18] = 1;
		Printf("[noeud %d] : somme = %d", ((P0 *)this)->valeur, ((P0 *)this)->somme);
		_m = 3; goto P999; /* 1 */
	case 22: // STATE 19 - q1-1.prm:34 - [cgauche!somme] (0:0:0 - 1)
		IfNotBlocked
		reached[0][19] = 1;
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
	case 23: // STATE 20 - q1-1.prm:35 - [cdroite!somme] (0:0:0 - 1)
		IfNotBlocked
		reached[0][20] = 1;
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
	case 24: // STATE 23 - q1-1.prm:37 - [-end-] (0:0:0 - 2)
		IfNotBlocked
		reached[0][23] = 1;
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

