//
//  Tests.h
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 03/03/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef AutomatesCellulaires_Tests_h
#define AutomatesCellulaires_Tests_h

void tests_execute(void);

// Moore
void tests_nb_voisins_M(void);
void tests_generation_suivante_M(void);

// Neumann
void tests_nb_voisins_N(void);
void tests_generation_suivante_N(void);

// Fantômes
void tests_generation_suivante_Fantome(void);

#endif
