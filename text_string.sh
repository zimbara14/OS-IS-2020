#!/bin/bash
mystring=$2
var=$(printf '%s' $mystring)
echo ${#var}

#echo ${#mystring}

exit 0;
