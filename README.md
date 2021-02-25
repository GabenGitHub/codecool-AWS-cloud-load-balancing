# Cloud Load Balancing

## Story

_Here we go again!_ Your mentors wants you and your team to setup a load balancing scenario ... _again_. _Haven't we got tired of this already?_ you may ask ... but no, not just yet! :)

## What are you going to learn?

- How to use Amazon (Application) Load Balancer
- Create LB listeners/target groups
- Secure your backends using security groups
- Monitor the health of targets using CloudWatch

## Tasks

1. Create an EC2 instance for each team member and host a simple website on it.
    - Started as many EC2 instances as many members are in the team
    - Ubuntu Server 18.04 LTS is used as the OS for the EC2 instances
    - Used the same key pair to start each EC2 instance (each team member has access to the related private key)
    - Each team member started a simple webserver on the _same_ TCP port (it can be any port, e.g. 3000, 8000, etc.)
    - Each instance is started in the same security group
    - Incoming SSH traffic is allowed from any source IP
    - Incoming HTTP traffic is allowed _only_ on the port the webserver are listening on from the load balancer's security group

2. Create a _target group_ that's going to be the logical grouping of your backend servers and assign them to be part of it.
    - _Instance_ target type is choosen
    - Named the target group using the team number (e.g. _Team 4_)
    - The default VPC is used
    - HTTP (protocol version _HTTP1_) is choosen
    - The port where the team's webservers are running on is used (e.g. 3000, 8000, etc.)
    - Automatic HTTP health checks are configured using the _traffic_ port on  path `/`
    - Set _Health threshold_, _Unhealthy threshold_ and _Timeout_ each to _2 seconds_ and _Interval_ to _5 seconds_
    - Health checks are considered to be _successful_ when a 200 HTTP status code is returned by a backend server
    - Registered each team member's EC2 instance as a _target_ (you can leave the group empty and add targets later if you wish)

3. Create an _Application Load Balancer_ in front of the backend servers your team has created.
    - Created an _Application Load Balancer_
    - Used the team number (e.g. Team 65) when naming the load balancer
    - Created an _internet-facing_ load balancer
    - Choosen IPv4 as the address type of load balancer
    - Configured an HTTP listener on port 80 (this is where the ALB will listen to requests)
    - All availability zones are enabled for the load balancer
    - Created a new security group for the load balancer (naming it using the team number) which only allows incoming traffic on port 80 from all sources
    - Associated the previously created target group with the load balancer (you could create a new target group at this point if you wish)
    - Found and noted down the DNS name of the ALB
    - `curl http://YOURALBDOMAIN` displays the contents of a different team member's website

## General requirements

- Tag every resource with _Name_ and use your team number as the value (e.g. _Team 12_)

## Hints

- Monitor your load balancer/targets health using CloudWatch (you can also configure the load balancer to publish its _access logs_ an Amazon S3 bucket for inspection)
- As an extra try and configure a different port/path and/or HTTP status code combination for health checks
- For an even greater challenge use AWS CLI to automate your ALB/target group setup from a shell script!
- Using HTTP isn't considered to be a secure solution, if you'd like an extra challenge switch your setup to use HTTPS instead

## Background materials

- [Target group types](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#target-type)
- [CloudWatch metrics](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-cloudwatch-metrics.html#view-metric-data)
- [ALB access logs](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-access-logs.html#enable-access-logging)
