**I. Create a complete workflow?**
1. Once I commit into Git, the job in jenkins should start.
2. The Job should create an ephemeral agent in AWS
3. Run the Job on that newly created EC2 Agent
4. Generate the Test Results
5. Execute the Maven Build
6. Archive the Artifacts
7. Sends an email once the job completes.

**II. Create a protected Master branch with followng controls?**
1. No one commits to Master directly
2. Only reviewed pull requests are merged into master.

**III. Configure a highly available httpd web application using Load Balancer?**


**IV. Develop a Bash Script that does below?**
1. Poll for a file `morning_feeds.csv` in `/opt` location at 8:00 AM CST
2. Send an email to vendor if the file is not received by 8:30 AM CST
3. Send an email to Support Team (self) if the file is not received by 8:50 AM CST.
4. Send an email to Business informing the delay in availability of feeds at 9:00 AM CST.
5. Fail the Job if the feed is not received by 9:00AM
6. Send a success email to support if the file is received.

**V. Create a following data center?**
1. a new VPC
2. 2 Public Subnets
3. 2 Private Subnets
4. 1 Internate GateWay
5. 1 Nat Gateway
6. Install git in a machine that is in private subnet.


**VI. Create a Auto Scaling Group with below?**
1. Scales to 5 machines everyday at 8:00AM CST
2. Scales down to 2 everyday at 7:00 PM CST
3. Newly launched machines should be gets added automatically to target group that are tied to a Load Balancer.

**VII. Develop a bash script that satisfies below?**
1. Reads an argument
2. Verifies if that software is installed or not
3. Skip if the software is already installed
4. Install the software if not present

**VIII. Configure a MultiBranch Pipeline?**

**IX. Copy a file in S3 using Jenkins Pipeline?**

**X. Create a policy that gives user access to one particular folder in S3 bucket?**

**XI. Attach and configure an EFS accessible in two machines, the mount should be connected even after server restart?**

**XII. Mount a 2 GB EBS volume to a machine?**

**XIII. Write a Jenkins Pipeline to satisfy below?**
1.Send an email to Manager to approve or reject the deployment
2.Upon approval, the file must be deployed to one of the Linux machine.
3.Kill the build if the manager don't take any action within 30 mins.


**XIV. Migrate a repo?**
1. create a repo with some files in a repo called `source`
2. create another empty repo called `target`
3. Push the source repo data and history to target repo.

**XV. Configure a email notification whenenver my machine is in stopped status?**
