function _update_ps1() {
    PS1="$(powerline-go -hostname-only-if-ssh -theme gruvbox -error $? -jobs $(jobs -p | wc -l))"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

if [ "$TERM" != "linux" ] &&  command -v powerline-go &> /dev/null ; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi