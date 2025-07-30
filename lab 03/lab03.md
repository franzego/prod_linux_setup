# 🗂️ Day 06: Disk Partitioning, Filesystems, and Mounting

## ✅ Objectives
- Create a virtual disk using a loopback file
- Format it with a filesystem
- Mount it temporarily and persistently
- Create and enable a swap file

---

## 🔧 Task 1: Create Loopback Disk

### ✅ What I Did
- Created `storage.img` with `dd`
- Attached it with `losetup`
- Verified the device (e.g., `/dev/loop0`)

### 🔍 Notes
- The loop device lets me treat a regular file like a block disk
- I used `losetup -fP` to auto-assign and scan for partitions
- `losetup -a` helped confirm attachment

---

## 🧠 Questions or Confusions
- What happens if I reboot — will loop devices persist?
- Can I use multiple partitions inside a loop device?

---

## 🛠️ Next Steps
- Partition this virtual disk
- Format it with ext4
- Mount it and persist it with `/etc/fstab`
