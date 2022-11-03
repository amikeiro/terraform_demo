# terraform_demo
demo repository for testing and replicating terraform infrustructure set up and accesses

This documentation illustrates the components, structure, and modules of a terraform package to launch infrustructure in several environments. 

- Components

1- Resource Groups
2- 

- Environments

1- Development (Dev)
2- Production (Prod)


Code Structure

Backend
- main.tf
- provider.tf
- variables.tf

Virtual datacenter overview
Topologies
A virtual datacenter can be built using one of these high-level topologies, based on your needs and scale requirements:

In a Flat topology, all resources are deployed in a single virtual network. Subnets allow for flow control and segregation.


How to apply the infrastructure to Azure? 
First, go to the terminal and navigate to the folder where you have your terraform main.tf file. At this point, you can initiate terraform by running "terraform init". Next, you should plan the reources you want to deploy. The command for this is "terraform plan". But, in this instance we have defined two environments, therefore two files with vars from dev and prod. In this case, we need to specify which subscription we want to deploy (it could be the case that we did not have different subscription, therefore no need for this specification.). We specify it by this command in terminal "terraform plan --var-file="vars/dev.tfvars". After pressing enter, if there are no issues, we will get the Plan in the terminal specifying how mainly resources will be added, changed, or destroyed. 

If we are satisfied with the plan, we can proceed to apply. The simple command is "terraform apply", but as earlier, we need to specify subscription/environment, therefore "terraform apply --var-file="vars/dev.tfvars".


