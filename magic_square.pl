% ==============================================================================
% FILE          : magic_square.pl
% ROLE          : Magic Square Solver (Constraint Logic Programming)
% CONTEXT       : Logic Programming - Paris 8 University (Legacy 2020)
% REFACTORED    : 2026 (Documentation & Predicate Renaming)
% ==============================================================================

% Module for in/2:
% 1 - As indicated in the swi-prolog manual
% 2 - The one that works for this specific environment
% :- use_module(library(tipc/tipc_linda)).
:- use_module(library('clp/bounds')).

% gen_carré_magique(+N):
% Main driver to unify a magic square, generate answers and display them.
gen_carré_magique(N) :-
	Valeur_limit is N*N,
	Somme is N*(N*N+1)/2,
	length(Matrice, Valeur_limit),
    Matrice in 1..Valeur_limit,
    all_different(Matrice),
	ligne(1, N, Matrice, Somme),
	colonne(1, N, Matrice, Somme),
   	labeling([], Matrice),
    carré_magique(N, Matrice).

% ligne/4: Unification of extracted rows to ensure they equal the Magic Sum.
ligne(N, Valeur_limit, Matrice, Somme) :-
	gen_ligne(0, N, Valeur_limit, Matrice, [], Ligne),
	sum(Ligne,#=,Somme),
	N1 is N + 1,
	ligne(N1, Valeur_limit, Matrice, Somme).
ligne(_, _, _, _).

% gen_ligne/4: Rule to unify rows from a variable list.
gen_ligne(Ligne_x, Ligne_max, Matrice, Ligne) :- gen_ligne(0, Ligne_x, Ligne_max, Matrice, [], Ligne).
gen_ligne(N, Ligne_x, Ligne_max, Matrice, L1, L2) :-
	N < Ligne_max,
	!,					% Cut to maintain identical format after the first result.
	Indice is (Ligne_x - 1) * Ligne_max + N,
	nth0(Indice, Matrice, X),
	N1 is N+1,
	gen_ligne(N1, Ligne_x, Ligne_max, Matrice, [X | L1], L2). 
gen_ligne(_, _, _, _, Ligne, Ligne).

% colonne/4: Unification of extracted columns to ensure they equal the Magic Sum.
colonne(N, Valeur_limit, Matrice, Somme) :-
	N =< Valeur_limit,			
	gen_colonne(N, Valeur_limit, Matrice, Ligne),
	sum(Ligne,#=,Somme),
	N1 is N + 1,
	colonne(N1, Valeur_limit, Matrice, Somme).
colonne(_, _, _, _).

% gen_colonne/4: Rule to unify columns from a variable list.
gen_colonne(Colonne_x, Colonne_max, Matrice, Colonne) :-
	Colonne_x1 is Colonne_x - 1,
	gen_colonne(0, Colonne_x1, Colonne_max, Matrice, [], Colonne).

gen_colonne(N, Colonne_x, Colonne_max, Matrice, L, Colonne) :-
	Indice is N * Colonne_max + Colonne_x,
	Indice < Colonne_max * Colonne_max,
	nth0(Indice, Matrice,  X),
	N1 is N + 1,
	gen_colonne(N1, Colonne_x, Colonne_max, Matrice, [X | L], Colonne).
gen_colonne(_, _, _, _, Colonne, Colonne).

% carré_magique/2: Functions for the visual output of the magic square.
carré_magique(Valeur_limit, Matrice) :- carré_magique(1, Valeur_limit, Matrice).

carré_magique(N, Valeur_limit, Matrice) :-
	N =< Valeur_limit,		
	!,						% Cut to only display unified answers and prevent empty returns.
	gen_ligne(N, Valeur_limit, Matrice ,Ligne),
	représente_carré_magique(Représentation, 1, Valeur_limit),
	maplist(représente_ligne ,Ligne, Représentation),
	format("\n"),
	N1 is N + 1,
	carré_magique(N1, Valeur_limit, Matrice). 
carré_magique(_, _, _):- !.

% représente_ligne/2: Format applied to a single cell.
représente_ligne(X, Y) :- format('|~t~a~*||', [X,Y]).

% représente_carré_magique/3: Prepares formatting logic before printing.
représente_carré_magique([Digit | Représentation], N, Valeur_limit) :-
	N =< Valeur_limit,
	!,                   	 %cut pour conserver le format identique àprès le premier résultat
	Digit is 4 * N,          %servira pour représenter n'importe quel nombre sur l'espace de 4 N, ce qui devrai suffire à garder les "colonnes" alignées pour les rangs possiblement atteinds.
	N1 is N+1,
	représente_carré_magique(Représentation, N1, Valeur_limit).
représente_carré_magique([], _, _).