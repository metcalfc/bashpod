
source ${DOTFILES}/script/bashpodlib.sh

complete_command kubectl
complete_command helm

if command -v kubectl &> /dev/null;
then
    alias k=kubectl
    complete -F __start_kubectl k
fi