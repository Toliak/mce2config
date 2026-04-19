MCE2_SCRIPT_DIR="${0:A:h}"

source "$MCE2_SCRIPT_DIR"/shared.sh

# TODO: use SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
# for the source
# ZSH: "${0:A:h}"

export HISTSIZE=50000
export SAVEHIST=50000

# <BEGIN> zsh-autosuggestions cfg
if [ "$TERM" = "linux" ]; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=yellow"
fi
# <END> zsh-autosuggestions cfg
