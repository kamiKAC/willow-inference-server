### Task

Setup ASG with ALB from scratch using terraform code. Review created resources
in AWS console.

Tasks:
- Update the username variable in terraform.tfvars
- Provide userdata to install nginx and start the service
- run terraform apply
- Check the DNS name of ALB and make sure the NGINX is up and running
- Login using SSM to the EC2 and stress the processor to trigger
    auto-scaling. 
- Mount EFS on the file system using [AWS Guide](https://docs.aws.amazon.com/efs/latest/ug/mounting-fs.html)
- Install and configure AWS CloudWatch Agent
- Add above two steps to userdata. Add customized html index page for nginx.
- Trigger instance refresh in ASG an check if the website reloaded with your
    name and if the logs appear in CloudWatch Logs
- Create AMI based on this [AWS Guide](https://docs.aws.amazon.com/toolkit-for-visual-studio/latest/user-guide/tkv-create-ami-from-instance.html)
- Remove all the steps from bootstrap, except EFS mount. Trigger instance
    refresh
- Remove all resources using terraform destroy.
- Delete AMI

