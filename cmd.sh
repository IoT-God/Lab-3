# setup firewall
sudo apt install ufw
sudo ufw allow OpenSSH
sudo ufw allow from 10.0.0.0/24 proto tcp to any port 65432
sudo ufw enable
sudo ufw status
<< ufw-status
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere                  
65432/tcp                  ALLOW       10.0.0.0/24               
OpenSSH (v6)               ALLOW       Anywhere (v6)     
ufw-status

# setup wireshark
sudo apt install wireshark

# wireless configuration
ifconfig
<< ifconfig
eth0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        ether d8:3a:dd:9d:89:af  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 23050  bytes 9668404 (9.2 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 23050  bytes 9668404 (9.2 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlan0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.0.7  netmask 255.255.255.0  broadcast 10.0.0.255
        inet6 2601:240:8301:7a00::61f1  prefixlen 128  scopeid 0x0<global>
        inet6 2601:240:8301:7a00:a234:da52:c128:fbfa  prefixlen 64  scopeid 0x0<global>
        inet6 fe80::735a:f957:a987:7fe8  prefixlen 64  scopeid 0x20<link>
        ether d8:3a:dd:9d:89:b0  txqueuelen 1000  (Ethernet)
        RX packets 122852  bytes 135754467 (129.4 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 35585  bytes 12097676 (11.5 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
ifconfig

iwconfig
<< iwconfig
lo        no wireless extensions.

eth0      no wireless extensions.

wlan0     IEEE 802.11  ESSID:"finally!"  
          Mode:Managed  Frequency:5.22 GHz  Access Point: 2C:7E:81:04:08:EA   
          Bit Rate=433.3 Mb/s   Tx-Power=31 dBm   
          Retry short limit:7   RTS thr:off   Fragment thr:off
          Power Management:on
          Link Quality=62/70  Signal level=-48 dBm  
          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
          Tx excessive retries:4  Invalid misc:0   Missed beacon:0
iwconfig

sudo iwlist wlan0 scan >> iwlist
# check iwlist file, cell 14

# reduce tx power to 25
iwconfig wlan0 txpower 25
iwconfig wlan0 
<< iwconfig
wlan0     IEEE 802.11  ESSID:"finally!"  
          Mode:Managed  Frequency:5.22 GHz  Access Point: 2C:7E:81:04:08:EA   
          Bit Rate=433.3 Mb/s   Tx-Power=25 dBm   
          Retry short limit:7   RTS thr:off   Fragment thr:off
          Power Management:on
          Link Quality=61/70  Signal level=-49 dBm  
          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
          Tx excessive retries:8  Invalid misc:0   Missed beacon:0
iwconfig