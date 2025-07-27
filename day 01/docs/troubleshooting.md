# Troubleshooting Playbook

This document outlines common Linux system issues and a structured approach to troubleshoot them.

---

## 🧠 General Troubleshooting Approach

1. **Gather Symptoms**
   - What is the user or system reporting?
   - When did it start?
   - Is it affecting others?

2. **Check Logs**
   - `journalctl -xe` for service errors
   - `/var/log/messages`, `/var/log/syslog`, or `/var/log/secure`
   - `dmesg` for hardware or kernel-related issues

3. **System Health**
   - CPU: `top`, `htop`, `uptime`
   - Disk: `df -h`, `du -sh`, `iostat`
   - RAM: `free -m`, `vmstat`, `sar`

4. **Service Status**
   - `systemctl status <service>`
   - `ss -tuln` to confirm ports are listening

5. **Network Checks**
   - `ping`, `curl`, `dig`, `ip a`, `ip r`
   - Check DNS resolution, gateway, firewall rules

6. **Configuration Check**
   - Was there a recent change in `/etc`?
   - Permissions/ownership: `ls -l`, `getfacl`

7. **Restore or Revert**
   - Use backups, snapshots, or known-good configs

8. **Document the Incident**
   - Use the `incident-report-template.md` to log your response

---

## 🛠️ Common Issues & Fixes

### 🔧 Service Not Starting
- Check `systemctl status <service>`
- View detailed logs: `journalctl -u <service>`
- Check SELinux: `sestatus`, `ausearch -m avc`

### 💥 Disk Full
- `df -h` to check disk usage
- `du -sh *` to find large directories
- Clean up logs or old backups

### 🔐 Permission Denied
- Check `ls -l` and `getfacl`
- Ensure group membership is correct
- Look at `/var/log/secure` or audit logs

### 🌐 Can't Reach Internet / DNS
- Test DNS: `dig google.com`
- Check gateway: `ip r`
- Firewall blocking? Check `firewalld`, `iptables`, or pfSense

### 🔒 SSH Access Denied
- Wrong key? Check `~/.ssh/authorized_keys`
- Root login disabled? Check `/etc/ssh/sshd_config`
- Check `/var/log/secure` for auth failures

---

## 📋 Notes
Always make a habit of documenting the problem, cause, what was tried, and solution — this builds muscle memory.
