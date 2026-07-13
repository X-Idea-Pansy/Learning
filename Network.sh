# Problème VM: Error starting domain: Requested operation is not valid: network 'default' is not active

## Traceback (most recent call last):
##   File "/usr/share/virt-manager/virtManager/asyncjob.py", line 67, in cb_wrapper
##     callback(asyncjob, *args, **kwargs)
##     ~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
##   File "/usr/share/virt-manager/virtManager/asyncjob.py", line 101, in tmpcb
##     callback(*args, **kwargs)
##     ~~~~~~~~^^^^^^^^^^^^^^^^^
##   File "/usr/share/virt-manager/virtManager/object/libvirtobject.py", line 57, in newfn
##     ret = fn(self, *args, **kwargs)
##   File "/usr/share/virt-manager/virtManager/object/domain.py", line 1446, in startup
##     self._backend.create()
##     ~~~~~~~~~~~~~~~~~~~~^^
##   File "/usr/lib64/python3.14/site-packages/libvirt.py", line 1395, in create
##     raise libvirtError('virDomainCreate() failed')
## libvirt.libvirtError: Requested operation is not valid: network 'default' is not active
https://askubuntu.com/questions/1036297/cant-start-kvm-guest-network-default-is-not-active/1120132#1120132

root@doe:~# virsh net-list --all
 Name      State      Autostart   Persistent
----------------------------------------------
 default   inactive   yes         yes

root@doe:~# nmcli c delete virbr0
Connection 'virbr0' (0462f3c6-4090-44b8-bd52-7b65baf2c91c) successfully deleted.
root@doe:~# virsh net-start default
Network default started

root@doe:~# virsh net-list --all
 Name      State    Autostart   Persistent
--------------------------------------------
 default   active   yes         yes
