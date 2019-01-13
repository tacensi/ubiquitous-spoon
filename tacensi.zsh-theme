# https://github.com/tacensi zsh theme
# Based on https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  else
    echo ' '
  fi
}

fill=""

function _print_lines() {
	let fillsize=${COLUMNS}-17
	while [ "$fillsize" -gt "0" ]
	do
		fill="-${fill}"
		let fillsize=${fillsize}-1
	done
	echo ${fill}
}

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

ZSH_THEME_GIT_PROMPT_PREFIX=" [%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""


RPROMPT=''

PROMPT='%{%f%k%b%}
$(_print_lines) [%D %T]%{%f%}
%B› %1~ %{%B%F{green}%}$(git_prompt_info)%E%{%f%k%b%}
%{%K{${bkg}}%}$(_prompt_char)%{%K{${bkg}}%} %#%{%f%k%b%} '
