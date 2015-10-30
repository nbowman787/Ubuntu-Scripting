#!/bin/bash
#Create a script that installs and configures bind to serve a private domain.
#Test if bind is installed, and install it if it is not installed.

named -v || apt-get install bind9

#Get a domain name from the script user. Complain and exit if the domain already exists.


read -p " Please provide a domain name " DOMAINNAME
if [ -e /etc/bind/db.$DOMAINNAME ]; then
    echo " domain already exisits, choose again. "
else 
    echo "     \$TTL    86400
@    IN    SOA   NS1.$DOMAINNAME. hostmaster.$DOMAINNAME. (
                   1        ; Serial
              604800        ; Refresh
               86400        ; Retry
             2419200        ; Expire
               86400 )    ; Minimum TTL
;
@    IN    NS    NS1.$DOMAINNAME.
NS1     IN  CNAME   $DOMAINNAME
NS1    IN    A    127.0.0.1
WWW    IN    A    192.168.47.91
MAIL    IN   A    192.168.59.5
        IN  MX      hostmaster.$DOMAINNAME.
" > /etc/bind/db.$DOMAINNAME
fi
echo "zone \"$DOMAINNAME\" {
        type master;
        file \"/etc/bind/db.$DOMAINNAME\";
};" >> /etc/bind/named.conf.local
#Create a zone file for the new domain.
#Use 127.0.0.1 as the IP address for the name ns1 in the new domain. Use that as the name of the nameserver for the domain.
#Add the name www with the address 192.168.47.91 to the domain.
#Add the name mail with the address 192.168.59.5 to the domain.
#Set the origin of the domain to be ns1 in the domain and the domain admin email to be hostmaster@thedomainname.

echo "
\$TTL    86400
@    IN    SOA    $DOMAINNAME. hostmaster.$DOMAINNAME. (
                   1        ; Serial
              604800        ; Refresh
               86400        ; Retry
             2419200        ; Expire
               86400 )    ; Minimum TTL
;
@	IN	NS	NS1.$DOMAINNAME.
91	IN	PTR	WWW.$DOMAINNAME.
" > /etc/bind/db.$DOMAINNAME.WWW

echo "
\$TTL    86400
@    IN    SOA    $DOMAINNAME. hostmaster.$DOMAINNAME. (
                   1        ; Serial
              604800        ; Refresh
               86400        ; Retry
             2419200        ; Expire
               86400 )    ; Minimum TTL
;
@	IN	NS	NS1.$DOMAINNAME.
5	IN	PTR	MAIL.$DOMAINNAME.
" > /etc/bind/db.$DOMAINNAME.MAIL

echo " zone \"47.168.192.in-addr.arpa\" {
        type master;
        file \"/etc/bind/db.$DOMAINNAME.WWW\";
};" >> /etc/bind/named.conf.local

echo " zone \"59.168.192.in-addr.arpa\" {
        type master;
        file \"/etc/bind/db.$DOMAINNAME.MAIL\";
};" >> /etc/bind/named.conf.local

echo "
name_servers=127.0.0.1
search_domains=\$DOMAINNAME
" >> /etc/init/resolvconf.conf

rndc reload

nslookup $DOMAINNAME localhost
#Create reverse zone files for the 192.168 addresses we have used.
#Add your new zones to the named.conf.local file if they aren't already there.
#Reload bind and test that nslookup successfully finds the new names using your private nameserver.


