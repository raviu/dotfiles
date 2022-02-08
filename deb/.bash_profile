
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,bash_prompt,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

### File Descriptor Limit (in addition to /etc/sysctl.conf ###
ulimit -S -n 16000

## bash-completion apt install bash-completiion
