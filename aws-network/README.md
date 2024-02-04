# custom-infra-aws
custom aws infra using terraform

To create a customized infrastructure using user provided number of subnets, cidr range, region etc. 

## Usage
```
module aws-network {
    source = "git::https://github.com/itisdeep/tf-modules.git//aws-network"

    env = "prod"   ##name of the environment
    app_name = "myapp"  ##application name
    region = "us-west-2"  ##region
    vpc_cidr = "10.0.0.0/16" #Vpc cidr
    private_subnet_count = 2  
    public_subnet_count = 2
}
```