# workstation-terraform

Login to AWS CLI\
aws configure\
aws s3api create-bucket --bucket karthi-bucket2025 --region us-east-1

sudo dnf install ansible
ansible-playbook -i localhost, -e ansible_user=ec2-user -e ansible_password=DevOps321 main.yml -e role_name=github-runner
```
fdisk /dev/xvda \
pvcreate /dev/xvda5 \
vgextend RootVg /dev/xvda5 \
lvextend -L +10G /dev/RootVg/rootVol \
xfs_growfs /dev/RootVG/rootVol

---
`````
sudo growpart /dev/xvda 4
sudo partprobe /dev/xvda
sudo lvextend -L 28G /dev/RootVG/homeVol
``````
```
aws iam remove-role-from-instance-profile --instance-profile-name vault-profile --role-name vault-role
aws iam remove-role-from-instance-profile --instance-profile-name ec2-profile --role-name ec2-role
aws iam remove-role-from-instance-profile --instance-profile-name grunner-profile --role-name grunner-role
aws iam detach-role-policy --role-name grunner-role  --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
aws iam detach-role-policy --role-name ec2-role  --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
aws iam detach-role-policy --role-name vault-role  --policy-arn arn:aws:iam::aws:policy/AdministratorAcces

aws iam delete-role --role-name grunner-role
aws iam delete-role --role-name ec2-role
aws iam delete-role --role-name vault-role

````