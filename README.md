# vpn-proxy
Docker container with squid proxy and openvpn client.

The container is listening on port 3128. So you can use the container to route only specific traffic through a vpn.

Therefore you might want to use a proxy.pac as system wide proxy. (Example provided in this repo)

## Usage with shell script (and zenity)
#### Note about DNS inside the container
I have no clue how to automatically get the correct dns entries within the /etc/resolv.conf.
So I use my workaround to provide the correct dns entries an the start of the container.

    --dns=1.2.3.4

#### Starting the container and connecting to vpn
Provide an openvpn configuration file. 
Please put the key file (if available) in the same directory an reference it within the config file.
Make the shell script executable and put into your ```$HOME/bin``` dir to run the script from everywhere. (Tested on Linux Mint)

Run the shell script. 

    vpn

#### Disconnecting from vpn and stopping the container
Simply run the shell script again.

    vpn

## Usage with docker only
#### Starting the container and connecting to vpn
First start the container.

    docker run -d --cap-add=NET_ADMIN \
             --device /dev/net/tun \
             --name openvpn \
             -v $DIR:/vpn \
             -p "3128:3128" \
             --dns=8.8.4.4 \
             --dns=8.8.8.8 \
             --dns=192.168.22.1 \
             --dns=192.168.22.3 \
        tsari/openvpn
    
If the container already exist start it with.
    
    docker start openvpn
    
Then start the openvpn client within the running container.

    docker exec -it openvpn openvpn --cd /vpn --config /vpn/YOUR_CONFIG_FILE

#### Disconnecting from vpn and stopping the container
Simply use ```ctrl+c``` and ```docker stop openvpn``` afterwards.

# Postscriptum
I know there might be better ways to achieve the goal getting an open vpn client running in a squid container. But this works for me. You don't have to use it ;)

