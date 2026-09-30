# Specify locales
f="$(GetPackageOriginalFile glibc /etc/locale.gen)"
sed -i 's/^#\(en_US.UTF-8\)/\1/g' "$f"
sed -i 's/^#\(es_CL\)/\1/g' "$f"

if [[ $aconfmgr_action == 'apply' ]]; then
    if [[ ! -f $HOME/.gitconfig ]]; then
        Log 'Creating git config'
        git config --global core.editor nvim
        git config --global core.quotepath false
        git config --global init.defaultBranch main
        read -p 'Set git user.name (E.g. John Doe): ' git_name
        git config --global user.name ${git_name}
        read -p 'Set git user.email (E.g. john.doe@example.org): ' git_email
        git config --global user.email ${git_email}
    fi
fi

RevealHomeFolder
