#!/bin/bash

if [ $# -eq 0 ]; then
	 echo
	  echo "Shell script roger-deploy : Deploy to remote host."
	   echo
	    echo "NAME"
		 echo " ./roger-deploy -- Automatically deploy the current directory to a remote host with a commit message."
		  echo
		   echo "SYNOPSIS"
		    echo " ./roger-deploy \"Commit message"\"
			 echo
			  echo "DESCRIPTION"
			   echo " This scripts permit auto deployment of the current git repository on a remote server. It commits changes with its first argument then push it. The script then connect to remote server and run a script to retrieve updated files."
			    echo
				 echo
				  echo "EXIT STATUS"
				   echo " The roger-deploy utility exits 0 on success, and 1 if an error occurs."
				    echo
					 echo "EXAMPLES"
					  echo " The command:"
					   echo
					    echo "  ./roger-deploy \"Update my views\""
						 echo
						  echo " will commit all changes with this text then push to Github."
						   exit 1
					   fi

					   if [ $# -eq 1 ]; then
						    git add .
							 git commit -m "$1"
							  git push
							   echo "Git repository updated. Now running update on server."
							    ssh skrystin@192.168.56.3 -p 2222 'bash -s' < "cd /var/www/html/roger-skyline && git pull"
								 exit 0
							 fi

							 exit 1
