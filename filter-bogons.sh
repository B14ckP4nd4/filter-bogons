yum install ipset -y
sudo ipset create bogons nethash
sudo ipset --add bogons 0.0.0.0/8
sudo ipset --add bogons 10.0.0.0/8
sudo ipset --add bogons 100.64.0.0/10
sudo ipset --add bogons 127.0.0.0/8
sudo ipset --add bogons 169.254.0.0/16
sudo ipset --add bogons 172.16.0.0/12
sudo ipset --add bogons 192.0.0.0/24
sudo ipset --add bogons 192.0.2.0/24
sudo ipset --add bogons 192.168.0.0/16
sudo ipset --add bogons 198.18.0.0/15
sudo ipset --add bogons 198.51.100.0/24
sudo ipset --add bogons 203.0.113.0/24
sudo ipset --add bogons 224.0.0.0/3

sudo iptables -A INPUT -m set --match-set bogons src -j DROP
sudo iptables -A INPUT -m set --match-set bogons dst -j DROP

sudo iptables -A FORWARD -m set --match-set bogons src -j DROP
sudo iptables -A FORWARD -m set --match-set bogons dst -j DROP

sudo iptables -L 
sudo ipset list