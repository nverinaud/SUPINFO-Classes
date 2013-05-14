//
//  Dumper.h
//  Labs4
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef Labs4_Dumper_h
#define Labs4_Dumper_h

void dump_class(const char *className);
void dump_ivars(const char *className);
void dump_properties(const char *className);
void dump_methods(const char *className);
char *decode_type_string(const char *type);
char *decode_attribute_type_string(const char *attrType);

#endif
