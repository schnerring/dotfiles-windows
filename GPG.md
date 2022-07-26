# GPG Cheatsheet

See also:

- [Using Your YubiKey with OpenPGP](https://support.yubico.com/hc/en-us/articles/360013790259-Using-Your-YubiKey-with-OpenPGP)
- [How to use GPG with YubiKey (bonus: WSL 1 and WSL 2)](https://codingnest.com/how-to-use-gpg-with-yubikey-wsl/)
- [drduh/YubiKey-Guide](https://github.com/drduh/YubiKey-Guide)
- [Using YubiKey as a Windows SSH Smartcard](https://md.ekstrandom.net/blog/2019/10/yubikey-ssh)

```bash
# Generate Master Key / 4096 bit RSA
gpg --expert --full-gen-key

# List Keys
gpg --list-secret-keys
gpg --list-keys

# Delete Key
gpg --delete-secret-key $KEYID
gpg --delete-key $KEYID

# Backup Key
gpg --armor --export-secret-key $KEYID > gpg-private-key.asc
gpg --armor --export $KEYID > gpg-public-key.asc
gpg --export-ssh-key <public key id>


# Restore Key
gpg --import gpg-private-key.asc

# Edit Key
gpg --expert --edit-key $KEYID
```

```bash
# Add Authentication Key
gpg> addkey
# RSA
gpg> 8
# Untoggle E
gpg> e
# Untoggle S
gpg> e
# Toggle A
gpg> a
gpg> q
# Specify Key Size
gpg> 4096

# Add Signing Key
gpg> addkey
# RSA
gpg> 8
# Untoggle E
gpg> e
gpg> q
# Specify Key Size
gpg> 4096
gpg> save
```

```bash
# Check if gpg sees YubiKey
gpg --card-status

# Import on YubiKey
# Set to [ultimate] trust before continuing
# Default Admin PIN: 12345678

gpg --edit-key $KEYID
# Export E
gpg> key 1
gpg> keytocard

# Export A
gpg> key 1
gpg> key 2
gpg> keytocard

# Export S
gpg> key 2
gpg> key 3
gpg> keytocard

gpg> save
```

Clone backup USB

```bash
dd if=/dev/sdX of=/dev/sdY bs=512K status=progress
```

## Scheduled Tasks

### gpg-agent

- Trigger: `At log on`
- Actions: Start a program `"C:\Program Files (x86)\GnuPG\bin\gpgconf.exe" --launch gpg-agent`
- Conditions:
  - Start the task only if the computer is on AC power: `unchecked`
  - Stop if the computer switches to battery power: `unchecked`

### wsl-ssh-pageant

- Trigger: `At log on`
- Actions: Start a program `"C:\ProgramData\chocolatey\bin\wsl-ssh-pageant-gui.exe" --systray --winssh ssh-pageant --wsl C:\wsl-ssh-pageant\ssh-agent.sock`
- Conditions:
  - Start the task only if the computer is on AC power: `unchecked`
  - Stop if the computer switches to battery power: `unchecked`
