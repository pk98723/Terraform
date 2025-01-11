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

---------------------------------------------------
Now lets use Github Codespace to kick of the deployments incase you dont have VS/VS Code the Codespace will provide you a platform to deploy your code/resources in any provider using terraform.

Steps to utilize codespace  in Github
1. Login into Github
2. Search for the project created (incase you are new to Github then you can fork any existing project from public to use this)
3. On the right hand side you will find "Code", dropdown it you wll find 2 options "Local" & "Codespace"
4. CLick on create codespace.
5. You will be routed to a terminal
## Lets install terraform ##
6. Now on the serach space enter "> Add  Dev Container configuration files"
7. You will be given two options select "Modify your active configuration" and search for "Terraform , tflint, and TFGrunt devcontainers" and click on  "ok"
8. And select "Keep Defaults"
9. You will see a new file called "devcontainers.JSON" is created with below configuration:
{
"image" : "mcr.microsoft.com/devcontainers/universal:2",
"features": {
  "ghcr.io/devcontainers/features/terraform:1":{}
   }
}
10. Now in the terminal type "terraform --version". You will see it is not installed yet. So we need to add an aditional step but before that lets have AWS provider configuration installed.
11. Now on the serach space enter "> Add  Dev Container configuration files"
12. You will be given two options select "Modify your active configuration" and search for "AWS CLI devcontainers" and click on  "ok"
13. And select "Keep Defaults"
14. You will see the file "devcontainers.JSON" is modified with AWS provider configuration:
{
"image" : "mcr.microsoft.com/devcontainers/universal:2",
"features": {
  "ghcr.io/devcontainers/features/terraform:1":{}
  "ghcr.io/devcontainers/features/aws-cli:1": {}
   }
}
15. Now lets do the final step to configure terraform. In the search type "> Codespaces: Rebuild Container". It will ask you that are you ok to rebuild the container with the new configuration (AWS, Terraform) which was provided by you. Now click on "Rebuild"

Note: Cpdespace is free for 60hr(2 CPUs and 4 GB RAM) post that it will not be active. If you want to utilize it again create a new Github account and utilize it again for 60 hr.
---------------------------------------------

First Program:Creation of EC2 instance in AWS

Now lets create a new file "main.tf"

Start writing with provider followed by region
------------> provider "aws" 
------------> region = "eu-north-1"

Here we are telling Terraform that the resources will be built in AWS and the region we will be using is eu-north-1
The syntax will be:
"
provider "aws" {
  region = "eu-north-1"
}
"
Now lets start with resource configuration. We will try to deploy an EC2 instance:

For it we will need to define basic parameters like: resource and its type, ami (amazon image code), subnet id ( where the VM should be deployed), key pair (for authentication)
The syntax will be:
"
resource "aws_instance" "example2" {
  ami = "ami-094a9a574d190f541"
  instance_type = "t3.micro"
  subnet_id = "subnet-0cb81374797a535e0"
  key_name = "kp1"
}
"
Note: Incase you are creating for the first time and you are new user then create a Key pair from the AWS console and copy the name of the kay pair. As you use the free version of AWS, a default subnet will already be created for you to use, just copy the subnet id from the console.

Here is the complete code:


provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "example2" {
  ami = "ami-094a9a574d190f541"
  instance_type = "t3.micro"
  subnet_id = "subnet-0cb81374797a535e0"
  key_name = "kp1"
}

Now run below commands from terraform:

Terraform init- which will initiate the commands
Terraform plan - Which will do a dry run of the code you wrote and helps you understand incase of any mistakes in the code/configuration you are looking For.
Terraform apply - Which will help to deploy the resource as per the code written
Terraform destroy - Which will delete the resource created.

This is the complete life cycle of the terraform.

----------------------------------------------------------
Now Lets Concentrate on the providers and types of providers Hashicorp will support

Basically there are cartegorized into 3 types of providers that Hashicorp supports
1. Official
2. Partner
3. Community

Official providers are actively maintained by Hashicorp and they are Azure, AWS, GCP and Kubernates. And these are backed up by Hashicorp.
Partner providers are those who will maintain the authentication or code ect and Hashicorp has given them authorization to use it. Examples are Alibaba and  Oracle Cloud
Community providers are those where you and I can create entire configuration of providers and are maintained by open source. There is no official backing up by Hashicorp or official or partner providers.

Documentation will be found in Hashicorp portal.

----------------------------------------------------------
Now lets demonstrate the provider code:


providers "aws" { ------------------> We are telling the script to use provider as aws.
  region = "us-east-1"------------------> We are telling the region to be utilized is us-east-1 to deploy the resource
}

Lets see couple of scenarios:

## Multiple regions

providers "aws" {
  alias = "us-east-1" -----------------> We are telling the script that incase we have written "us-east-1" anywhere in the code then to use region as "us-east-1". We can also give any randam name as ABC, XYZ to alias name it will help you understand the region that needs to be picked by.
  region = "us-east-1"
}

providers "aws" {
  alias = "us-west-2"
  region = "us-west-2"
}

Here is the complete example for deploying a EC2 instance in Multiple regions:


providers "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}

providers "aws" {
  alias = "us-west-2"
  region = "us-west-2"
}

resource "aws_instance" "example1" {
  ami = "ami-094a9a574d190f541"
  instance_type = "t3.micro"
  provider = "aws.us-east-1" ------------------> We are telling the script to deploy the resource in "aws" with the region added in alias name as "us-east-1"
  subnet_id = "subnet-0cb81374797a535e0"
  key_name = "kp1"
}

resource "aws_instance" "example2" {
  ami = "ami-094a9a574d190f541"
  instance_type = "t3.micro"
    provider = "aws.us-west-2"------------------> We are telling the script to deploy the resource in "aws" with the region added in alias name as "us-west-2"
  subnet_id = "subnet-0cb81374797a535e0"
  key_name = "kp1"
}


## Multiple providers

providers "aws" { ------------------> We are telling the script to use provider as aws.
region = "us-east-1"
}
providers "azurerm"{  ------------------> We are telling the script to use provider as azure.
  subscriptionid =  "your-azure-subscription -id"
  client_id = "your-azure-client-id"
  client_secret = "your-azure-Client-secret"
  tenent_id = "your-azure-tenent-id"
}

resource "aws_instance" "example1" {
  ami = "ami-094a9a574d190f541"
  instance_type = "t3.micro"
  subnet_id = "subnet-0cb81374797a535e0"
  key_name = "kp1"
}

resource "azurerm_virtual_machine" "example1" {
  name = "example 1"
  location = "east-us"
  size = "standard_Bms2"
  }

  For more details go to
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
  - https://registry.terraform.io/providers/hashicorp/aws/latest/docs


  ------------------------------------------------------------------
  # Variables:



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
