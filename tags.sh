IGNORE="the\|a\|to\|of\|in\|end\|with\|is\|that\|for\|begin\|emph\|as\|\
do\|de\|or\|are\|e\|cite\|on\|lstlisting\|ref\|0\|texttt\|which\|\
an\|1\|line\|be\|not\|be\|not\|can\|and\|it\|label\|figure\|this\|o\|\
sec\|we\|lst\|t\|item\|all\|by\|from\|also\|minipage\|other\|Figure\|\
2\|var\|3\|S\|8\|comment\|they\|é\|two\|example\|if\|que\|We\|its\|no\|\
at\|p\|color\|variables\|use\|when\|5\|caption\|Section\|usepackage\|\
v\|first\|same\|g\|such\|does\|id\|um\|em\|i\|LL\|RR\|because\|between\|\
only\|da\|para\|uma\|linewidth\|may\|new\|one\|each\|left\|rr\|com\|10\|\
behavior\|newcommand\|them\|int\|TODO\|but\|subsection\|while\|fig\|their\|\
then\|37pt\|xleftmargin\|b\|footnote\|have\|second\|more\|through\|shows\|\
provide\|start\|however\|level\|move\|o\|after\|set\|both\|n\|5cm\|itemize\|\
o\|our\|11\|side\|ha\|out\|d\|9\|any\|x\|como\|não\|make\|order\|4\|entre\|how"
cat Modularity-15/mod.tex REBELS-14/rebels.tex REM_13/rem.tex   \
    sensys_13/sensys_13.tex                                     \
    /data/Documents/Old/2008\ -\ Webmedia\ -\ NCLua/ginga.tex   \
    /data/Documents/Old/2009\ -\ SBLP/index.tex                 \
    | tr -s '[[:punct:][:space:]]' '\n'                         \
    | tr '[:upper:]' '[:lower:]'                                \
    | sed 's/activities/activity/'                              \
    | sed 's/mídia/media/'                                      \
    | sed 's/objeto/object/'                                    \
    | grep -ivx "$IGNORE"                                       \
    | sed 's/s$//'                                              \
    | sort | uniq -c |sort -k1nr -k2d | less
