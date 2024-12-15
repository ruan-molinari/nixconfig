{ pkgs
, myVars
, ...
}: {

  /* networking.nat = {
    enable = true;
    externalInterface = "eth0";
    internalInterfaces = [ "wg0" ];
    };

    networking.firewall = {
    allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
    };

    # Enable WireGuard
    networking.wireguard.interfaces = {
    # "wg0" is the network interface name. You can name the interface arbitrarily.
    wg0 = {
    # Determines the IP address and subnet of the client's end of the tunnel interface.
    ips = [ "10.2.0.2/32" ];
    listenPort = 51820; # to match firewall allowedUDPPorts (without this wg uses random port numbers)

    # This allows the wireguard server to route your traffic to the internet and hence be like a VPN
    # For this to work you have to set the dnsserver IP of your router (or dnsserver of choice) in your clients
    postSetup = ''
    ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.2.0.2/32 -o eth0 -j MASQUERADE
    '';

    # This undoes the above command
    postShutdown = ''
    ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.2.0.2/32 -o eth0 -j MASQUERADE
    '';

    # Path to the private key file.
    #
    # Note: The private key can also be included inline via the privateKey option,
    # but this makes the private key world-readable; thus, using privateKeyFile is
    # recommended.
    privateKeyFile = "/etc/protonvpn.key";

    peers = [
    # For a client configuration, one peer entry for the server will suffice.

    {
    # Public key of the server (not a file path).
    publicKey = "C3LgiID8tKOhXsu4Tyu8NMz5/WOWZoeZAY41Bybp5gM=";

    # Forward all the traffic via VPN.
    allowedIPs = [ "0.0.0.0/0" ];
    # Or forward only particular subnets
    #allowedIPs = [ "10.100.0.1" "91.108.12.0/22" ];

    # Set this to the server IP and port.
    endpoint = "146.70.98.162:51820"; # ToDo: route to endpoint not automatically configured https://wiki.archlinux.org/index.php/WireGuard#Loop_routing https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577

    # Send keepalives every 25 seconds. Important to keep NAT tables alive.
    persistentKeepalive = 25;
    }
    ];
    };
    }; */
}
