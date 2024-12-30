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
- There are many tools which helps to store data remotely like, Bitbuket, Azure DevOps, Gitlab,SourceForge etc
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
Once you create a folder and initiate it then it will become your working directory
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
