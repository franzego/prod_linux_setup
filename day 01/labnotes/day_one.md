# Day 01 – Users, Groups, Permissions & ACLs

## Objectives

- Create and manage users and groups
- Secure shared folders with proper permissions
- Apply ACLs for flexible access control
- Simulate a permission issue and troubleshoot it using logs

---

## 1. Create Groups

```bash
sudo groupadd hr
sudo groupadd it

## 2. Create Users And Assign To Groups
sudo useradd -m -G hr f.frank
sudo useradd -m -G it j.james
sudo passwd f.frank
sudo passwd j.james
## 3. Create A Secure Shared Folder
sudo mkdir -p /srv/teamshare
sudo chown :hr /srv/teamshare
sudo chmod 770 /srv/teamshare
## 4. Simply Test Access
j.james should show access denied
## 5. Apply Acl to Grant temporary access
sudo setfacl -m u:j.james:r-- /srv/teamshare
getfacl /srv/teamshare
## 6. Simulate a Broken Set-up
change the permission of the group
sudo chmod 700 /srv/teams
## 7. Practice troubleshooting
su -root # important to read the log files
jounalctl -xe | grep j.james # to read the logs and analyze the issues









