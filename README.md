# DevOps-Task


*- Create infrastructure pipeline to run terraform with jenkins
task
Create ansible script to configure application ec2(private)
8- configure ansible to run over private ips through bastion (~/.ssh/config)
9- write ansible script to configure ec2 to run  as jenkins slaves
9- configure slave in jenkins dashboard (with private ip)
10- create pipeline to deploy nodejs_example fro branch (rds_redis)
11- add application load balancer to your terraform code to expose your nodejs app on port 80 on the load balancer
12- test your application by calling loadbalancer_url/db and /redis
13- create documentation illustrating your steps with screenshots
-----------------------------------------


1-run terraform code from jenkins: 
    - when build now --> terraform apply 

2- Create ansible script to configure private ec2 to be jenkins slave 

3- Connect jenkins dashboard as slave --> coneect slave through private ip (By downloading jar file and configure it )

4- Create new pipeline to deploy nodejs application from (rds_redis)

5- Create application load balancer and point to the private ec2 instance 