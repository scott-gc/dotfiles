# Use `hub` as our git wrapper:
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi