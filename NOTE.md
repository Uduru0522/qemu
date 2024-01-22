### TODO
- [ ] Modify `hmp_info_balloon()` in `/hw/core/machine-hmp-cmds.c` to support per-node ballooning info displaying
- [ ] Modify `hmp_balloon()` in `/hw/core/madhine-hmp-cmds.c` to support per-node ballooning

### Function explaination
+ `balloon_event_fn()` is assigned with some other function (typycally `virtio_balloon_to_target`), used to handle ballooning events. When `balloon <node>` is called in monitor, this function is called 
+ `virtio_notify_config()` notifies guest about config update
+ `MachineState *machine = MACHINE(qdev_get_machine());` Can be used to access machine info
  - Within `hw/core/qdev.c`

### Modifications
+ in virtio-balloon.h, added field in `struct VirtIOBalloon` such that it contains information about NUMA arch