I. Create a protected Master branch with followng controls?
- No one commits to Master directly
- Only reviewed pull requests are merged into master.

II. Configure a highly available httpd web application using Load Balancer?

III. Develop a Bash Script that does below?
- Poll for a file morning_feeds.csv in /opt location at 8:00 AM CST
- Send an email to vendor if the file is not received by 8:30 AM CST
- Send an email to Support Team (self) if the file is not received by 8:50 AM CST.
- Send an email to Business informing the delay in availability of feeds at 9:00 AM CST.
- Fail the Job if the feed is not received by 9:00AM
- Send a success email to support if the file is received.

IV. Create a following data center?
- 1 new VPC
- 2 Public Subnets
- 2 Private Subnets
- 1 Internate GateWay
- 1 Nat Gateway
- Install git in a machine that is in private subnet.

V. Create an endpoint from EC2 to S3.

VI. Create a Auto Scaling Group with below?
- Scales to 5 machines everyday at 8:00AM CST
- Scales down to 2 everyday at 7:00 PM CST
- Newly launched machines should be gets added automatically to target group that are tied to a Load Balancer.


VII. Develop a bash script that satisfies below?
- Reads an argument
- Verifies if that software is installed or not
- Skip if the software is already installed
- Install the software if not present

VIII. Create a CloudFormation Stack with below resources
- VPC
- Subnet
- Route
- Route Table
- EIP
- IGW

IX. Write an ansible-playbook to install the Jenkins application and change the port from 8080 to 80

X. Write a Maven Job in Jenkins using declarative pipeline

XI. Configure passwordless authentication between two machines.

XII. Install [ibm](https://developer.ibm.com/urbancode/plugin/jenkins/) plugin in Jenkins

XIII. Create a Multibranch pipeline in Jenkins
