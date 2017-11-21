# This document contains a list of alternative DNS servers.
______________________________________________________________

# AdGuard DNS (beta)

# Default mode (ad & trackers blocking):
nameserver 176.103.130.130
nameserver 176.103.130.131
nameserver 2a00:5a60::ad1:0ff
nameserver 2a00:5a60::ad2:0ff

# Family protection (default + blocking adult websites + enforcing safe search):
nameserver 176.103.130.132
nameserver 176.103.130.134
nameserver 2a00:5a60::bad1:0ff
nameserver 2a00:5a60::bad2:0ff

# Yandex DNS

# Basic Yandex.DNS - Quick and reliable DNS
nameserver 77.88.8.8
nameserver 77.88.8.1
nameserver 2a02:6b8::feed:0ff
nameserver 2a02:6b8:0:1::feed:0ff

# Safe Yandex.DNS - Protection from virus and fraudulent content
nameserver 77.88.8.88
nameserver 77.88.8.2
nameserver 2a02:6b8::feed:bad
nameserver 2a02:6b8:0:1::feed:bad

# Family Yandex.DNS - Without adult content
nameserver 77.88.8.7
nameserver 77.88.8.3
nameserver 2a02:6b8::feed:a11
nameserver 2a02:6b8:0:1::feed:a11

# Uncensored DNS
# censurfridns.dk IPv4 nameservers
nameserver 91.239.100.100
nameserver 89.233.43.71
nameserver 2001:67c:28a4::
nameserver 2a01:3a0:53:53::

# Norton ConnectSafe DNS

# Policy A — Security This policy blocks all sites hosting malware, phishing sites, and scam sites. To choose Policy A, use the following IP addresses as preferred and alternate DNS server addresses:
nameserver 199.85.126.10
nameserver 199.85.127.10

# Policy B — Security + Pornography In addition to blocking unsafe sites, this policy also blocks access to sites that contain sexually explicit material. To choose Policy B, use the following IP addresses as preferred and alternate DNS server addresses:
nameserver 199.85.126.20
nameserver 199.85.127.20

# Policy C — Security + Pornography + Non-Family Friendly This policy is ideal for families with young children. In addition to blocking unsafe sites and pornography sites, this policy also blocks access to sites that feature mature content, abortion, alcohol, crime, cults, drugs, gambling, hate, sexual orientation, suicide, tobacco, or violence. To choose Policy C, use the following IP addresses as preferred and alternate DNS server addresses
nameserver 199.85.126.30
nameserver 199.85.127.30

# DNS Advantage
# Reliability & Performance 1
nameserver 156.154.70.1 
nameserver 156.154.71.1	
nameserver 2610:a1:1018::1 
nameserver 2610:a1:1019::1

# Reliability & Performance 2
nameserver 156.154.70.5 
nameserver 156.154.71.5
nameserver 2610:a1:1018::5 
nameserver 2610:a1:1019::5

# Threat Protection Malware, Ransomware, Spyware & Phishing
nameserver 156.154.70.2 
nameserver 156.154.71.2	
nameserver 2610:a1:1018::2 
nameserver 2610:a1:1019::2

# Family Secure As above + Gambling, Pornography, Violence & Hate/Discrimination
nameserver 156.154.70.3 
nameserver 156.154.71.3	
nameserver 2610:a1:1018::3 
nameserver 2610:a1:1019::3

# Business Secure As above + Gaming, Adult, Drugs, Alcohol & Anonymous Proxies
nameserver 156.154.70.4 
nameserver 156.154.71.4	
nameserver 2610:a1:1018::4 
nameserver 2610:a1:1019::4

# Comodo DNS

# Comodo nameservers
nameserver 8.26.56.26
nameserver 8.20.247.20

# DNS.WATCH DNS

# dns.watch IPv4 nameservers
nameserver 84.200.69.80
nameserver 84.200.70.40

# Quad9 DNS

Secure IPv4: 9.9.9.9  # Blocklist, DNSSEC, No EDNS Client-Subnet
Unsecure IPv4: 9.9.9.10  # No blocklist, no DNSSEC, send EDNS Client-Subnet
Secure IPv6: 2620:fe::fe  # Blocklist, DNSSEC, No EDNS Client-Subnet
Unsecure IPv6: 2620:fe::10  # No blocklist, no DNSSEC, send EDNS Client-Subnet

# OpenNIC DNS

# OpenNIC IPv4 nameservers (Worldwide Anycast)
nameserver 185.121.177.177
nameserver 185.121.177.53
# OpenNIC IPv6 nameservers (Worldwide Anycast)
nameserver 2a05:dfc7:5::53
nameserver 2a05:dfc7:5::5353

# Cisco Umbrella DNS

# OpenDNS IPv4 nameservers
nameserver 208.67.222.222
nameserver 208.67.220.220
# OpenDNS IPv6 nameservers
nameserver 2620:0:ccc::2
nameserver 2620:0:ccd::2

# Google DNS

# Google IPv4 nameservers
nameserver 8.8.8.8
nameserver 8.8.4.4
# Google IPv6 nameservers
nameserver 2001:4860:4860::8888
nameserver 2001:4860:4860::8844
