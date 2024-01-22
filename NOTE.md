### TODO
- [ ] Modify QEMU command `hmp_info_balloon` to display balloon info on a node basis
  - [ ] Modify entry for `hmp_info_balloon()` in `/hmp-commands-info.hx`
  - [ ] Modify `hmp_info_balloon()` in `/hw/core/machine-hmp-cmds.c` to support per-node ballooning info displaying
  - [ ] Modify `qmp_query_balloon()` in `/system/balloon.c` to return balloon info containing per-node information
    - [ ] Modify entry for `struct BalloonInfo` in `/qapi/machine.json` to provide field for per-node info
    - [ ] Modify `balloon_stat_fn()` (assigned to `virtio_balloon_stat()` by `qemu_add_balloon_handler()`) in `/hw/virtio/virtio-balloon.c` and `/system/balloon.c` to obtain per-node info 
      - [ ] Modify `get_current_ram_size()` to support passing node id to obtain node-specific ram size
- [ ] Modify `hmp_balloon()` in `/hw/core/madhine-hmp-cmds.c` to support per-node ballooning

### Function explaination
+ `balloon_event_fn()` is assigned with some other function (typycally `virtio_balloon_to_target`), used to handle ballooning events. When `balloon <node>` is called in monitor, this function is called 
+ `virtio_notify_config()` notifies guest about config update
+ `MachineState *machine = MACHINE(qdev_get_machine());` Can be used to access machine info
  - Within `hw/core/qdev.c`

### Modifications
+ in virtio-balloon.h, added field in `struct VirtIOBalloon` such that it contains information about NUMA arch