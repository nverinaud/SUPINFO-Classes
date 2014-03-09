//
//  Dumper.c
//  Labs4
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <objc/objc.h>
#include <objc/runtime.h>
#include "Dumper.h"


void dump_class(const char *className)
{
	Class klass = (Class)objc_getClass(className);
	if (!klass)
	{
		printf("ERROR: no class with name %s\n\n", className);
		return;
	}
	
	printf("@interface %s", className);
	Class superKlass = class_getSuperclass(klass);
	if (superKlass)
	{
		printf(" : %s", class_getName(superKlass));
	}
	
	printf("\n{\n");
	dump_ivars(className);
	printf("}\n\n");
	dump_properties(className);
	printf("\n");
	dump_methods(className);
	printf("\n@end\n\n");
}

void dump_ivars(const char *className)
{
	Class klass = (Class)objc_getClass(className);
	if (!klass)
	{
		printf("ERROR: no class with name %s\n\n", className);
		return;
	}
	
	Ivar *ivars = NULL;
	unsigned int ivarsCount = 0;
	Ivar ivar;
	
	ivars = class_copyIvarList(klass, &ivarsCount);
	
	for (int i = 0; i < ivarsCount; i++)
	{
		ivar = ivars[i];
		printf("\t%s %s\n", decode_type_string(ivar_getTypeEncoding(ivar)), ivar_getName(ivar));
	}
	
	free(ivars);
}


void dump_properties(const char *className)
{
	Class klass = (Class)objc_getClass(className);
	if (!klass)
	{
		printf("ERROR: no class with name %s\n\n", className);
		return;
	}
	
	objc_property_t *properties = NULL;
	unsigned int propertiesCount = 0;
	objc_property_t prop;
	
	objc_property_attribute_t *attributes = NULL;
	unsigned int attributesCount = 0;
	objc_property_attribute_t attr;
	char *propType = NULL;
	
	properties = class_copyPropertyList(klass, &propertiesCount);
	
	for (int i = 0; i < propertiesCount; i++)
	{
		prop = properties[i];
		attributes = property_copyAttributeList(prop, &attributesCount);
		propType = decode_type_string(attributes[0].value);
		
		printf("@property(");
		
		for (int j = 1; j < attributesCount-1; j++)
		{
			attr = attributes[j];
			printf("%s", decode_attribute_type_string(attr.name));
			if (attr.value)
				printf("%s", attr.value);
			
			if (j < attributesCount-2)
				printf(", ");
		}
		
		printf(") %s %s\n", propType, property_getName(prop));
		free(attributes);
	}
	
	free(properties);
}


void dump_methods(const char *className)
{
	Class klass = (Class)objc_getClass(className);
	if (!klass)
	{
		printf("ERROR: no class with name %s\n\n", className);
		return;
	}
	
	Method *methods = NULL;
	unsigned int methodsCount = 0;
	Method method;
	char *returnType = NULL;
	
	methods = class_copyMethodList(klass, &methodsCount);
	for (int i = 0; i < methodsCount; i++)
	{
		method = methods[i];
		returnType = method_copyReturnType(method);
		
		printf("- (%s)%s\n", decode_type_string(returnType), sel_getName(method_getName(method)));
		
		free(returnType);
	}
	
	free(methods);
	
	methods = class_copyMethodList(object_getClass((id)klass), &methodsCount);
	if (methodsCount > 0)
		printf("\n");
	for (int i = 0; i < methodsCount; i++)
	{
		method = methods[i];
		returnType = method_copyReturnType(method);
		
		printf("+ (%s)%s\n", decode_type_string(returnType), sel_getName(method_getName(method)));
		
		free(returnType);
	}
	
	free(methods);
}


char *decode_type_string(const char *type)
{
	char *decodedType = NULL;
	
	if (strcmp(type, "v") == 0)
		decodedType = "void";
	else if (strcmp(type, "i") == 0)
		decodedType = "int";
	else if (strcmp(type, "I") == 0)
		decodedType = "unsigned int";
	else if (strcmp(type, "d") == 0)
		decodedType = "double";
	else if (strcmp(type, "f") == 0)
		decodedType = "float";
	else if (strcmp(type, "B") == 0)
		decodedType = "BOOL";
	else if (strcmp(type, "c") == 0)
		decodedType = "char";
	else if (strcmp(type, "C") == 0)
		decodedType = "unsigned char";
	else if (strcmp(type, "*") == 0)
		decodedType = "char *";
	else if (strcmp(type, "@") == 0)
		decodedType = "id";
	else if (strcmp(type, "#") == 0)
		decodedType = "Class";
	else
		decodedType = (char *)type;
	
	return decodedType;
}


char *decode_attribute_type_string(const char *attrType)
{
	char *decodedAttrType = NULL;
	
	if (strcmp(attrType, "R") == 0)
		decodedAttrType = "readonly";
	else if (strcmp(attrType, "N") == 0)
		decodedAttrType = "nonatomic";
	else if (strcmp(attrType, "C") == 0)
		decodedAttrType = "copy";
	else if (strcmp(attrType, "&") == 0)
		decodedAttrType = "retain";
	else if (strcmp(attrType, "W") == 0)
		decodedAttrType = "weak";
	else if (strcmp(attrType, "G") == 0)
		decodedAttrType = "getter = ";
	else if (strcmp(attrType, "S") == 0)
		decodedAttrType = "setter = ";
	else
		decodedAttrType = (char *)attrType;
	
	return decodedAttrType;
}
