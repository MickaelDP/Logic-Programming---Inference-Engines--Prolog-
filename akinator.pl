% ==============================================================================
% FILE          : akinator.pl
% ROLE          : Expert System / Inference Engine (Whos Who game)
% CONTEXT       : Logic Programming - Paris 8 University (Legacy 2020)
% REFACTORED    : 2026 (Documentation & English Comments)
% ==============================================================================

% ------------------------------------------------------------------------------
% MAIN LAUNCHER & STATE RESET
% ------------------------------------------------------------------------------

%lakinator/0: Main entry point. Displays the splash screen and starts the game.
akinator :-
    write('\n'),
    write('      __       __   ___   __    _____  ___        __  ___________  ______     _______\n'),
    write('     /""\\     |/"| /  ") |" \\  (\\"   \\|"  \\      /""\\("     _   ")/    " \\   /"      \\\n '),
    write('   /    \\    (: |/   /  ||  | |.\\\\   \\    |    /    \\)__/  \\\\__/// ____  \\ |:        |\n'),
    write('   /  /\\  \\   |    __/   |:  | |: \\.   \\\\  |   /  /\\  \\  \\\\_ /  /  /    ) :)|_____/   )\n '),
    write(' //  __   \\  (// _  \\   |.  | |.  \\    \\. |  //  __   \\ |.  | (: (____/ //  //      /\n '),
    write('/   /  \\\\  \\ |: | \\  \\  /\\  |\\|    \\    \\ | /   /  \\\\  \\\\:  |  \\        /  |:  __   \\\n'),
    write('(___/    \\___)(__|  \\__)(__\\_|_)\\___|\\____\\)(___/    \\___)\\__|   \\"_____/   |__|  \\___)\n '),
    write('\n\n '),
    write('                   ____\n'),
    write('                  .|* *.|\n'),
    write('               __/_*_*(_\n'),
    write('              / _______ \\\n'),
    write('             _\\_)/___\\(_/_                 "Bienvenu, je suis le mage Akinator"\n'),
    write('            / _((\\- -/))_ \\         "piocher une carte et je devinerais quel personnage"\n'),
    write('            \\ \\())(-)(()/ /                          "vous avez !"\n '),
    write('            | \\(((()))/ |\n'),
    write('            /   \\)).))/   \\\n'),
    write('           / _ \\ - | - /_  \\\n'),
    write('          (   ( .;:..:;. .  )\n'),
    write('          _\\"__ /    )\\ __"/_\n'),
    write('            \\/  \\   " /  \\/\n'),
    write('             ."  "..." " )\n'),
    write('              / /  |  \\ \\\n'),
    write('             / .   .   . \\\n'),
    write('            /   .     .   \\\n'),
    write('           /   /   |   \\   \\\n'),
    write('         .|   /    b    |.   .\n'),
    write('     _.-     /     Bb      -.  -._\n'),
    write(' _.-        |      BBb        -.   -.\n'),
    write('(________mrf\\____.dBBBb.________)____)\n'),
    write('\n\n'),
    carte.

% carte/0: Handles the card draw and initializes the character selection.                                                                       
carte :-
    write('\n\n'),
    write('           .------..------..------..------..------..------..------..------.\n'),
    write('           |A.--. ||K.--. ||I.--. ||N.--. ||A.--. ||T.--. ||O.--. ||R.--. |\n'),
    write('           | (\\/) || :/\\: || (\\/) || :(): || (\\/) || :/\\: || :/\\: || :(): |\n'),
    write('           | :\\/: || :\\/: || :\\/: || ()() || :\\/: || (__) || :\\/: || ()() |\n'),
    write('           |  -- A||  -- K||  -- I||  -- N||  -- A||  -- T||  -- O||  -- R|\n'),
    write('           `------ `------ `------ `------ `------ `------ `------ `------ \n\n'),
    write('                             Piocher une carte? (oui/non)\n'),    
    read(Carte),
    Carte == oui,
    % Picks a random character for the user to draw
    random_member(Personnage_mystere, [claire, anita, maria, susan, anne, paul, eric, david, charles, max, bernard, philip, tom, george, herman, joe, alfred, peter, bill, frans, alex, sam, richard, rober]),
    Personnage_mystere, 
    question_sexe;
    write('À bientôt!'),!.

% nouvelle_partie/0: Clears the dynamic knowledge base and asks for a replay.
nouvelle_partie :-
    retractall(caractéristique(_,_)),
    write('Souhaitez-vous jouez à nouveau? (oui/non)\n'),
    read(Joue),
    Joue == oui, carte;
    write('À bientôt!'),!.

% ------------------------------------------------------------------------------
% CHARACTER DATABASE (CARDS)
% ------------------------------------------------------------------------------

% These predicates represent the visual information on the card chosen by the user.
claire  :- write('\n\nNom: Claire  \nsexe: femme   \nCheveux: bouclés   \nCouleur de cheveux: roux      \nYeux: Marrons  \nAccessoires: lunette, chapeau             \nPilosité: _                \nBouche: petite\n\n\n').
anita   :- write('\n\nNom: Anita   \nsexe: femme   \nCheveux: raides    \nCouleur de cheveux: blonds    \nYeux: Marrons  \nAccessoires: _                            \nPilosité: _                \nBouche: petite\n\n\n').
maria   :- write('\n\nNom: Maria   \nsexe: femme   \nCheveux: raides    \nCouleur de cheveux: châtains  \nYeux: Bleues   \nAccessoires: chapeau, boucle d oreilles   \nPilosité: _                \nBouche: normale\n\n\n').
susan   :- write('\n\nNom: Susan   \nsexe: femme   \nCheveux: raides    \nCouleur de cheveux: blancs    \nYeux: Bleues   \nAccessoires: chapeau, boucle d oreilles   \nPilosité: _                \nBouche: grande\n\n\n').
anne    :- write('\n\nNom: Anne    \nsexe: femme   \nCheveux: bouclés   \nCouleur de cheveux: bruns     \nYeux: Bleues   \nAccessoires: boucle d oreilles            \nPilosité: _                \nBouche: petite\n\n\n').
paul    :- write('\n\nNom: Paul    \nsexe: homme   \nCheveux: bouclés   \nCouleur de cheveux: blancs    \nYeux: Bleues   \nAccessoires: lunette                      \nPilosité: _                \nBouche: normale\n\n\n').
eric    :- write('\n\nNom: Eric    \nsexe: homme   \nCheveux: raides    \nCouleur de cheveux: blonds    \nYeux: Bleues   \nAccessoires: chapeau                      \nPilosité: _                \nBouche: grande\n\n\n').
david   :- write('\n\nNom: David   \nsexe: homme   \nCheveux: raides    \nCouleur de cheveux: blonds    \nYeux: Bleues   \nAccessoires: _                            \nPilosité: barbe            \nBouche: grande\n\n\n').
charles :- write('\n\nNom: Charles \nsexe: homme   \nCheveux: raides    \nCouleur de cheveux: blonds    \nYeux: Bleues   \nAccessoires: _                            \nPilosité: moustache        \nBouche: grande\n\n\n').
max     :- write('\n\nNom: Max     \nsexe: homme   \nCheveux: bouclés   \nCouleur de cheveux: bruns     \nYeux: Bleues   \nAccessoires: chapeau                      \nPilosité: moustache        \nBouche: grande\n\n\n').
bernard :- write('\n\nNom: Bernard \nsexe: homme   \nCheveux: raides    \nCouleur de cheveux: châtains  \nYeux: Bleues   \nAccessoires: chapeau                      \nPilosité: _                \nBouche: petite\n\n\n').
philip  :- write('\n\nNom: Philip  \nsexe: homme   \nCheveux: bouclés   \nCouleur de cheveux: bruns     \nYeux: Bleues   \nAccessoires: _                            \nPilosité: barbe            \nBouche: normale\n\n\n').
tom     :- write('\n\nNom: Tom     \nsexe: homme   \nCheveux: chauve    \nCouleur de cheveux: bruns     \nYeux: Marrons  \nAccessoires: lunette                      \nPilosité: _                \nBouche: petite\n\n\n').
george  :- write('\n\nNom: George  \nsexe: homme   \nCheveux: raides    \nCouleur de cheveux: blancs    \nYeux: Bleues   \nAccessoires: chapeau                      \nPilosité: _                \nBouche: normale\n\n\n').
herman  :- write('\n\nNom: Herman  \nsexe: homme   \nCheveux: chauve    \nCouleur de cheveux: roux      \nYeux: Bleues   \nAccessoires: _                            \nPilosité: _                \nBouche: normale\n\n\n').
joe     :- write('\n\nNom: Joe     \nsexe: homme   \nCheveux: bouclés   \nCouleur de cheveux: blonds    \nYeux: Bleues   \nAccessoires: _                            \nPilosité: moustache        \nBouche: petite\n\n\n').
alfred  :- write('\n\nNom: Alfred  \nsexe: homme   \nCheveux: raides    \nCouleur de cheveux: roux      \nYeux: Marrons  \nAccessoires: _                            \nPilosité: moustache        \nBouche: petite\n\n\n').
peter   :- write('\n\nNom: Peter   \nsexe: homme   \nCheveux: raides    \nCouleur de cheveux: blancs    \nYeux: Marrons  \nAccessoires: _                            \nPilosité: _                \nBouche: grande\n\n\n').
bill    :- write('\n\nNom: Bill    \nsexe: homme   \nCheveux: chauve    \nCouleur de cheveux: roux      \nYeux: Bleues   \nAccessoires: _                            \nPilosité: moustache        \nBouche: petite\n\n\n').
frans   :- write('\n\nNom: Frans   \nsexe: homme   \nCheveux: bouclés   \nCouleur de cheveux: roux      \nYeux: Bleues   \nAccessoires: _                            \nPilosité: _                \nBouche: petite\n\n\n').
alex    :- write('\n\nNom: Alex    \nsexe: homme   \nCheveux: raides    \nCouleur de cheveux: bruns     \nYeux: Bleues   \nAccessoires: _                            \nPilosité: moustache        \nBouche: grande\n\n\n').
sam     :- write('\n\nNom: Sam     \nsexe: homme   \nCheveux: chauve    \nCouleur de cheveux: blancs    \nYeux: Bleues   \nAccessoires: lunette                      \nPilosité: _                \nBouche: petite\n\n\n').
richard :- write('\n\nNom: Richard \nsexe: homme   \nCheveux: chauve    \nCouleur de cheveux: châtains  \nYeux: Bleues   \nAccessoires: lunette                      \nPilosité: barbe, moustache \nBouche: petite\n\n\n').
rober   :- write('\n\nNom: Rober   \nsexe: homme   \nCheveux: raides    \nCouleur de cheveux: châtains  \nYeux: Marrons  \nAccessoires: _                            \nPilosité: _                \nBouche: petite\n\n\n').

% ------------------------------------------------------------------------------
% KNOWLEDGE BASE (LOGICAL ATTRIBUTES)
% ------------------------------------------------------------------------------

% choix(Name, Female, Male, Straight, Curly, Bald, Brown, Blond, Dark, Red, White, BlueEyes, BrownEyes, Glasses, Hat, Earring, Beard, Mustache, SmallMouth, NormalMouth, BigMouth)
choix("claire" , oui, non, non, oui, non, non, non, non, oui, non, oui, non, oui, oui, non, non, non, oui, non, non).
choix("anita"  , oui, non, oui, non, non, non, oui, non, non, non, oui, non, non, non, non, non, non, oui, non, non).
choix("maria"  , oui, non, oui, non, non, oui, non, non, non, non, non, oui, non, oui, oui, non, non, non, oui, non).
choix("susan"  , oui, non, oui, non, non, non, non, non, non, oui, non, oui, non, non, non, non, non, non, non, oui).
choix("anne"   , oui, non, non, oui, non, non, non, oui, non, non, non, oui, non, non, oui, non, non, oui, non, non).
choix("paul"   , non, oui, non, oui, non, non, non, non, non, oui, non, oui, oui, non, non, non, non, non, oui, non).
choix("eric"   , non, oui, oui, non, non, non, oui, non, non, non, non, oui, non, oui, non, non, non, non, non, oui).
choix("david"  , non, oui, oui, non, non, non, oui, non, non, non, non, oui, non, non, non, oui, non, non, non, oui).
choix("charles", non, oui, oui, non, non, non, oui, non, non, non, non, oui, non, non, non, non, oui, non, non, oui).
choix("max"    , non, oui, non, oui, non, non, non, oui, non, non, non, oui, non, oui, non, non, oui, non, non, oui).
choix("bernard", non, oui, oui, non, non, oui, non, non, non, non, non, oui, non, oui, non, non, non, oui, non, non).
choix("philip" , non, oui, non, oui, non, non, non, oui, non, non, non, oui, non, non, non, oui, non, non, oui, non).
choix("tom"    , non, oui, non, non, oui, non, non, oui, non, non, oui, non, oui, non, non, non, non, oui, non, non).
choix("george" , non, oui, oui, non, non, non, non, non, non, oui, non, oui, non, oui, non, non, non, non, oui, non).
choix("herman" , non, oui, non, non, oui, non, non, non, oui, non, non, oui, non, non, non, non, non, non, oui, non).
choix("joe"    , non, oui, non, oui, non, non, oui, non, non, non, non, oui, non, non, non, non, oui, oui, non, non).
choix("alfred" , non, oui, oui, non, non, non, non, non, oui, non, oui, non, non, non, non, non, oui, oui, non, non).
choix("peter"  , non, oui, oui, non, non, non, non, non, non, oui, oui, non, non, non, non, non, non, non, non, oui).
choix("bill"   , non, oui, non, non, oui, non, non, non, oui, non, non, oui, non, non, non, non, oui, oui, non, non).
choix("frans"  , non, oui, non, oui, non, non, non, non, oui, non, non, oui, non, non, non, non, non, oui, non, non).
choix("alex"   , non, oui, oui, non, non, non, non, oui, non, non, non, oui, non, non, non, non, oui, non, non, oui).
choix("sam"    , non, oui, non, non, oui, non, non, non, non, oui, non, oui, oui, non, non, non, non, oui, non, non).
choix("richard", non, oui, non, non, oui, oui, non, non, non, non, non, oui, non, non, non, oui, oui, oui, non, non).
choix("rober"  , non, oui, oui, non, non, oui, non, non, non, non, oui, non, non, non, non, non, non, oui, non, non).

% ------------------------------------------------------------------------------
% INFERENCE ENGINE (CORE LOGIC)
% ------------------------------------------------------------------------------

% question_sexe/0: Determine if the character is male or female.
question_sexe:-
    write('Ce personnage est-il une femme ? (oui/non) \n'),
    %prend la réponse du clavier avec read/1
    read(Sexe),
    %asseta/1 unifie les références
    asserta(caractéristique(femme, Sexe)),
    caractéristique(femme, Sexe_f),
    homme,
    caractéristique(homme, Sexe_h),
    % Filter the list of potential characters
    findall(X, choix(X, Sexe_f, Sexe_h, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _),
    write('j ai trouvé c est :'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    question_coupe_raides.

% homme/0: Logical deduction of man based on the answer to woman.
homme:-
    caractéristique(femme, oui), asserta(caractéristique(homme, non));
    caractéristique(femme, non), asserta(caractéristique(homme, oui)).

% question_coupe_raides/0: Determine if hair is straight.
question_coupe_raides:-
    write('Les cheveux du personnage sont ils raides ? (oui/non) \n'),
    read(Raides),
    asserta(caractéristique(cheveux_raides, Raides)),
    caractéristique(cheveux_raides, Raides), 
    cheveuxRd,
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _),
    write('Je penqe que c est :'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    redirection_raides.

% cheveuxRd/0: Deduces that if hair is straight, it is neither curly nor bald.
cheveuxRd:-
    caractéristique(cheveux_raides, oui), asserta(caractéristique(cheveux_bouclés, non)), asserta(caractéristique(chauve, non));
    caractéristique(cheveux_raides, non).

% redirection_raides/0: Logic branch based on straight hair result.
redirection_raides :-
    caractéristique(cheveux_raides, oui), question_couleur_cheveux_châtains;
    caractéristique(cheveux_raides, non), question_coupe_boucles.
    
% question_coupe_boucles/0: Determine if hair is curly.
question_coupe_boucles :-
    write('Les cheveux du personnage sont ils bouclés? (oui/non) \n'),
    read(Boucles),
    asserta(caractéristique(cheveux_bouclés, Boucles)),
    caractéristique(cheveux_bouclés, Boucles),
    cheveuxBc,
    caractéristique(cheveux_raides, Raides),
    caractéristique(chauve, Chauve),
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, Boucles, Chauve, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1, 
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, Boucles, Chauve, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _),
    write('Il est possible que celà soit :'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    question_couleur_cheveux_châtains.

% cheveuxBc/0: Deduces bald status if hair is not curly (and previously not straight).
cheveuxBc:-
    caractéristique(cheveux_bouclés, non), asserta(caractéristique(chauve, oui));
    caractéristique(cheveux_bouclés, oui), asserta(caractéristique(chauve, non)).

% question_couleur_cheveux_châtains/0: Determine if hair color is brown/chestnut.
%déterminer la couleur des cheveux.
question_couleur_cheveux_châtains:-
    write('Les cheveux du personnage sont ils châtains? (oui/non) \n'),
    read(Chatains),
    asserta(caractéristique(cheveux_châtains, Chatains)),
    caractéristique(cheveux_châtains, Chatains),
    couleurCt,
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    caractéristique(cheveux_raides, Raides),
    caractéristique(cheveux_bouclés, Boucles),
    caractéristique(chauve, Chauve),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, _, _, _, _, _, _, _, _, _, _, _, _, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, _, _, _, _, _, _, _, _, _, _, _, _, _, _),
    write('Je vois c est :'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    redirection_châtains.

% couleurCt/0: Mutually exclusive hair color logic (Chestnut).
couleurCt:-
    caractéristique(cheveux_châtains, non);
    caractéristique(cheveux_châtains, oui), asserta(caractéristique(cheveux_blond, non)), asserta(caractéristique(cheveux_brun, non)), asserta(caractéristique(cheveux_roux, non)), asserta(caractéristique(cheveux_blanc, non)).

redirection_châtains:-
    caractéristique(cheveux_châtains, non), question_couleur_cheveux_blond;
    caractéristique(cheveux_châtains, oui), question_yeux_marrons.

% question_couleur_cheveux_blond/0: Determine if hair color is blond.
question_couleur_cheveux_blond:-
    write('Les cheveux du personnage sont ils blonds? (oui/non) \n'),
    read(Blond),
    asserta(caractéristique(cheveux_blond, Blond)),
    caractéristique(cheveux_blond, Blond),
    couleurBl,
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    caractéristique(cheveux_raides, Raides),
    caractéristique(cheveux_bouclés, Boucles),
    caractéristique(chauve, Chauve),
    caractéristique(cheveux_châtains, Chatains),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, _, _, _, _, _, _, _, _, _, _, _, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, _, _, _, _, _, _, _, _, _, _, _, _, _),
    write('C est :'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    redirection_blond.

% couleurBl/0: Mutually exclusive hair color logic (Blond)
couleurBl :-
    caractéristique(cheveux_blond, non);
    caractéristique(cheveux_blond, oui), asserta(caractéristique(cheveux_brun, non)), asserta(caractéristique(cheveux_roux, non)), asserta(caractéristique(cheveux_blanc, non)).

redirection_blond:-
    caractéristique(cheveux_blond, non), question_couleur_cheveux_brun;
    caractéristique(cheveux_blond, oui), question_yeux_marrons.


% question_couleur_cheveux_brun/0: Determine if hair color is dark/brunette.
question_couleur_cheveux_brun :-
    write('Les cheveux du personnage sont ils bruns? (oui/non) \n'),
    read(Bruns),
    asserta(caractéristique(cheveux_brun, Bruns)),
    caractéristique(cheveux_brun, Bruns),
    couleurBr,
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    caractéristique(cheveux_raides, Raides),
    caractéristique(cheveux_bouclés, Boucles),
    caractéristique(chauve, Chauve),
    caractéristique(cheveux_châtains, Chatains),
    caractéristique(cheveux_blond, Blond),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, _, _, _, _, _, _, _, _, _, _, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, _, _, _, _, _, _, _, _, _, _, _, _),   
    write('j ai trouvé c est :'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    redirection_brun.

% couleurBr/0: Mutually exclusive hair color logic (Dark).  
couleurBr :-
    caractéristique(cheveux_brun, non);
    caractéristique(cheveux_brun, oui), asserta(caractéristique(cheveux_roux, non)), asserta(caractéristique(cheveux_blanc, non)).

redirection_brun :-
    caractéristique(cheveux_brun, non), question_couleur_cheveux_roux;
    caractéristique(cheveux_brun, oui), question_yeux_marrons.


% question_couleur_cheveux_roux/0: Determine if hair color is red.
question_couleur_cheveux_roux :-
    write('Les cheveux du personnage sont ils roux? (oui/non) \n'),
    read(Roux),
    asserta(caractéristique(cheveux_roux, Roux)),
    caractéristique(cheveux_roux, Roux),
    couleurRx,
    caractéristique(cheveux_blanc, Blanc),
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    caractéristique(cheveux_raides, Raides),
    caractéristique(cheveux_bouclés, Boucles),
    caractéristique(chauve, Chauve),
    caractéristique(cheveux_châtains, Chatains),
    caractéristique(cheveux_blond, Blond),
    caractéristique(cheveux_brun, Bruns),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, _, _, _, _, _, _, _, _, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, _, _, _, _, _, _, _, _, _, _),  
    write('mmm :'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    question_yeux_marrons.

% couleurRx/0: Deduces white hair if not red (after checking all other colors).
couleurRx :-
    caractéristique(cheveux_roux, non), asserta(caractéristique(cheveux_blanc, oui));
    caractéristique(cheveux_roux, oui), asserta(caractéristique(cheveux_blanc, non)).

% question_yeux_marrons/0: Determine eye color (Brown vs Blue).
question_yeux_marrons :-
    write('Les yeux du personnage sont ils marrons? (oui/non) \n'),
    read(Marrons),
    asserta(caractéristique(yeux_marrons, Marrons)),
    caractéristique(yeux_marrons, Marrons),
    couleurMr,
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    caractéristique(cheveux_raides, Raides),
    caractéristique(cheveux_bouclés, Boucles),
    caractéristique(chauve, Chauve),
    caractéristique(cheveux_châtains, Chatains),
    caractéristique(cheveux_blond, Blond),
    caractéristique(cheveux_brun, Bruns),
    caractéristique(cheveux_roux, Roux),
    caractéristique(cheveux_blanc, Blanc),
    caractéristique(yeux_bleues, Bleues),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, _, _, _, _, _, _, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, _, _, _, _, _, _, _, _),  
    write('peu être:'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    question_lunette.

% couleurMr/0: Eye color exclusion logic.
couleurMr :-
    caractéristique(yeux_marrons, non), asserta(caractéristique(yeux_bleues, oui));
    caractéristique(yeux_marrons, oui), asserta(caractéristique(yeux_bleues, non)).

% ------------------------------------------------------------------------------
% ACCESSORIES & FACIAL HAIR (INDEPENDENT ATTRIBUTES)
% ------------------------------------------------------------------------------

% question_lunette/0: Check for glasses.
question_lunette :-
    write('Le personnage porte t il des lunettes? (oui/non) \n'),
    read(Lunette),
    asserta(caractéristique(lunette, Lunette)),
    caractéristique(lunette, Lunette),
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    caractéristique(cheveux_raides, Raides),
    caractéristique(cheveux_bouclés, Boucles),
    caractéristique(chauve, Chauve),
    caractéristique(cheveux_châtains, Chatains),
    caractéristique(cheveux_blond, Blond),
    caractéristique(cheveux_brun, Bruns),
    caractéristique(cheveux_roux, Roux),
    caractéristique(cheveux_blanc, Blanc),
    caractéristique(yeux_marrons, Marrons),
    caractéristique(yeux_bleues, Bleues),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, _, _, _, _, _, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, _, _, _, _, _, _, _),
    write('c est:'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    question_chapeau.


% question_chapeau/0: Check for a hat.
question_chapeau :- 
    write('Le personnage porte t il un chapeau? (oui/non) \n'),
    read(Chapeau),
    asserta(caractéristique(chapeau, Chapeau)),
    caractéristique(chapeau, Chapeau),
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    caractéristique(cheveux_raides, Raides),
    caractéristique(cheveux_bouclés, Boucles),
    caractéristique(chauve, Chauve),
    caractéristique(cheveux_châtains, Chatains),
    caractéristique(cheveux_blond, Blond),
    caractéristique(cheveux_brun, Bruns),
    caractéristique(cheveux_roux, Roux),
    caractéristique(cheveux_blanc, Blanc),
    caractéristique(yeux_marrons, Marrons),
    caractéristique(yeux_bleues, Bleues),
    caractéristique(lunette, Lunette),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, Chapeau, _, _, _, _, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, Chapeau, _, _, _, _, _, _),  
    write('Je sais c est :'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    redirection_Cp.

% redirection_Cp/0: Route logic based on gender (men have beards, women have earrings).
redirection_Cp:-
    caractéristique(homme, oui), asserta(caractéristique(boucle_d_oreille, non)), question_barbe;
    caractéristique(homme, non), question_boucle_d_oreille.


% question_boucle_d_oreille/0: Check for earrings (Female path).
question_boucle_d_oreille :-
    write('Le personnage porte t il des boucles d oreilles? (oui/non) \n'),
    read(Boucles),
    asserta(caractéristique(boucle_d_oreille, Boucles)),
    caractéristique(boucle_d_oreille, Boucles),
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    caractéristique(cheveux_raides, Raides),
    caractéristique(cheveux_bouclés, Boucles),
    caractéristique(chauve, Chauve),
    caractéristique(cheveux_châtains, Chatains),
    caractéristique(cheveux_blond, Blond),
    caractéristique(cheveux_brun, Bruns),
    caractéristique(cheveux_roux, Roux),
    caractéristique(cheveux_blanc, Blanc),
    caractéristique(yeux_marrons, Marrons),
    caractéristique(yeux_bleues, Bleues),
    caractéristique(lunette, Lunette),
    caractéristique(chapeau, Chapeau),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, Chapeau, Boucles, _, _, _, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, Chapeau, Boucles, _, _, _, _, _),  
    write('Je vois, je vois c est :'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    asserta(caractéristique(barbe, non)),
    asserta(caractéristique(moustache, non)),
    question_petite_bouche.


% question_barbe/0: Check for a beard (Male path).
question_barbe :-
    write('Le personnage porte t il une barbe? (oui/non) \n'),
    read(Barbe),
    asserta(caractéristique(barbe, Barbe)),
    caractéristique(barbe, Barbe),
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    caractéristique(cheveux_raides, Raides),
    caractéristique(cheveux_bouclés, Boucles),
    caractéristique(chauve, Chauve),
    caractéristique(cheveux_châtains, Chatains),
    caractéristique(cheveux_blond, Blond),
    caractéristique(cheveux_brun, Bruns),
    caractéristique(cheveux_roux, Roux),
    caractéristique(cheveux_blanc, Blanc),
    caractéristique(yeux_marrons, Marrons),
    caractéristique(yeux_bleues, Bleues),
    caractéristique(lunette, Lunette),
    caractéristique(chapeau, Chapeau),
    caractéristique(boucle_d_oreille, Boucles),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, Chapeau, Boucles, Barbe, _, _, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, Chapeau, Boucles, Barbe, _, _, _, _),  
    write('Finalement ce doit être :'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    question_moustache.


% question_moustache/0: Check for a mustache (Male path).
question_moustache :-
    write('Le personnage porte t il une moustache? (oui/non) \n'),
    read(Moustache),
    asserta(caractéristique(moustache, Moustache)),
    caractéristique(moustache, Moustache),
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    caractéristique(cheveux_raides, Raides),
    caractéristique(cheveux_bouclés, Boucles),
    caractéristique(chauve, Chauve),
    caractéristique(cheveux_châtains, Chatains),
    caractéristique(cheveux_blond, Blond),
    caractéristique(cheveux_brun, Bruns),
    caractéristique(cheveux_roux, Roux),
    caractéristique(cheveux_blanc, Blanc),
    caractéristique(yeux_marrons, Marrons),
    caractéristique(yeux_bleues, Bleues),
    caractéristique(lunette, Lunette),
    caractéristique(chapeau, Chapeau),
    caractéristique(barbe, Barbe),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, Chapeau, Boucles, Barbe, Moustache, _, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, Chapeau, Boucles, Barbe, Moustache, _, _, _),  
    write('Et si c était :'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    question_petite_bouche.

% ------------------------------------------------------------------------------
% MOUTH SIZE (FINAL DISCRIMINANTS)
% ------------------------------------------------------------------------------

% question_petite_bouche/0: Check for small mouth.
question_petite_bouche :-
    write('Le personnage a t il une petite bouche? (oui/non) \n'),
    read(Petite_bouche),
    asserta(caractéristique(petite_bouche, Petite_bouche)),
    caractéristique(petite_bouche, Petite_bouche),
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    caractéristique(cheveux_raides, Raides),
    caractéristique(cheveux_bouclés, Boucles),
    caractéristique(chauve, Chauve),
    caractéristique(cheveux_châtains, Chatains),
    caractéristique(cheveux_blond, Blond),
    caractéristique(cheveux_brun, Bruns),
    caractéristique(cheveux_roux, Roux),
    caractéristique(cheveux_blanc, Blanc),
    caractéristique(yeux_marrons, Marrons),
    caractéristique(yeux_bleues, Bleues),
    caractéristique(lunette, Lunette),
    caractéristique(chapeau, Chapeau),
    caractéristique(barbe, Barbe),
    caractéristique(moustache, Moustache),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, Chapeau, Boucles, Barbe, Moustache, Petite_bouche, _, _), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, Chapeau, Boucles, Barbe, Moustache, Petite_bouche, _, _),  
    write('Cette fois c est :'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    question_bouche.

% question_bouche/0: Check for normal mouth size.
question_bouche :-
    write('Le personnage a t il une bouche de taille normale? (oui/non) \n'),
    read(Bouche),
    asserta(caractéristique(bouche, Bouche)),
    bouchert,
    caractéristique(femme, Sexe_f),
    caractéristique(homme, Sexe_h),
    caractéristique(cheveux_raides, Raides),
    caractéristique(cheveux_bouclés, Boucles),
    caractéristique(chauve, Chauve),
    caractéristique(cheveux_châtains, Chatains),
    caractéristique(cheveux_blond, Blond),
    caractéristique(cheveux_brun, Bruns),
    caractéristique(cheveux_roux, Roux),
    caractéristique(cheveux_blanc, Blanc),
    caractéristique(yeux_marrons, Marrons),
    caractéristique(yeux_bleues, Bleues),
    caractéristique(lunette, Lunette),
    caractéristique(chapeau, Chapeau),
    caractéristique(barbe, Barbe),
    caractéristique(moustache, Moustache),
    caractéristique(petite_bouche, Petite_bouche),
    caractéristique(bouche, Bouche),
    caractéristique(grande_bouche, Grande_bouche),
    findall(X, choix(X, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, Chapeau, Boucles, Barbe, Moustache, Petite_bouche, Bouche, Grande_bouche), Liste_des_choix_restant),
    length(Liste_des_choix_restant, Chx), Chx == 1,
    choix(Personnage_mystere, Sexe_f, Sexe_h, Raides, Boucles, Chauve, Chatains, Blond, Bruns, Roux, Blanc, Marrons, Bleues, Lunette, Chapeau, Boucles, Barbe, Moustache, Petite_bouche, Bouche, Grande_bouche),  
    write('Ce ne serait pas :'), write(Personnage_mystere), write('!\n\n'), nouvelle_partie;
    write('Je suis vaincu malheur à moi !\n\n'), nouvelle_partie.

% bouchert/0: Final deduction for big mouth if not normal size.
bouchert :-
    caractéristique(bouche, non), asserta(caractéristique(grande_bouche, oui));
    caractéristique(bouche, oui), asserta(caractéristique(grande_bouche, non)).
