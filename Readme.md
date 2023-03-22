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

### TODO


Still getting the following selinux errors
```
----
time->Tue Mar 21 20:24:31 2023
type=CRED_ACQ msg=audit(1679455471.306:199): pid=945 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='op=PAM:setcred grantors=? acct="git" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=failed'
----
time->Tue Mar 21 20:24:31 2023
type=CRED_ACQ msg=audit(1679455471.307:201): pid=944 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='op=PAM:setcred grantors=? acct="mjlbach" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=failed'
----
time->Tue Mar 21 20:24:37 2023
type=CRED_ACQ msg=audit(1679455477.043:267): pid=1725 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='op=PAM:setcred grantors=? acct="root" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=failed'
----
time->Tue Mar 21 20:25:13 2023
type=AVC msg=audit(1679455513.049:331): avc:  denied  { map } for  pid=2028 comm="podman" path="/usr/bin/podman" dev="vda4" ino=36775453 scontext=system_u:system_r:sshd_t:s0-s0:c0.c1023 tcontext=system_u:object_r:container_runtime_exec_t:s0 tclass=file permissive=0
----
time->Tue Mar 21 20:25:13 2023
type=USER_AUTH msg=audit(1679455513.050:333): pid=2026 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=pubkey acct="git" exe="/usr/sbin/sshd" hostname=? addr=REDACTED terminal=ssh res=failed'
----
time->Tue Mar 21 20:25:13 2023
type=USER_ERR msg=audit(1679455513.092:336): pid=2026 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=PAM:bad_ident grantors=? acct="?" exe="/usr/sbin/sshd" hostname=REDACTED addr=98.35.166.147 terminal=ssh res=failed'
----
time->Tue Mar 21 20:25:13 2023
type=USER_LOGIN msg=audit(1679455513.093:338): pid=2026 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=login acct="git" exe="/usr/sbin/sshd" hostname=? addr=REDACTED terminal=ssh res=failed'
```
