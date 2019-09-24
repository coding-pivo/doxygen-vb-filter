#----------------------------------------------------------------------------
# vbfilter.awk - doxygen VB .NET filter script - v2.4.1
#
# Creation:     26.05.2010  Vsevolod Kukol
# Last Update:  09.10.2011  Vsevolod Kukol
#
# Copyright (c) 2010-2011 Vsevolod Kukol, sevo(at)sevo(dot)org
#
# Inspired by the Visual Basic convertion script written by
# Mathias Henze. Rewritten from scratch with VB.NET support by
# Vsevolod Kukol.
#
# requirements: doxygen, gawk
#
# usage:
#    1. create a wrapper shell script:
#        #!/bin/sh
#        gawk -f /path/to/vbfilter.awk "$1"
#        EOF
#    2. define wrapper script as INPUT_FILTER in your Doxyfile:
#        INPUT_FILTER = /path/to/vbfilter.sh
#    3. take a look on the configuration options in the Configuration
#       section of this file (inside BEGIN function)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#---------------------------------------------------------------------------- 


BEGIN {
#############################################################################
# Configuration
#############################################################################
	# unix line breaks
	# set to 1 if using doxygen on unix with
	# windows formatted sources
	UnixLineBreaks=1
	
	# leading shift inside classes/namespaces/etc.
	# default is "\t" (tab)
	ShiftRight="\t"
	#ShiftRight="    "
	
	# add namespace definition at the beginning using project directory name
	# should be enabled, if no explicit namespaces are used in the sources
	# but doxygen should recognize package names.
	# in C# unlike in VB .NET a namespace must always be defined
	leadingNamespace=1
	
	# per default the parser converts all keywords to their C# equivalents:
	# Function -> function
	# Sub -> void
	# ....
	# Set csharpStyledOutput=0 to keep the VB style in the resulting 
	# documentation.
	csharpStyledOutput=1
	
#############################################################################
# helper variables, don't change
#############################################################################
	fullLine=1
	classNestCounter=0
	className[1]=""
	insideVB6Class=0
	insideFunction=0
	insideInterface=0
	insideVB6ClassName=""
	insideVB6Header=0
	insideNamespace=0
	insideComment=0
	insideVB6Property=0
	isInherited=0
	lastLine=""
	appShift=""
	defaultFileHeaderPrinted=0
	defaultClassPrinted=0
	VB6ClassCommentLineCount=1
	VB6ClassComment[VB6ClassCommentLineCount++]="/**"
	insideVB6ClassComment=0
	split("file_class_struct_enum_union_fn_var_def_namespace_package_interface", doxygen_structural_commands, "_")
}

#############################################################################
# shifter functions
#############################################################################
function AddShift() {
	appShift=appShift ShiftRight
}

function ReduceShift() {
	appShift=substr(appShift,0,length(appShift)-length(ShiftRight))
}

#############################################################################
# trim functions
#############################################################################
function rtrim(s) {
	sub(/[ \t\r\n]+$/, "", s)
	return s
}

function ltrim(s) {
	sub(/^[ \t\r\n]+/, "", s)
	return s
}

function trim(s) {
	return rtrim(ltrim(s))
}

#############################################################################
# check if element is part of array
#############################################################################
function elementExists(element, array,   x, y) {
	for (x in array) y[array[x]]
	return element in y
}

#############################################################################
# join all elements of an array into one string
#############################################################################
function join(array, len, sep,	result, i) {
	result = array[1]
	for (i = 2; i <= len; i++) {
		result = result sep array[i]
	}
	return result
}

#############################################################################
# doxygen requires a file tag to be able to document global functions,
# variables, enums, typedefs and defines
# this is a default tag to ensure proper documentation of global stuff event
# there is no file header added by the user
#############################################################################
defaultFileHeaderPrinted==0 {
	print "/** \\file */"
	defaultFileHeaderPrinted=1
}

#############################################################################
# print leading namespace
# namespace name is extracted from file path. the last directory name in
# the path, usually the project folder, is used.
#
# can be disabled by leadingNamespace=0 in configuration section
#############################################################################
leadingNamespace==1 {
	file=gensub(/\\/, "/", "G", FILENAME)
	print "namespace "basename[split(file, basename , "/")-1]" {"
	AddShift()
	leadingNamespace=2
}

#############################################################################
# apply dos2unix
#############################################################################
UnixLineBreaks==1 {
	sub(/\r$/,"")
}

#############################################################################
# remove leading and trailing whitespaces and tabs
#############################################################################
{
	$0=trim($0)
}

#############################################################################
# merge multiline statements into one line
#############################################################################
fullLine==0 {
	fullLine=1
	$0= lastLine$0
	lastLine=""
}

/_$/ {
	fullLine=0
 	sub(/_$/,"")
 	lastLine=$0
 	next
}

#############################################################################
# remove Option and Region statements
#############################################################################
(/^#Region[[:blank:]]+/ ||
/.*Option[[:blank:]]+/) && insideComment!=1 {
	next
}

#############################################################################
# VB6 file headers including class definitions
#############################################################################

# if file begins with a class definition, switch to VB6 mode
/.*[[:blank:]]+CLASS/ ||
/.*[[:blank:]]+VB\.Form[[:blank:]]+/ ||
/.*[[:blank:]]+VB\.UserControl[[:blank:]]+/ {
	insideVB6Class=1
	next
}

# ignore first line in VB6 forms
/.*VERSION[[:blank:]]+[0-9]+/ {
	next
}

# get VB6 class name
/^Attribute[[:blank:]]+VB_Name.*/ {
	insideVB6ClassName=gensub(".*VB_Name[[:blank:]]+[=][[:blank:]]+\"(.*)\"","\\1","g",$0)
	insideVB6Header=1
}

# detect when class attributes begin, to recognize the end of VB6 header
/^Attribute[[:blank:]]+.*/ {
	insideVB6Header=1
	next
}

# detect the end of VB6 header
(!(/^Attribute[[:blank:]]+.*/)) && insideVB6Class==1 && insideVB6Header<=1 {
	if (insideVB6Header==0) {
		next
	} else {
		insideVB6Header=2
	}
}

#############################################################################
# print default class when processing VB6 classes
#############################################################################
defaultClassPrinted==0 {
	if (insideVB6Class==1) {
		isInherited=1
		print appShift "class " insideVB6ClassName
		# for VB6 classes the class comment needs to be preprocessed as 
		# it needs to be located outside the class definition for proper
		# doxygen processing
		VB6ClassComment[VB6ClassCommentLineCount++]=" * \\class " insideVB6ClassName
		VB6ClassComment[VB6ClassCommentLineCount++]=" */"
	}
	defaultClassPrinted=1
}

#############################################################################
# skip empty lines or finish comments when inside a comment block
#############################################################################
/^$/ {
	# finish normal comment block
	if (insideComment==1) {
		insideComment=0
		print appShift " */"
	}
	# finish VB6 class comment
	if (insideVB6ClassComment==1) {
		insideVB6ClassComment=0
		VB6ClassComment[VB6ClassCommentLineCount++]=" */"
	}
	next
}

#############################################################################
# finish class comment here when another structural tag is found
#############################################################################
/^[[:blank:]]*('|''')[[:blank:]]*[@\\][a-zA-Z]+/ &&
insideVB6ClassComment==1 {
	# get the tag name
	tagname=trim(substr($0, match($0, /[\\, @]/)))
	if (match(tagname, /[[:blank:]]+/)==0) {
		tagname=trim(substr(tagname, 2))
	} else {
		tagname=trim(substr(tagname, 2, RSTART-1))
	}
	# check if tag is a structural tag
	if (elementExists(tagname, doxygen_structural_commands)) {
		# finish class tag
		insideVB6ClassComment=0
		VB6ClassComment[VB6ClassCommentLineCount++]=" */"
	}
}

#############################################################################
# finish class comment here when no comment is in this line
#############################################################################
(!(/^[[:blank:]]*'/)) && insideVB6ClassComment==1 {
	insideVB6ClassComment=0
	VB6ClassComment[VB6ClassCommentLineCount++]=" */"
}

#############################################################################
# detect begin of VB6 class comment (\class, @class)
#############################################################################
/^[[:blank:]]*('|''')[[:blank:]]*[@\\]class[[:blank:]]*/ &&
insideVB6Class==1 {
	if (insideVB6ClassComment==1) {
		# finish class comment and start new one
		VB6ClassComment[VB6ClassCommentLineCount++]=" */"
	}
	VB6ClassComment[VB6ClassCommentLineCount++]="/**"
	VB6ClassComment[VB6ClassCommentLineCount++]=gensub("^[ \t]*[']+"," * ",1,$0)
	insideVB6ClassComment=1
	next
}

#############################################################################
# handle class comments of VB6 classes as they need to be located outside
# the class definition for proper doxygen output
#############################################################################
(insideVB6ClassComment==1) {
	# process class comments
	VB6ClassComment[VB6ClassCommentLineCount++]=gensub("^[ \t]*[']+"," * ",1,$0)
	next
}

#############################################################################
# convert Imports to C# style
#
# remark: doxygen seems not to recognize
#         c# using directives so converting Imports is maybe useless?
#############################################################################
/^Imports[[:blank:]]+/ || /[[:blank:]]+Imports[[:blank:]]+/ {
	sub("Imports","using")
	print appShift $0";"
	next
}

#############################################################################
# handle comments
#############################################################################

## beginning of comment
(/^[[:blank:]]*'''[[:blank:]]*/ || /^[[:blank:]]*'[[:blank:]]*[\\<@][^ ].+/) && insideComment!=1 {
	if (insideEnum==1) {	
		# if enum is being processed, add comment to enumComment
		# instead of printing it
		if (enumComment!="") {
			enumComment = enumComment "\n" appShift "/**"
		} else {
			enumComment = appShift "/**"
		}
	} else if (insideType==1) {
		# if type is being processed, add comment to typeComment
		# instead of printing it
		if (typeComment!="") {
			typeComment = typeComment "\n" appShift "/**"
		} else {
			typeComment = appShift "/**"
		}
	} else {
		# if inheritance is being processed, then add comment to lastLine
		# instead of printing it and process the end of
		# class/interface declaration
		if (isInherited==1) {
			endOfInheritance()
		}
		print appShift "/**"
	}
	insideComment=1
}

## strip leading '''
/^[[:blank:]]*'/ {
	if (insideComment==1) {
		commentString=gensub("^[ \t]*[']+"," * ",1,$0)
		# if enum is being processed, add comment to enumComment
		# instead of printing it
		if (insideEnum==1) {
			enumComment = enumComment "\n" appShift commentString
		# if type is being processed, add comment to typeComment
		# instead of printing it
		} else if (insideType==1) {
			typeComment = typeComment "\n" appShift commentString
		} else {
			print appShift commentString
		}
		next
	}
}

## end of comment
(!(/^[[:blank:]]*'/)) && insideComment==1 {
	# if enum is being processed, add comment to enumComment
	# instead of printing it
	if (insideEnum==1) {	
		enumComment = enumComment "\n" appShift " */"
	# if type is being processed, add comment to typeComment
	# instead of printing it
	} else if (insideType==1) {
		typeComment = typeComment "\n" appShift " */"
	} else {
		print appShift " */"
	}
	insideComment=0
}

#############################################################################
# inline comments in c# style /** ... */
#############################################################################
# strip all commented lines, if not part of a comment block
/^'+/ && insideComment!=1 {
	next
}

/.+'''</ && insideComment!=1 {
	sub("[[:blank:]]*'''<[[:blank:]]*"," /**< \\brief ")
	$0 = $0" */"
}

#############################################################################
# strip compiler options
#############################################################################
/.*<.*>.*/ {
	gsub("<.*>[ ]+","")
}

#############################################################################
# Set insideInterface variable before setting insideFunction variable
#############################################################################
/^Interface[[:blank:]]+/ || /[[:blank:]]+Interface[[:blank:]]+/ {
	insideInterface=1
}

/^[ \t]*End[[:blank:]]+Interface/ && insideInterface==1 {
	insideInterface=0
}

#############################################################################
# Set flag if we are inside a function/sub to avoid processing keywords
# like Enum, Sub, Function etc... within a function
# 0 - Outside function/sub
# 1 - At line fo function/sub definition
# 2 - Inside a function/sub
#############################################################################
insideFunction==1 {
	insideFunction=2
}

(/^Function[[:blank:]]+/ || /[[:blank:]]+Function[[:blank:]]+/ ||
/^Sub[[:blank:]]+/ || /[[:blank:]]+Sub[[:blank:]]+/) && insideFunction==0 &&
(!(/^Declare[[:blank:]]+/ || /[[:blank:]]+Declare[[:blank:]]+/)) &&
insideInterface==0 {
	insideFunction=1
}

(/^[ \t]*End[[:blank:]]+Function/ || /^[ \t]*End[[:blank:]]+Sub/) &&
insideFunction==2 {
	insideFunction=0
}

#############################################################################
# simple rewrites
# vb -> c# style
# 
# keywords used by doxygen must be rewritten. All other rewrites
# are optional and depend on the csharpStyledOutput setting.
#############################################################################
/^Private[[:blank:]]+/ || /[[:blank:]]+Private[[:blank:]]+/ {
	sub("Private[[:blank:]]+","private ")
}

/^Public[[:blank:]]+/ || /[[:blank:]]+Public[[:blank:]]+/ {
	sub("Public[[:blank:]]+","public ")
}

/^Dim[[:blank:]]+/ || /[[:blank:]]+Dim[[:blank:]]+/ {
	sub("Dim[[:blank:]]+","private ")
}

# friend is the same as internal in c#, but Doxygen doesn't support internal,
# so make it private to get it recognized by Doxygen) and Friend appear
# in Documentation
/^Friend[[:blank:]]+/ || /[[:blank:]]+Friend[[:blank:]]+/ {
	if (csharpStyledOutput==1) {
		sub("Friend[[:blank:]]+","private Friend ")
	} else {
		print appShift"/// \\remark declared as Friend in the VB original source"
		sub("Friend[[:blank:]]+","private ")
	}
}

/^Protected[[:blank:]]+/ || /[[:blank:]]+Protected[[:blank:]]+/ {
	sub("Protected[[:blank:]]+","protected ")
}

/^Shared[[:blank:]]+/ || /[[:blank:]]+Shared[[:blank:]]+/ {
	if (csharpStyledOutput==1) {
		sub("Shared", "static")
	} else {
		sub("Shared", "static Shared")
	}
}

# Replace "Partial" by "partial" and swap order of "partial" and "public" or "private"
/^.*Partial[[:blank:]]+/ {
	sub("Partial","partial")
	if ($1 == "partial" && $2 ~ /public|private/) {
		$1 = $2
		$2 = "partial"
	}	
}

# Const -> const
/\<Const\>/ {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<Const\>/, "const", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# No WithEvents in C# - let's treat it like variables
/^.*WithEvents[[:blank:]]+/ && (csharpStyledOutput==1) {
	sub("WithEvents","")
}

# Overrides -> override
/[[:blank:]]Overrides[[:blank:]]/ && (csharpStyledOutput==1) {
	sub("Overrides","override")
}

# Overridable -> virtual
/[[:blank:]]Overridable[[:blank:]]/ && (csharpStyledOutput==1) {
	sub("Overridable","virtual")
}

# Optional has to be removed for c# style
/[[:blank:]]Optional[[:blank:]]/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub("Optional" ," ", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# String -> string
/\<String\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<String\>/, "string", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# Boolean -> bool
/\<Boolean\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<Boolean\>/, "bool", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# Char -> char
/\<Char\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<Char\>/, "char", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# Byte -> byte
/\<Byte\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<Byte\>/, "byte", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# Short -> short
/\<Short\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<Short\>/, "short", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# Integer -> int
/\<Integer\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<Integer\>/, "int", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# Long -> long
/\<Long\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<Long\>/, "long", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# Single -> float
/\<Single\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<Single\>/, "float", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# Double -> double
/\<Double\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<Double\>/, "double", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# Decimal -> decimal
/\<Decimal\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<Decimal\>/, "decimal", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# Date -> DateTime
/\<Date\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<Date\>/, "DateTime", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# Object -> object
/\<Object\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<Object\>/, "object", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# Delegate -> delegate
/\<Delegate\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<Delegate\>/, "delegate", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

# AddressOf -> &
/\<AddressOf\>/ && (csharpStyledOutput==1) {
	# Split line by inline comment string sequence
	# to avoid changing any keywords inside a comment
	len = split($0, line_segs, /\/\*\*</)
	if (len > 0) {
		# Change stuff
		gsub(/\<AddressOf\>/, "\\&", line_segs[1])
	}
	# Recombine line
	$0 = join(line_segs, len, "/**<")
}

#############################################################################
# enums
#############################################################################
(/^Enum[[:blank:]]+/ || /[[:blank:]]+Enum[[:blank:]]+/) && insideFunction!=2 {
	sub("Enum", "enum")
	# Enumerations shouldn't have type definition so remove it
	sub("[[:blank:]]+As[[:blank:]]+.*", "")
	if (isInherited==1) {
		endOfInheritance()
	}
	print appShift $0 "\n" appShift "{"
	insideEnum=1
	lastEnumLine=""
	AddShift()
	next
}

/^[ \t]*End[[:blank:]]+Enum/ && insideEnum==1 {
	print appShift lastEnumLine
	ReduceShift()
	print appShift "}"
	insideEnum=0
	lastEnumLine=""
	enumComment=""
	next
}

insideEnum==1 {
	if (lastEnumLine == "") {
		lastEnumLine = $0
		if (enumComment!="") {
			print enumComment
		}
		enumComment=""
	} else {
		commentPart=substr(lastEnumLine,match(lastEnumLine,"[/][*][*]<"))
		definitionPart=substr(lastEnumLine,0,match(lastEnumLine,"[/][*][*]<")-2)
		if (definitionPart=="") {
			print appShift commentPart ","
		} else {
			print appShift definitionPart ", " commentPart
		}
		lastEnumLine = $0
		# print leading comment of next element, if present
		if (enumComment!="") {
			print enumComment
		}
		enumComment=""
	}
	next
}

#############################################################################
# types
#############################################################################
(/^Type[[:blank:]]+/ || /[[:blank:]]+Type[[:blank:]]+/) && insideFunction!=2 {
	sub("Type","struct")
	sub("+*[[:blank:]]As.*",""); # types shouldn't have type definitions
	if (isInherited==1) {
		endOfInheritance()
	}
	print appShift $0"\n"appShift"{"
	insideType=1
	lastTypeLine=""
	AddShift()
	next
}

/^[ \t]*End[[:blank:]]+Type/ && insideType==1{
	if (match(lastTypeLine,"[/][*][*]<") != 0) {
		commentPart=substr(lastTypeLine,match(lastTypeLine,"[/][*][*]<"))
		definitionPart=substr(lastTypeLine,0,match(lastTypeLine,"[/][*][*]<")-2)
	} else {
		commentPart=""
		definitionPart=lastTypeLine
	}
	if (definitionPart=="") {
		print appShift commentPart ";"
	} else {
		print appShift convertSimpleType(definitionPart) "; " commentPart
	}
	ReduceShift()
	print appShift "}"
	insideType=0
	lastTypeLine=""
	typeComment=""
	next
}

insideType==1 {
	if (lastTypeLine == "") {
		lastTypeLine = $0
		if (typeComment!="") {
			print typeComment
		}
		typeComment=""
	} else {
		if (match(lastTypeLine,"[/][*][*]<") != 0) {
			commentPart=substr(lastTypeLine,match(lastTypeLine,"[/][*][*]<"))
			definitionPart=substr(lastTypeLine,0,match(lastTypeLine,"[/][*][*]<")-2)
		} else {
			commentPart=""
			definitionPart=lastTypeLine
		}
		if (definitionPart=="") {
			print appShift commentPart ";"
		} else {
			print appShift convertSimpleType(definitionPart) "; " commentPart
		}
		lastTypeLine = $0
		# print leading comment of next element, if present
		if (typeComment!="") {
			print typeComment
		}
		typeComment=""
	}
	next
}

#############################################################################
# Declares
#############################################################################

/.*Declare[[:blank:]]+/ && insideFunction!=2 {
	libName=gensub(".+Lib[[:blank:]]+\"([^ ]*)\"[[:blank:]].*","\\1","g")
	# exchange \ in path name with \\ to avoid doxygen warnings
	gsub(/\\/, "\\\\", libName)
	if (match($0,"Alias")>0) {
		aliasName=gensub(".+Alias[[:blank:]]+\"([^ ]*)\"[[:blank:]].*"," (Alias: \\1)","g")
	}
	if (isInherited==1) {
		endOfInheritance()
	}
	print appShift "/** \\remark Is imported from external library: " libName aliasName " */"
	if (csharpStyledOutput==1) {
		sub(/Declare[[:blank:]]+/,"extern ")
	}
	libName=""
	aliasName=""
}

# remove lib and alias from declares
/.*Lib[[:blank:]]+/ {
	sub("Lib[[:blank:]]+[^[:blank:]]+","")
	sub("Alias[[:blank:]]+[^[:blank:]]+","")
}

#############################################################################
# types (handle As and Of)
#############################################################################

/.*[(]Of[ ][^ ]+[)].*/ {
	$0=gensub("[(]Of[ ]([^ )]+)[)]", "<\\1>","g",$0)
}

## converts a single type definition to c#
##  "Var As Type" -> "Type Var"
##  "Var As New Type" -> "Type Var = new Type()"
function convertSimpleType(Param) {
	l=split(Param, aParam, " ")
	newParam=""
	for (j = 1; j <= l; j++) {
		if (aParam[j] == "As") {			
			typeIndex = 1
			if (aParam[j+1] == "New") {
				typeIndex = 2
				aParam[j+1] = ""
			}
			aParam[j]=aParam[j-1]
			aParam[j-1]=aParam[j+typeIndex]
			aParam[j+typeIndex]=""
		}
	}
	for (j = 1; j <= l; j++) {
		if (aParam[j]!="") {
			if (j == 1) {
				newParam=aParam[j]
			} else {
				newParam=newParam " " aParam[j]
			}
		}
	}
	l=""
	delete aParam
	return newParam
}

function rindex(string, find) {
	ns=length(string)
	nf=length(find)
	for (r = ns + 1 - nf; r>=1; r--) {
		if (substr(string, r, nf) == find) {
			return r
		}
	}
	return 0
}

function findEndArgs(string) {
	ns=length(string)
	nf=length(")")
	for (r = ns + 1 - nf; r>=1; r--) {
		if ((substr(string, r, nf) == ")") && (substr(string, r - 1, nf) != "(")) {
			return r
		}
	}
	return 0
}

#(/.*Function[[:blank:]]+/ ||
#/.*Sub[[:blank:]]+/ ||
#/.*Property[[:blank:]]+/ ||
#/.*Event[[:blank:]]+/ ||
#/.*Operator[[:blank:]]+/) &&
/.*As[[:blank:]]+/ {
	gsub("ByVal","")
	# keep ByRef to make pointers differ from others
	# gsub("ByRef","")
	if (csharpStyledOutput==1) {
		gsub("ByRef","ref")
	}
	# simple member definition without brackets
	if (index($0,"(") == 0) {
		$0=convertSimpleType($0)
	}
	else if (match($0, ".*Sub[[:blank:]].+") ||
	    match($0, ".*Function[[:blank:]].+") ||
	    match($0, ".*Property[[:blank:]].+") ||
	    match($0, ".*Event[[:blank:]].+") ||
	    match($0, ".*Operator[[:blank:]].+")) {
		# parametrized member
		preParams=substr($0,0,index($0,"(")-1) 
		lpreParams=split(preParams, apreParams , " ")
		
		Params=substr($0,index($0,"(")+1,findEndArgs($0)-index($0,"(")-1)
		
		lParams=split(Params, aParams, ",")
		Params=""
		# loop over params and convert them
		if (lParams > 0) {
			for (i = 1; i <= lParams; i++) {
				if (match(aParams[i],/.+[(][)].*/)) {
					lParam=split(aParams[i], aParam , " ")
					for (j = 1; j <= lParam; j++) {
						if (aParam[j] == "As") {
							aParam[j-1]=gensub("[(][)]","","g",aParam[j-1])
							aParam[j+1]=gensub("[(][)]","","g",aParam[j+1])
							aParam[j+1]=aParam[j+1]"[]"
						}
					}
					for (j = 1; j <= lParam; j++) {
						if (j == 1) {
							aParams[i]=aParam[j]
						} else {
							aParams[i]=aParams[i] " " aParam[j]
						}
					}
				}
				if (i == 1) {
					Params=convertSimpleType(aParams[i])
				} else {
					Params=Params ", " convertSimpleType(aParams[i])
				}
			}
			postParams=substr($0,findEndArgs($0)+1)
		} else { 
			postParams=substr($0,rindex($0, ")")+1)
		}
		#postParams=substr($0,findEndArgs($0)+1) 
		# handle type def of functions and properties
		lpostParams=split(postParams, apostParams , " ")
		if (lpostParams > 0) {
			if (apostParams[1] == "As") {
				## functions with array as result
				if (match(apostParams[2], ".*[(].*[)].*")) {
					apostParams[2]=gensub("[(].*[)]","[]","g",apostParams[2])
				}
				##
				apreParams[lpreParams+1]=apreParams[lpreParams]
				apreParams[lpreParams]=apostParams[2]
				lpreParams++
				apostParams[1]=""
				apostParams[2]=""
			}			
		}
		
		# put everything back together
		$0=""
		for (i = 1; i <= lpreParams; i++) {
			if (apreParams[i]!="") {
				$0=$0 apreParams[i]" "
			}
		}
		
		$0=rtrim($0)
		
		$0=$0 "("Params") "
		
		for (i = 1; i <= lpostParams; i++) {
			if (apostParams[i]!="") {
				$0=$0 apostParams[i]" "
			}
		}
		
		$0=rtrim($0)
		
		# cleanup mem
		lParams=""
		delete aParams
		lpostParams=""
		delete apostParams
		lpreParams=""
		delete apreParams
	}
	else {
		# convert arrays
		$0=convertSimpleType($0)
		
		lLine=split($0, aLine , " ")
		for (j = 1; j <= lLine; j++) {
			if (match(aLine[j], ".*[(].*[)].*")) {
				aLine[j]=gensub("[(].*[)]","","g",aLine[j])
				aLine[j-1]=aLine[j-1]"[]"
			}
		}
		$0 = ""
		for (j = 1; j <= lLine; j++) {
			$0 = $0 aLine[j] " "
		}
	}
}

#############################################################################
# Rewrite Subs handling events if csharpStyledOutput=1
#############################################################################
/.*[[:blank:]]Handles[[:blank:]]+/ && (csharpStyledOutput==1) {
	name=gensub(/(.*)[[:blank:]]+Handles[[:blank:]]+(\w+)/,"\\2","g",$0)
	print appShift "/// \\remark Handles the " name " event."
	$0=gensub(/(.*)[[:blank:]]+Handles[[:blank:]]+(.*)/,"\\1","g",$0)
}

#############################################################################
# namespaces
#############################################################################
/^Namespace[[:blank:]]+/ || /[[:blank:]]+Namespace[[:blank:]]+/ {
	sub("Namespace","namespace")
	insideNamespace=1
	print appShift $0 " {"
	AddShift()
	next
}

/^.*End[[:blank:]]+Namespace/ && insideNamespace==1 {
	ReduceShift()
	print appShift "}"
	insideNamespace=0
	next
}

#############################################################################
# interfaces, classes, structures
#############################################################################
(/^Interface[[:blank:]]+/ ||
/.*[[:blank:]]Interface[[:blank:]]+/ ||
/^Class[[:blank:]]+/ ||
/.*[[:blank:]]Class[[:blank:]]+/ ||
/^Structure[[:blank:]]+/ ||
/.*[[:blank:]]Structure[[:blank:]]+/) &&
insideFunction!=2 {
	sub("Interface","interface")
	sub("Class","class")
	sub("Structure","struct")
	if (isInherited==1) {
		endOfInheritance()
	}
	classNestCounter++
	
	# save class name for constructor handling
	className[classNestCounter]=gensub(".+class[[:blank:]]+([^ ]*).*","\\1","g")
	isInherited=1
	print appShift $0
	next
}

# handle constructors
/.*Sub[[:blank:]]+New.*/ && className[classNestCount]!="" {
	sub("New", "New " className[classNestCount])
}

function endOfInheritance() {
	isInherited=0
	if (lastLine!="") {
		print appShift lastLine
	}
	print appShift "{"
	AddShift()
	lastLine=""
	return 0
}

# handle inheritance
isInherited==1{
	if (($0 ~ /^[[:blank:]]*Inherits[[:blank:]]+/) || ($0 ~ /^[[:blank:]]*Implements[[:blank:]]+/)) {
		if (lastLine == "") {
			sub("Inherits",":")
			sub("Implements",":")
			lastLine=$0
		} else {
			sub(".*Inherits",",")
			sub(".*Implements",",")
			lastLine=lastLine $0
		}
	} else {
		endOfInheritance()
	}
}

(/.*End[[:blank:]]+Interface/ ||
 /.*End[[:blank:]]+Class.*/ ||
 /.*End[[:blank:]]+Structure/) &&
 (classNestCounter >= 1){
	ReduceShift()
	print appShift "}"
	delete className[classNestCounter+1]
	next
}

#############################################################################
# Replace Implements with a comment linking to the interface member,
#   since Doxygen does not recognize members with names that differ
#   from their corresponding interface members
#############################################################################
/.+[[:blank:]]+Implements[[:blank:]]+/ {
	if ($0 ~ /.*Property[[:blank:]]+.*/) {
		$0=gensub("(Implements)[[:blank:]]+(.+)$","/** Implements <see cref=\"\\2\"/> */","g",$0)
	} else {
		$0=gensub("(Implements)[[:blank:]]+(.+)$","/**< Implements <see cref=\"\\2\"/> */","g",$0)
	}
}

#############################################################################
# Properties
#############################################################################
(/^Property[[:blank:]]+/ ||
/.*[[:blank:]]+Property[[:blank:]]+/) && insideFunction!=2 {
	sub("[(][)]","")

	if (csharpStyledOutput==1) {
		# remove Property keyword
		gsub("^Property[[:blank:]]","")	
		gsub("[[:blank:]]Property[[:blank:]]"," ")
	}
	
	if (match($0,"[(].+[)]")) {
		$0=gensub("[(]","[","g")
		$0=gensub("[)]","]","g")
	} else {
		$0=gensub("[(][)]","","g")
	}
	
	# add c# styled get/set methods
	if ((match($0,"ReadOnly")) || (match($0,"Get"))) {
		if (csharpStyledOutput==1) {
			sub("ReadOnly[[:blank:]]","")
		}
		if (insideVB6Property == 1) {
			insideVB6Property = 0
			$0=gensub("[[:blank:]]Get|[[:blank:]]Set|[[:blank:]]Let","","g")
			print appShift $0 "\n" appShift "{ get; set; }"
		} else {
			$0=gensub(" Get| Set| Let","","g")
			print appShift $0 "\n" appShift "{ get; }"
		}
	} else {
		if ((match($0, "Let") || match($0, "Set"))) {
			insideVB6Property = 1
			next
		}
		$0=gensub(" Get| Set| Let","","g")
		print appShift $0 "\n" appShift "{ get; set; }"
		next
	}
	insideVB6Property = 0
	next
}

/.*Operator[[:blank:]]+/ {
	$0=gensub("Operator[[:blank:]]+([^ ]+)[[:blank:]]+","\\1 operator ","g",$0)
}

#############################################################################
# process everything else
#############################################################################
(/.*private[[:blank:]]+/ ||
/.*public[[:blank:]]+/ ||
/.*protected[[:blank:]]+/ ||
/.*friend[[:blank:]]+/ ||
/.*internal[[:blank:]]+/ ||
/^Sub[[:blank:]]+/ ||
/.*[[:blank:]]+Sub[[:blank:]]+/ ||
/^Function[[:blank:]]+/ ||
/.*[[:blank:]]+Function[[:blank:]]+/ ||
/.*declare[[:blank:]]+/ ||
/^Event[[:blank:]]+/ ||
/.*[[:blank:]]+Event[[:blank:]]+/ ||
/.*const[[:blank:]]+/ ||
/.*[[:blank:]]+const[[:blank:]]+/) &&
insideFunction!=2 {
	
	# remove square brackets from reserved names
	# but do not match array brackets
	#  "Integer[]" is not replaced
	#  "[Stop]" is replaced by "Stop"	
	$0=gensub("([^[])([\\]])","\\1","g")
	$0=gensub("([[])([^\\]])","\\2","g")
	
	if (csharpStyledOutput==1) {
		# subs are functions returning void
		gsub("[[:blank:]]Sub[[:blank:]]+"," void ")
		gsub("^Sub[[:blank:]]+","void ")
		gsub("[[:blank:]]Event[[:blank:]]+"," event ")
		gsub("^Event[[:blank:]]+","event ")
	}
	
	# add semicolon before inline comment
	if ($0 != "") {	
		commentPart=substr($0,index($0,"/"))
		definitionPart=substr($0,0,index($0,"/")-1)
		if (definitionPart != "" && commentPart != "") {
			$0 = appShift definitionPart"; "commentPart
		} else {
			$0 = appShift $0 ";"
		}
		# with Declares we can have a superfluous "Function" here.
		sub("Function","")
		print $0
	}
}

END {
	# print final closing tag if still inside a comment
	if (insideComment == 1) {
		print appShift " */"
	}
	# print default file header if not yet printed due to empty file
	if (defaultFileHeaderPrinted==0) {
		print "/** \\file */"
	}
	# print leading namespace if not yet printed due to empty file
	if (leadingNamespace==1) {
		file=gensub(/\\/, "/", "G", FILENAME)
		print "namespace "basename[split(file, basename , "/")-1]" {"
		AddShift()
		leadingNamespace=2
	}
	# print class name if file is empty
	if ((insideVB6Class==1) && (insideVB6Header==1)) {
		print appShift "class " insideVB6ClassName "\n" appShift "{"
		VB6ClassComment[VB6ClassCommentLineCount++]=" * \\class " insideVB6ClassName
		VB6ClassComment[VB6ClassCommentLineCount++]=" */"
	} else {
		ReduceShift()
	}
	# 
	if (insideVB6Class==1) {
		# print final closing bracket for VB6 classes
		print appShift "}"
		# print class comment
		for (c = 1; c <= length(VB6ClassComment); c++) {
			print appShift VB6ClassComment[c]
		}
		# 
		ReduceShift()
	}
	# print final closing bracket for namespace
	if (leadingNamespace==2) {
		print appShift "}"
	}
}
