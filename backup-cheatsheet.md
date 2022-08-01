# Backup Cheatsheet

This cheatsheet contains a list of commands commonly used with GPG and YubiKeys. It's based on the excellent [drduh/YubiKey-Guide](https://github.com/drduh/YubiKey-Guide).

```bash
KEYID=<GPG MASTER PUBLIC KEY>
```

## Inital YubiKey Setup

1. Set PIV, FIDO2 PIN
2. Add TOTP secrets
3. Register security keys (WebAuthn)
4. Add KeePass HMAC challenge secret
5. Configure GPG

```bash
gpg --edit-card

# Enable admin commands
gpg/card> admin
# Set holder name
gpg/card> kdf-setup
# Set holder name
gpg/card> name
# Change PIN and Admin PIN
gpg/card> passwd
```

## Import

```bash
gpg --import $KEYID
gpg --expert --edit-key $KEYID

gpg> trust
# ultimate
gpg> 5
```

## Backup

```bash
# GPG Keys
gpg --armor --export-secret-keys $KEYID    > gpg-mastersub-$KEYID-$(date +%F).asc
gpg --armor --export-secret-subkeys $KEYID > gpg-sub-$KEYID-$(date +%F).asc
gpg --armor --export $KEYID                > gpg-public-$KEYID-$(date +%F).asc
# Revocation Certificate
gpg --gen-revoke $KEYID                    > gpg-revoke-$KEYID-$(date +%F).asc
# SSH Public Key
gpg --export-ssh-key $KEYID                > gpg-ssh-$KEYID-$(date +%F).pub
```

## Export GPG Keys to YubiKey

```bash
gpg --import $KEYID
gpg --expert --edit-key $KEYID

# Encryption
gpg> key 1
gpg> keytocard
gpg> 2

# Authentication
gpg> key 1
gpg> key 2
gpg> keytocard
gpg> 3

# Signature
gpg> key 2
gpg> key 3
gpg> keytocard
gpg> 1

gpg> save
```

## Key Renewal

TODO
