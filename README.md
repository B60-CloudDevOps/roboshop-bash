# roboshop-bash

In this repo, we will write bas script to do the configuration management for roboshop on linux redhat 9.

We also need to make sure that we are going to write the code keeping the multi-environment strategy in to consideration.

This is exepcted to run on the top of the component servers, to execute the script frontend.sh, we need to be on frontend server.

1) Login to frontend server
2) Do a git clone of your repo that has bash for roboshop
3) and then switch to the repo and then run
    $ bash frontend.sh

# Whenever we deal things that scale, we need an NFR that has to be followed across the board!
NFR: Non-Functional Requirement

    1) When we automate something, the re-run of that should work without any disruption.
    2) When you restart the compoments, apps should come up automatically.
    3) Code should always support multi-environment.
    4) When you see some value is repeated multiple times, make sure it's parameterized
    5) All the backend components should be accessed privately with private dns records



> Basics are important
1) If I say run the script test.sh
2) git clone or git pull the repo
3) Make sure that script is in the folder that you're running
4) ls -ltr
5) bash test.sh 