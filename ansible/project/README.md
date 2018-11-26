# Sample Ansible Project
## Description
- This will launch two RHEL and an Ubuntu Machine.
- Installs Httpd web server and Nginx as a loadbalancer

## Usage
### Pre-requisites
- Copy the Ansible control machine's key into AWS.
- Update inbound rules of Default Security Group in AWS by allowing traffic on port 80.
- If not using default vpc, consider creating a public subnet and enable public IP assignments.

### Execution
`ansible-playbook configure-infra.yml -e "SECRET=FWMNt********9jEz1"`
  <details><summary>Output</summary>
    <p>

    ```
    
    PLAY [Installing boto in Controller Machine] ***********************************

    TASK [Gathering Facts] *********************************************************
    ok: [localhost]

    TASK [Installing pip] **********************************************************
    ok: [localhost]

    TASK [Installing Boto] *********************************************************
    ok: [localhost]

    PLAY [Launching an EC2 machine] ************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [localhost]

    TASK [Launching an EC2 Machine for Nginx Loadbalancer] *************************
    changed: [localhost]

    TASK [Updating the Hosts file with Nginx Private IP] ***************************
    changed: [localhost] => (item={u'ramdisk': None, u'kernel': None, u'root_device_type': u'ebs', u'private_dns_name': u'ip-172-31-39-141.ec2.internal', u'block_device_mapping': {u'/dev/sda1': {u'status': u'attached', u'delete_on_termination': True, u'volume_id': u'vol-036d7f5b9b513322b'}}, u'key_name': u'AwsKamalayKey', u'public_ip': u'54.211.36.28', u'image_id': u'ami-009307dd5dee4e17b', u'tenancy': u'default', u'private_ip': u'172.31.39.141', u'groups': {u'sg-0fdac647': u'default'}, u'public_dns_name': u'ec2-54-211-36-28.compute-1.amazonaws.com', u'state_code': 16, u'id': u'i-0141c9d89a2900c71', u'tags': {u'Name': u'nginx-loadbalancer'}, u'placement': u'us-east-1c', u'ami_launch_index': u'0', u'dns_name': u'ec2-54-211-36-28.compute-1.amazonaws.com', u'region': u'us-east-1', u'ebs_optimized': False, u'launch_time': u'2018-11-26T04:32:53.000Z', u'instance_type': u't2.micro', u'state': u'running', u'architecture': u'x86_64', u'hypervisor': u'xen', u'virtualization_type': u'hvm', u'root_device_name': u'/dev/sda1'})

    TASK [Launching Two EC2 machines for mysite website] ***************************
    changed: [localhost]

    TASK [Updating Hosts file with private IPs of webservers] **********************
    changed: [localhost] => (item={u'ramdisk': None, u'kernel': None, u'root_device_type': u'ebs', u'private_dns_name': u'ip-172-31-34-84.ec2.internal', u'block_device_mapping': {u'/dev/sda1': {u'status': u'attached', u'delete_on_termination': True, u'volume_id': u'vol-0689c69f0aab3f83c'}}, u'key_name': u'AwsKamalayKey', u'public_ip': u'52.90.240.121', u'image_id': u'ami-6871a115', u'tenancy': u'default', u'private_ip': u'172.31.34.84', u'groups': {u'sg-0fdac647': u'default'}, u'public_dns_name': u'ec2-52-90-240-121.compute-1.amazonaws.com', u'state_code': 16, u'id': u'i-0bdd50dee87f1d0eb', u'tags': {u'Name': u'mysite-webserver'}, u'placement': u'us-east-1c', u'ami_launch_index': u'0', u'dns_name': u'ec2-52-90-240-121.compute-1.amazonaws.com', u'region': u'us-east-1', u'ebs_optimized': False, u'launch_time': u'2018-11-26T04:33:15.000Z', u'instance_type': u't2.micro', u'state': u'running', u'architecture': u'x86_64', u'hypervisor': u'xen', u'virtualization_type': u'hvm', u'root_device_name': u'/dev/sda1'})
    changed: [localhost] => (item={u'ramdisk': None, u'kernel': None, u'root_device_type': u'ebs', u'private_dns_name': u'ip-172-31-41-185.ec2.internal', u'block_device_mapping': {u'/dev/sda1': {u'status': u'attached', u'delete_on_termination': True, u'volume_id': u'vol-0ae435d4dbdf3f78f'}}, u'key_name': u'AwsKamalayKey', u'public_ip': u'34.227.98.48', u'image_id': u'ami-6871a115', u'tenancy': u'default', u'private_ip': u'172.31.41.185', u'groups': {u'sg-0fdac647': u'default'}, u'public_dns_name': u'ec2-34-227-98-48.compute-1.amazonaws.com', u'state_code': 16, u'id': u'i-0e799062ee9180854', u'tags': {u'Name': u'mysite-webserver'}, u'placement': u'us-east-1c', u'ami_launch_index': u'1', u'dns_name': u'ec2-34-227-98-48.compute-1.amazonaws.com', u'region': u'us-east-1', u'ebs_optimized': False, u'launch_time': u'2018-11-26T04:33:15.000Z', u'instance_type': u't2.micro', u'state': u'running', u'architecture': u'x86_64', u'hypervisor': u'xen', u'virtualization_type': u'hvm', u'root_device_name': u'/dev/sda1'})

    PLAY RECAP *********************************************************************
    localhost                  : ok=8    changed=4    unreachable=0    failed=0
    
    ```

    </p>
    </details>

`ansible-playbook -i hosts configure-mysite.yml`

`ansible-playbook -i hosts configure-nginx.yml`
