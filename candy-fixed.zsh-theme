#PROMPT=$'%{$fg_bold[green]%}%n@%m %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info) %{$fg_bold[blue]%}$%{$reset_color%} '
PROMPT=$'%{$fg_bold[green]%}%n %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info) %{$fg_bold[blue]%}$%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""