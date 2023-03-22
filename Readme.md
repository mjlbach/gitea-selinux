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
time->Tue Mar 21 20:30:40 2023
type=AVC msg=audit(1679455840.878:384): avc:  denied  { read } for  pid=2565 comm="podman" name="journal" dev="tmpfs" ino=66 scontext=system_u:system_r:sshd_t:s0-s0:c0.c1023 tcontext=system_u:object_r:syslogd_var_run_t:s0 tclass=dir permissive=0
----
time->Tue Mar 21 20:30:40 2023
type=AVC msg=audit(1679455840.911:385): avc:  denied  { getattr } for  pid=2565 comm="podman" path="/run/user/1002/bus" dev="tmpfs" ino=29 scontext=system_u:system_r:sshd_t:s0-s0:c0.c1023 tcontext=unconfined_u:object_r:session_dbusd_tmp_t:s0 tclass=sock_file permissive=0
----
time->Tue Mar 21 20:30:40 2023
type=AVC msg=audit(1679455840.920:386): avc:  denied  { getattr } for  pid=2565 comm="podman" path="/run/user/1002/bus" dev="tmpfs" ino=29 scontext=system_u:system_r:sshd_t:s0-s0:c0.c1023 tcontext=unconfined_u:object_r:session_dbusd_tmp_t:s0 tclass=sock_file permissive=0
----
time->Tue Mar 21 20:30:40 2023
type=AVC msg=audit(1679455840.922:387): avc:  denied  { write } for  pid=2565 comm="podman" name="libpod" dev="vda4" ino=28584444 scontext=system_u:system_r:sshd_t:s0-s0:c0.c1023 tcontext=unconfined_u:object_r:data_home_t:s0 tclass=dir permissive=0
----
time->Tue Mar 21 20:30:40 2023
type=AVC msg=audit(1679455840.922:388): avc:  denied  { write } for  pid=2565 comm="podman" name="bolt_state.db" dev="vda4" ino=28584445 scontext=system_u:system_r:sshd_t:s0-s0:c0.c1023 tcontext=unconfined_u:object_r:data_home_t:s0 tclass=file permissive=0

```
