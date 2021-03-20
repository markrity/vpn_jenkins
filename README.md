# vpn_jenkins


### At terraform settings folder , generate a ssh key that will be used at ec2 instances.
```bash
cd terraform/settings
ssh-keygen -f openvpn -t rsa
```

### Then perform an init and apply terraform.
```bash
./terraform-bootstrap.sh
./terraform-apply.sh ireland
```
It will create an instace with openvpn with users provisioned.
`ovpn` files for each user will be stored at `generated` folder.
It will also create an ec2 instace that will be accessible for SSH and 8080,
If you have problems accessing from SSH , there might be an issue provisioning security group with your IP as access.
So you can add your IP simply from UI to right security group , that has a name of jenkins.
### There is another `README.md` at `jenkins` folder, that describes how to install jenkins on that ec2 instance.


### To connect to openvpn , to be able to communicate with internal ips of VPC
```
brew install openvpn
sudo brew services start openvpn

sudo openvpn --config generated/ovpn-config/admin.ovpn 
```
If you have issues using openvpn add to your path: `export PATH=$(brew --prefix openvpn)/sbin:$PATH`

