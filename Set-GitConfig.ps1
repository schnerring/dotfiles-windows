git config --global user.name "Michael Schnerring"
git config --global user.email "3743342+schnerring@users.noreply.github.com"

# Configure GPG
git config --global gpg.program "C:\Program Files (x86)\GnuPG\bin\gpg.exe"

# Use PuTTY for SSH
git config --global core.sshcommand "plink -agent"

# GPG Signing Key
git config --global user.signingkey "F5E5BE5C325BCB56"

# Sign each commit
git config --global commit.gpgsign true
