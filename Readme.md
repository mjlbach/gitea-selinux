### Installation
1. Install dependencies
```bash
sudo rmp-ostree install selinux-policy-devel policycoreutils-devel
```

2. Reboot

3. 
```bash
make install
sudo make install
```

### Debugging tips

```bash
sudo ausearch --success no --message AVC --start TIME_BEFORE_LAST_SSH_ATTEMPT
```

### TODO

1. Installation error with man files

```
❯ sudo make install
semodule -i gitea-sshd.pp.bz2

sepolicy manpage --path . --domain gitea-sshd_t
ValueError: gitea-sshd_t must be an SELinux process domain:
```

2. 


```
----
time->Tue Mar 21 21:41:17 2023
type=USER_AUTH msg=audit(1679460077.172:535): pid=2837 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=pubkey acct="git" exe="/usr/sbin/sshd" hostname=? addr=REDACTED terminal=ssh res=failed'
----
time->Tue Mar 21 21:41:17 2023
type=USER_ERR msg=audit(1679460077.282:538): pid=2837 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=PAM:bad_ident grantors=? acct="?" exe="/usr/sbin/sshd" hostname=REDACTED addr=98.35.166.147 terminal=ssh res=failed'
----
time->Tue Mar 21 21:41:17 2023
type=USER_LOGIN msg=audit(1679460077.282:540): pid=2837 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=login acct="git" exe="/usr/sbin/sshd" hostname=? addr=REDACTED terminal=ssh res=failed'

```
