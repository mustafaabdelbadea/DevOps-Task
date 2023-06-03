# DevOps-Task


## Create infrastructure pipeline to run terraform with jenkins

- Create ansible script to configure application ec2(private)
- Configure ansible to run over private ips through bastion (~/.ssh/config)
- Write ansible script to configure ec2 to run  as jenkins slaves
- Configure slave in jenkins dashboard (with private ip)
- Create pipeline to deploy nodejs_example from branch (rds_redis)
- Add application load balancer to your terraform code to expose your nodejs app on port 80 on the load balancer
- Test your application by calling loadbalancer_url/db and /redis
- Create documentation illustrating your steps with screenshots

<!-- Deploy jenkins on eks with dynamic jobs
https://aws.amazon.com/blogs/devops/orchestrate-jenkins-workloads-using-dynamic-pod-autoscaling-with-amazon-eks/ -->
-----------------------------------------


1-run terraform code from jenkins: 
    - when build now --> terraform apply 
    

2- Create ansible script to configure private ec2 to be jenkins slave 

3- Connect jenkins dashboard as slave --> coneect slave through private ip (By downloading jar file and configure it )

4- Create new pipeline to deploy nodejs application from (rds_redis)

5- Create application load balancer and point to the private ec2 instance |-- 





-----------------------------

<!-- install aws plugin 
install terraform plugin
install docker pipeline plugin
install slack plugin



in jenkins

ssh -i /var/jenkins_home/key.pem  ubuntu@172.0.4.16 -o StrictHostKeyChecking=accept-new  -o ProxyCommand="ssh -i /var/jenkins_home/key.pem -p 22 -W %h:%p -q ubuntu@44.200.131.150 -o StrictHostKeyChecking=accept-new"  exec java -jar ~/bin/agent.jar -->
