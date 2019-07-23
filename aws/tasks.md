1. Create a launch configuration template and spin up a machine by using the template.
2. Create a VPC with 4 subnets (2 in public, 2 in private), Create and update the Routes, Create IGW and assign it to Public Subnets, Create a NAT GW and assign it to Private Subnets.  Install GIT in a machine that is in Private subnet.
Taking help from - https://www.site24x7.com/tools/ipv4-subnetcalculator.html
3. Implement connectivity between two VPCs.
4. Create an Image from a running machine.  
5. Backup the machine and create a snapshot retention policy.
6. Generate a new key pair locally and use it to connect to new machines.
7. Generate a new Elastic IP, and switch it between two machines.
8. Write Access Control Lists to prevent connectivity to your application from one particular IP or range.
9. Create an Auto Scaling Group that would increases machine count from 1 to 3 at 7 AM CST, and remove 2 machines at 7 PM.
10. Create a highly available website by using Elastic Load Balancer.
11. Create two websites using same load Balancer with different ports.
12. I want my website to be running on min 4 machines, every though I terminate the instances, they should come automatically.
13. Create an user and give him programatic way to access S3 services with read only privileges.
14. I want one group of peopel just to have a read only access to EC2 only.
15. Setup an EC2 machine to access my data in bucket without authentication.
16. Install and configure AWS-CLI in RHEL and Ubuntu Machines.
17. Create a bucket policy to prevent anyone from deleting the bucket.
18. I want users from HR group to have access on HR object only in my S3.
19. I want users from Finanace group should access Finance object only in my S3.
20. Setup a static website using S3.
21. I want my files in S3 to move to Glacier after 30 days.
22. Configure EC2 Cloud with Jenkins and run a job in one of the cloud agent.
23. Copy a file in S3 from Jenkins using awscli
24. Mount an additional 2 GB EBS volume to a machine and ensure it gets attached after reboot too.
25. Unmount above attached volume and mount it to another machine without loosing the data.
26. Create a NFS file system and attach it permanentely to two machines.
27. Create topics in SNS and subscribe an email to it
28. Configure CPU Utilization Alarm and perform a stress test to prove it works
29. Create a Dashboard to show all running EC2 machines CPU Usage in one place
30. Create an Event rule to trigger an email if an EC2 machine goes down
31. Configure one RHEL and AWS Linux machine to send systemlogs to CloudWatch.  Install httpd in both machines and observe the logs in CloudWatch
