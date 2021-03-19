# vpn_jenkins


```
cd terraform/settings
ssh-keygen -f openvpn -t rsa


./terraform-bootstrap.sh
./terraform-apply.sh ireland
```


```
brew install openvpn
sudo brew services start openvpn

export PATH=$(brew --prefix openvpn)/sbin:$PATH

sudo openvpn --config generated/ovpn-config/admin.ovpn 

```