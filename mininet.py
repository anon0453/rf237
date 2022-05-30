#!/user/bin/python
from mininet.net import Mininet
from mininet.node import Controller
from mininet.cli import CLI
from mininet.link import TCLink
from mininet.log import setLogLevel, info
from mininet.node import OVSKernelSwitch, RemoteController

net = Mininet(topo = None, build=False)  
net.addController(name='c0',controller=RemoteController,ip='172.16.2.186',port=6633)
s1 = net.addSwitch('s1', protocols='OpenFlow13')
h1 = net.addHost('h1')
h2 = net.addHost('h2')
net.addLink(h1, s1, cls=TCLink, bw=1, delay='1ms')
net.addLink(h2, s1, cls=TCLink, bw=1, delay='1ms')
net.start()
CLI(net)
net.stop()





