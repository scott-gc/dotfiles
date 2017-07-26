# init according to man page
# d
if (( $+commands[nodenv] ))
then
  eval "$(nodenv init -)"
fi
