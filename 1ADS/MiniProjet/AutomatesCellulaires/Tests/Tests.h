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
double tests_nb_voisins_M(void);
double tests_generation_suivante_M(void);

// Neumann
double tests_nb_voisins_N(void);
double tests_generation_suivante_N(void);

// Fantômes
double tests_generation_suivante_Fantome(void);

#endif
