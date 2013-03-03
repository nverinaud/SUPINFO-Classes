//
//  main.c
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 28/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include "Voisinage.h"
#include "Tests.h"

#define EXECUTE_TESTS 1

int main(int argc, const char * argv[])
{
	if (EXECUTE_TESTS == 1)
		tests_execute();
	else
		test_brian_silverman_predefini();
	
    return 0;
}