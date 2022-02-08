
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

### File Descriptor Limit (in addition to /etc/sysctl.conf ###
ulimit -S -n 16000

## bash-completion apt install bash-completiion
### bash-completion when bash < v4
#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

### bash-completion when bash > v4
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

## Git Autocomplete
if [ -f "/etc/bash_completion.sh" ]; then 
    ./etc/bash_completion.sh
fi
