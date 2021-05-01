
PDF=mupdf
function pdf() {
    if [[ -f "$@" ]]; then
        mupdf "$@" 2>/dev/null &
    elif [[ -f "$@pdf" ]]; then
        mupdf "$@pdf" 2>/dev/null &
    elif [[ -f "$@.pdf" ]]; then
        mupdf "$@.pdf" 2>/dev/null &
    else
        echo "ERROR: No file '$@' or '$@pdf' or '$@.pdf' found."
    fi
}

alias emacs="emacs -nw"
export EDITOR="emacs"
