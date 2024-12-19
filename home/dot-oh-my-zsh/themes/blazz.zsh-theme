if [ "$USER" = "root" ]
then CARETCOLOR="red"
else CARETCOLOR="blue"
fi

PROMPT='%{${fg_bold[cyan]}%}∅ %{$reset_color%}%{${fg[green]}%}%3~ $(git_prompt_info)%{${fg_bold[cyan]}%}::%{${reset_color}%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
