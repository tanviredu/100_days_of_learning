1) DIstributed Version Controll system is git;
2) in Linux/Bsh create directory us : mkdir
3)in Linux create an empty file command is : touch
4) if you want to send output of one command to as a input to another command you have to use : PIPE and the Pipe IS '>','<'
5) if you want to get the latest code from online repo to your local repo the command is : git pull
6) you caommit after staging with with command : git commit
7) if you create a branch it will be visible in remote repository after you push the code;
8) See what file change : git status,want to see line by line is : git diff
9)in git diff command the +++ sign are the code that is added
10) if you fork a repo the origin goes to forked repository not the original repo
11) Diff uses +++ for adding and --- for deletition. and git diff shows both add and remove
12) you change directory with command : cd
13) you first git add; then git commit -m "commit message"; then git push origin <branch>
14) default branch of git is : main branch
15) when you clone a forked repository what will be the origin : forked repository
16)  repository on your device are local not remote
17) download a repository command : git clone
18) you have yo prepae the file before commiting and it is called : staging
19) when you commit it remains local when you push it all the developer can see it
20) 'git blame <filename>' , This command is used for to show all the changes made by the developer ,easy defination
it will give the history of the file change by its developer
21) if you run git diff and you see - sign before text that means it is removed
23) Create a branch: git branch <branch_name>
then you will go to that branch : git checkout <branch_name>
24) you can create a branch and go to that branch with a single command : git checkout -b <branch_name>
it will create the branch then take you there (checkout)

25) when you want to bring updated code from the remote 
repository then the command is : git pull
or from a specfic branch : git pull origin branch

26) commit history/ revision history can be found with 
the command : git log
if you want compact version then : git log --oneline

27) upload the changes to remote repository with command  : git push

28) surrent state : git status or git status --short

29) git add command will takes the files to staging area 


bash :

1) current working directory: pwd
2) search pattern : grep 
example : cat <file> | grep 'pattern'
3) input output stream : stdin,stdout,stderr
4) list directory : ls
5) for move something : mv
6) create directory : mkdir
7) command output varies depending on what flag you provide with the command . The option that you provide with
-- or - they are called flags
example:
=> git log [show the entire log]
=> git log --oneline  [show a compact one]
8) command line comes with some benifit
    *) automate the task
    *)interacting cloud provider
    *) better performance beause no GUI is used

9) change directory : cd
10) one program output to another program input : using Pipes

11) what is revision history : a record of changes made in a project
you can find a recod of changes of a file using git blame command
: git blame <file>

12) you dont have to be online all the time when you using git. when the push to remote or pull from remote  is required omly then it is needed

13) git alow you to rollback to a certain point if you want

14)when you commit in a central server only then other developer will find it when you push your commit to the cloud

14) git is designed for multiple developer work at once

15) CI/CD autometically package for deployment

16) distributed versin controll are git,mercurical

17) developer work on  a staging environment and the profit is:
    *) safe place to test and veryfi because we dont test on a production server 
    *) staging environment mimics the prodction so we can do accurate issue
    *) allow developer to work on a new feature without affecting the main program(production)

1) in git you can identify who made a change n the code
you can toll back to previous code if you want
you can colaborate with other developer

2) some time merge conflict occur when multiple developer work on a same file. and if it happend developer have to manually fix this . there is no automatic process to do that

3) distributed:
        git
        mercurical
    Centralized:
        subversion
        concurrent version system
    
4) version controll online service can complement more things
    1) continuous integration
    2) continious delivery
    3) continuous deployment
