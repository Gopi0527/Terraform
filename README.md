Story of LT
•	Basic architecture
 
•	LT has 3 customers who are ready to buy
•	TCS wants to run application on AWS
•	Infosys on Azure
•	JP Morgan on vmware
•	How to automate these different deployments
•	Creating manually
•	For automation:
•	AWS has Cloud formation
•	Azure has ARM Templates
•	Terraform can automate infra creation in almost all the virtual environments and Terraform is an open source software and provides enterprise.
•	Terraform also allows us to deal with multiple environments
Architecture of Terraform
•	Terraform is developed in Go language and installation of terraform is one executable
•	Providers are not part of terraform installations as we try to create infra, as part of initializations providers are downloaded
•	Providers have resources and datasources as part of it
•	
 
Concepts of Terraform
•	Provider: This determines the target area to create infra structure
•	Refer Here for the list of providers
•	Terraform providers are of three categories
•	official
•	partner
•	community
•	Refer Here for providers documenation by hashicorp
•	Note: For you reference we have used the following template
---
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "2.33.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
    features {

    }
}

provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "fromtf" {
    ami = "ami-03f65b8614a860c29"
    tags = {
      Name ="from terraform"
    }
    key_name = "my_id_rsa"
    vpc_security_group_ids = ["sg-05adaf452b268c335"]
    instance_type = "t2.micro"

}


resource "azurerm_resource_group" "test" {
    name = "test"
    location = "eastus"

}
---
•	Arguments and Attributes:
•	Argument refers to inputs in terraform
•	Attributes refers to outputs in terraform
Infrastructure as a Code (IaC)
•	This allows us to declare the infrastructure i.e. we would represent our needs in some format and the tool does the rest of creation/deletion/updating the resources.
•	We deal with declarative language and desired state.
Infra Provisioning
•	This is about a tool which lets you express your infrastructure as a code and manages multiple environments and reusability
Terraform
•	This is infra provisioning tool and supports infrastructure as code, terraform uses Hashicorp configuration language HCL
Ways of Working with Terraform (First version)
•	Create the infrastructure manually atleast once as this helps
•	in figuring out inputs to be passed.
•	order of creation
•	every resource to be part of architecture
•	Figure out the right provider and resources
Syntaxes in Terraform
•	Provider: Refer Here for official docs
•	syntax
provider '<name-of-provider>' {
arg-name-1 = arg-value-1
..
arg-name-n = arg-value-n
}
•	Example
provider "aws" {
region = "us-west-2"
}
•	Generally we need to configure credentials for providers as well.
•	resource: This represents the infrastructural element to be created Refer Here
•	syntax
resource "<resource_type>" "name" {
arg-name-1 = arg-value-1
..
arg-name-n = arg-value-n
}
•	Example
“`
resource "aws_instance" "fromtf" {
ami = "ami-03f65b8614a860c29"
tags = {
Name ="from terraform"
}
key_name = "my_id_rsa"
vpc_security_group_ids = ["sg-05adaf452b268c335"]
instance_type = "t2.micro"</li>
</ul>
}
“`
•	Installing terraform Refer Here
•	Commands
•	choco install vscode terraform -y
 
Note:
•	Windows: Refer Here for installing necessary softwares
•	git
•	windows terminal for windows 10 Refer Here
•	Mac:
•	Homebrew Refer Here
•	git brew install git
•	visual studio code brew install --cask visual-studio-code
•	terraform brew install terraform
•	azure cli brew install azure-cli
Activity-2: Create a s3 bucket
•	Navigate to s3
 
 
 
 
 
•	Resource:
•	s3 bucket
•	inputs:
•	region
•	bucket name
Infra Provisioning using terraform.
•	Create an empty folder
•	Refer Here to provider docs
•	Refer Here for basic user creation steps and Refer Here
•	Lets find the resource
 
•	Refer Here for s3 resource
•	Now look at argument reference Refer Here of resource
•	Handling credenitals in AWS
•	install aws cli
•	aws configure
•	Refer Here for sample activity
Activity 3: Create a storge account in Azure
•	Refer Here for the official docs on how to create storage account
•	Resources:
•	Resource Group
•	inputs:
•	name
•	location
•	storage account
•	inputs:
•	resource group name
•	location
•	name of storage account
•	Refer Here for terraform provider
•	Refer Here to install azure cli az login
•	Refer Here for resource group docs and Refer Here for resource group docs
 
 
•	Refer Here for the changes
Terraform contd
•	Order of Creation: Order of creation can be acheived in two ways
•	explicit dependency using depends_on Refer Here
•	Refer Here for the usage
•	implicit dependency: Terraform figures out by looking at your configuration/template
•	When the output (attribute) of one resource is used as input (argument) to other
•	Refer Here for the changes
•	To use one resource in other resource argument <resource_type>.<name>
depends_on = [ azurerm_resource_group.myresg ]
Best Practice to write terraform template (Based on what we have covered so far)
•	Terraform reads all the .tf files in the folder and then combines as one file and executes the terraform => While writing terraform templates there is no need write everything in one file
•	From now one lets have one tf for provdier and then one tf file for logical group of resources.
•	All the variables will be in one file inputs.tf and all the outputs will be in the file outputs.tf
•	
 
•	Use terraform fmt to align the terraform template into common canonical format Refer Here for the changes done
Manual Steps for next activity
•	Azure
•	
 
•	AWS
 
Terraform contd
ntier network in Azure
•	Manual steps:
•	Create a resource group
•	Create a vnet Refer Here for screenshots
•	network: 10.10.0.0/16
•	subnets:
•	web: 10.10.0.0/24
•	app: 10.10.1.0/24
•	db: 10.10.2.0/24
 
•	Terraform implementation:
•	Refer Here for basic strucuture and terraform constraints added
•	Refer Here for resource definitions done
 
•	Refer Here for the variables added
•	To pass input variables we have two options
•	option 1: from cli directly using -var terraform apply -var 'resource_group_name=ntier-dev' -var 'location=eastus'
•	option 2: create a file with variable values Refer Here. Refer Here for the changes to accomodate ntier with tfvars
Terraform concepts
•	Terraform block: Refer Here.
•	Terraform block can help in setting provider requirements Refer Here as well as terraform requirements Refer Here.
•	There are other areas as well, which we will be discussing in later parts fo course
•	Version constraints: Refer Here
•	Data types: Refer Here
•	Terraform input variables Refer Here
Terraform contd
ntier network in AWS
•	Manual steps:
•	Create a vpc
•	network: 10.10.0.0/16 => 10.10.x.x ( 10.10.0.0 to 10.10.255.255)
 
 
•	
 
•	
 
•	Refer Here for the changes
 
•	After terraform apply we are observing three new files
•	.teraform.lock.hcl
•	terraform.tfstate
•	terraform.tfstate.backup
•	Lets add one subnet
•	cidr: 10.10.0.0/24 => 10.10.0.x => 10.10.0.0 to 10.10.0.255
•	name: web 1
 

 

 
•	Refer Here for the changes
 

•	Exercise: Try adding 5 more subnets
web2: 10.10.1.0/24
db1: 10.10.2.0/24
db2: 10.10.3.0/24
app1: 10.10.4.0/24
app2: 10.10.5.0/24
Concepts
•	Refer Here for terraform locals
•	Terraform works:
•	Terraform when applied tries to figure out a plan to make the desired state an actual state (terraform plan)
•	Terraform creates a file called as terraform.tfstate when it first creates some resource
•	Terraform stores the information about the created resources in a json format called as tfstate
•	terraform refresh updates the tfstate according to actual state
 


