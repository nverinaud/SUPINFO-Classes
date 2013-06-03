//
//  Provider.m
//  Labs4.4
//
//  Created by Nicolas Verinaud on 21/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "Provider.h"

@implementation Provider

- (id)init
{
	self = [super init];
	if (self)
	{
		_quotesDb[0] = "De toute facon, internet, ca ne marchera jamais! - Pascal Negre";
		_quotesDb[1] = "L'ennemi est con car il croit que c'est nous l'ennemi alors que c'est lui. - Pierre Desproges";
		_quotesDb[2] = "La television apporte la culture a ceux qui ne l'on pas et l'enleve a ce qui en ont deja. - Umberto Eco";
		_quotesDb[3] = "Je suis aveugle, mais on trouve toujours plus malheureux que soi...J'aurais pu etre noir. - Ray Charles";
		_quotesDb[4] = "La theorie, c'est quand on sait tout et que rien ne fonctionne. La pratique, c'est quand tout fonctionne et que personne ne sait pourquoi. Ici, nous avons reuni theorie et pratique : Rien ne fonctionne... et personne ne sait pourquoi ! - Albert Einstein";
	}
	
	return self;
}


- (const char *)randomQuote
{
	int r = rand()%5;
	return _quotesDb[r];
}

@end
