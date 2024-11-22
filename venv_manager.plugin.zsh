## Plugin to create/change/activate/deactivate python virtual environment depending
## on the current path. Searches through each parent in PWD for the folder
## $VENV_DIR (by default ".venv"), and activates it appropriately.
## If you are under $VENV_MANAGER_IGNORE_DIR, it does nothing
## TODO: Allow multiple ignore dirs

_OLD_PWD="/"
: "${VENV_DIR:=.venv}"

function venv_manager_switch_venv() {
    if [ "$_OLD_PWD" = "$(pwd)" ]; then
        if [ ! -d "$VIRTUAL_ENV" ]; then
            command -v deactivate &>/dev/null && deactivate
        fi
        return
    fi

    _OLD_PWD="$(pwd)"

    new_venv=""
    cur_dir="$(pwd)"

    while [ "$cur_dir" != "/" ]; do
        if [ -d "${cur_dir}/${VENV_DIR}" ]; then
            new_venv="${cur_dir}/${VENV_DIR}"
            break
        fi
        cur_dir="$(dirname "$cur_dir")"
    done

    if [ -n "$new_venv" ] && [ ! -f "$new_venv/../.envrc" ]; then
        source "$new_venv/bin/activate"
    else
        command -v deactivate &>/dev/null && deactivate
    fi
}
