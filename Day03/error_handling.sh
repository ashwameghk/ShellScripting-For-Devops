#!/bin/bash
#
#
 create_directory(){
	 mkdir demo 
 }
 
 if ! create_directory; then 
	 echo "The code is being exited as directory already exists"
 	 exit 1
 fi

 echo "This  should not work becuase the code is interrupted"

