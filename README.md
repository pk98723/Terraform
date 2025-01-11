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


# Intoduction to Terraform

Terraform Introduction:

Lets say you are a DevOps engineer and you have simple task to deploy S3 bucket. Simple way is to go to AWS console and search for S3 service to create S3 bucket by providing basic details name, should you enable to disable of public access etc. The S3 bucket is created, it will take 2 min hardly to build it.

Now this will work in a case of creating 1 instance but what if you have a requirement of creating a 100 S3 instances, the calculation will be 2 min x 100 EC2 instances and that's too huge and time consuming. 

To solve this problem instead of using a User interface(provider's console)  you will follow a programmatic approach where you can use either the AWS CLI or thru scripting knowledge you will interact with AWS API's.

Incase you don't know about API, simply understand it as, if you are having knowledge on Powershell or Python you can talk to the AWS services programmatically thru API as every instance in AWS has an API built by AWS which will help you to interact. So here you need understand that the API will be used to interact/call the particular service in AWS.

Lets say you have written a Python program to deploy S3 bucket and you will tell your team to run the program to deploy S3 bucket so in fraction of seconds the program is created and if you have 100 requests to deploy S3 bucket also you will achieve it in very little time.

But the main problem is that you need to have the programming language like what if you are asked to create VPC, VPC config, EC2, S3 bucket etc., then you need to have a good programming knowledge.

Here there is a concept called Cloud Formation Templates (CFT) and in CFT it is standard template to write it in JSON/YAML language. The Providers like AWS will do the heavy lifting of the codes into the CFT which will allow you to write your infrastructure as code. In the template, you will simply write I need VPC, I need S3 bucket, I need VC2 instance etc., in terms of templating language.  (You will find many documents online on how to write a code in CFT that AWS understands)

So this way you are writing your Infrastructure as code, this code can be shell scripting, Python or can be CFT template.

Now there are many IAC tools for example:

1. AWS - Cloud Formation Templates
2. Azure - Resource Manager
  - Lets say you need to deploy a VM/AKS cluster etc., you need to write the code in the understandable syntax to Resource Manager so that it will request Azure and it will create resource for you in Azure.
3. Openstack- Heat templates

You may say that I understand/advantage how IAC works and I know scripting to make my IAC tools to deploy tools but why Terraform.

Now the problem is when you have all of these tools which will reduce time to deploy any resource, as you all deal with infrastructure, in an organization you might have to work on AWS, Azure, GCP openstack etc.,

As a Devops engineer how many tools you would learn, so any person who is trying to automate infrastructure, Terraform came up with a universal approach that you don't need to learn all these tool, just tell me what provider you need to deploy resources and i will do that work for you.

So Terraform is very very important that you just need to know how to write the code in terraform language which is Hashicorp coding language (HCL) and rest terraform will take care and that is why terraform is so important for devops engineer due to simplying our needs and because of its huge community. 

You might be thinking are there are no competitor for Terraform, yes there Corssplane, Pulemy etc., are the current competitors  but terraform is pioneer and it uses the concept called API as code. You don't need to understand the what is API as code the HCL templates are converted into API's w.r.t to provider.

Now lets see how to install Terraform:

Use the link https://developer.hashicorp.com/terraform/install
to install terraform on MacOS, Windows, Linux


For Windows, steps are below:
1. Go to above link and select Terraform for Windows version
2. Download AMD64 binary
3. Extract the files 
4. copy the files into a location in C drive
5. Now copy location of the file.
6. Add the location to the environment variable
7. To open environment variable: 
- Right click on windows button
- Select System
- Search for Advanced System Properties/settings
- Under Advanced tab look for Environment Variables and click on it
- You will see User variables and System variables and in both variables you will Path.
- Now select each path and click on Edit
- Now click on New and enter the path in both User and System variables and click on ok
- Now refresh your VS code terminal/Command prompt and enter "Terraform -version" to see which version is installed on your machine.
Note: When you copy the location to the variable path, please just add the location of the terraform path and do not include .exe file name in the path.

Ex: You have downloaded setup file from portal and kept the extracted files in Terraform folder in C drive. So that path will be:
C:/Terraform/Terraform_1.10.4_windows_amd64
But it should not be like below
C:/Terraform/Terraform_1.10.4_windows_amd64\terraform.exe






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
At this point your local directory dont know what is the remote repository so it has to be declared or should be advertised by using below 

command:
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
