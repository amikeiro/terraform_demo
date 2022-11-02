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
