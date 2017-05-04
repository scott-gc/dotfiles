# grc overides for ls
# Made possible through contributions from generous benefactors like
# `brew install coreutils`
  alias ls="ls -F -color"
  alias l="ls -la -color"
  alias ll="ls -l -color"
  alias la='ls -A -color'

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
