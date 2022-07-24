# Backup Cheatsheet

```bash
KEYID=<GPG MASTER PUBLIC KEY>
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

## Key Renewal

TODO
