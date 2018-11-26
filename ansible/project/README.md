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

`ansible-playbook -i hosts configure-mysite.yml`

`ansible-playbook -i hosts configure-nginx.yml`
