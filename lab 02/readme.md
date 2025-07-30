# 🗓️ Day 04 – Managing Services & System Logs

## 🔧 Managing systemd Services

### Common Commands
```bash
# Check status of a service
systemctl status nginx

# Start/Stop a service
sudo systemctl start nginx
sudo systemctl stop nginx

# Enable/Disable at boot
sudo systemctl enable nginx
sudo systemctl disable nginx

# Restart or reload config
sudo systemctl restart nginx
sudo systemctl reload nginx

# View all logs
journalctl

# Logs since last boot
journalctl -b

# Logs for a unit
journalctl -u sshd

# Follow live logs
journalctl -u nginx -f

# Logs for the past hour
journalctl --since "1 hour ago"

# Logs with specific priority
journalctl -p err
