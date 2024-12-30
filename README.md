# Terraform
Bacis of Terraform to build resources in Azure


# 29-12-2024:
Created a reporsitory in Terraform.




Terraform
1. Basic structure - Main, Variables, Output, Provider, Data, Local
2. Modules, Secrets - Terraform Vaults
3. basic projects using modules
4. Adv YAML configuration - CICD(GitHub Actions)
5. Adv projects using modules

- Target date to complete by 25th Jan'25

# Intoduction to GIT

- Git is a repository to store files in a remote repository.
- There are many tools which helps to store data remotely like, Bitbuket, Azure DevOps,Github Gitlab,SourceForge etc
- Install Git from the https://git-scm.com/downloads.
- Git can be installed on Linux, MAC, Windows.
- Once the Git is downloaded, open CMD promt and enter git- you will be prompted with few inputs. It means Git is installed.
- Now create a new folder and open that in cmd prompt and enter the comman "Git init" - Meaning to initiate this folder as working directory(unsaved files in the user's system)
- We have 4 different types of stages in Git
1. Working Directory
2. Staging Area
3. Local Directory
4. Remote Repository

- What is Working Directory
It is a locally created folder where all the files are saved in different forms including txt.
Once you create a folder and initiate it then it will become your working directory.
When files are in the working directory stage they are called "Untracked files ("U")
So command here is "Git init"

- What is Staging Area
This is the next level of Working Directory
You can copy the required file from working directory to staging area one file a time.
So that means, if you are working on 10 files and you want to store only 1 file out of it into Remote repository then you can choose that one file from the list and copy that into Staging area.
So command here is "Git add"

- What is Local Directory
This is the next level of Staging Area
You can commit the new files or changes in the existing files from Staging area to Local Repository.
Here you have to commit the entire files what are in the staging area
So command here is "Git commit"

So now if you understand the difference here, Only one files at a time can be copied from Working directory to Staging area and from staging area all the files in the staging will be commited into Local Repository.

- What is Remote Repository
This is next level of Remote Repository
Here entire files from the Local Directory will be pushed into Remote Repository
So command here is "Git push"

Example:
Lets say we have a folder on desktop with name "Tutfarm"

C:\Users\ABC\Desktop\Tutfarm> git init
# This will initate the Tutfarm folder as working directory

now lets say we have created 2 file's inside this folder with name farmexample.txt & farm.py.
this means we are at 1st state "Working directory". Now lets push one of the file into "Staging area"

# Pushing from Working directory to Staging area
C:\Users\C:\Users\ABC\Desktop\Tutfarm> git add farm.py

So after we run the above command we see that the out of 2 files from working directory, one is ready to be pushed from working directory to staging area and one is still marked as Untracked file in the working directory

# Pushing from Staging area to Local directory
C:\Users\C:\Users\ABC\Desktop\Tutfarm> git commit -m "Commiting code"

"-m" means the text you wanted to understand or when someone see;s the commit they will understand the text within "".

# Pushing from Local directory to Remote repository
Here to push the files into Remote repository, an account has to be created in the remote hosts in the tools discussed above. So here I am choosing Github.
At this point your local directory dont know what is the remote repository so it has to be declared or should be advertised by using below command:
C:\Users\C:\Users\ABC\Desktop\Tutfarm> git remote add origin "https://github.com/ABC/Tutsform.git" -----> Example name.

Now lets push

C:\Users\C:\Users\ABC\Desktop\Tutfarm> git push -u origin master

explanation:
origin master - Here we have only master branch so we will be able to push it to it. Incase we have more branches then we need to specify the branch we need. So run "git branch" command to understand what are all branches available.

- If to move into different branch from current branch
C:\Users\C:\Users\ABC\Desktop\Tutfarm> git checkout -b "Child1"
Explaining in deep:
Lets say you are in Master branch and you want to move into a different branch, using checkout, it will search for the branch given in the command. Incase it finds it then the branch will be switched. Incase it dint find it then it will automatically creates the new branch as per the name given and makes it primary.

- Pull Request: Pull requests are basically used for the data being pushed from child branches to master branch validations to higher authorities. This will help us to be more securily send the data into master.

# Important Git Commands:
git init - Will initate the project/files
git add - Will add the data/files into staging area
git commit - Will commit all the changes to local repository
git push - Will bring the changes and implement
git status - Will get the current status in which branch it is
git branch - Will get all the branch/s details
git checkout - Will check for the asked branch to move into or create it
git fetch - Will bring only the changes


# Steps to create account or repository in Github:
1. Login to github.com
2. Signup with the account you would like to use
3. Once the account is created and able to login, create a new repository.
4. Here you will find the additional options
.gitignore file -  Incase we do Git add/commit/push which files should be ignored and which files to be considered will be decleared.
README file - Can be used to track all the summary of your work.
Public - Anyone can have access to the repository
Private - Only the account holder can see the repository
License - There will be many open soruce projects online so we need to give license from repository incase you want to use that. It is like a security feature.


# General Questions:
1. How to get the data into working directory after your fork a repository?
Ans: Once you fork the data, you will be seeing the new repository created in your git. Now open the project click on the clone from top right hand side.
Select HTTPS, copy the code from it. Create a new folder on desktop. Now open the cmd promt enter below command and the entire project will get cloned into the working directory.
C:\Users\C:\Users\ABC\Desktop\Tutfarm1> git clone "https:---"
Here, donot use git init because we just need the code which is already initiated and stored in Remote repository so we just need to clone it.

2. Merge conflits
Ans: Incase user1 did some changes and made the commits on a branch. If user2 wants to do some more changes on the same file in the same branch wher user1 did, then it will prompt a warning that few commits are already done by another user.
