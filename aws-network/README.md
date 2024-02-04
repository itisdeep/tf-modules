# custom-infra-aws
custom aws infra using terraform

To create a customized infrastructure using user provided number of subnets, cidr range, region etc. 

## Usage
```
module aws-network {
    source = "git::https://github.com/itisdeep/tf-modules.git//aws-network"
}
```