## Plugin to create/change/activate/deactivate python virtual environment depending 
## on the current path. Searches through each parent in PWD for the folder
## $VENV_DIR (by default \".venv\"). If it exists, it sources its activation
## script (after deactivating current virtualenv, if there is one). If it doesn't,
## then it just deactivates the current environment if there is one, leaving you in
## a non-virtual environment.

_OLD_PWD="/"
if [ -z "$VENV_DIR" ]; then
    export VENV_DIR=".venv"
fi

function check_for_venv() {
    cur_dir=$(pwd)

    if [ -d $cur_dir/$VENV_DIR ]; then
        echo $cur_dir/$VENV_DIR
        return
    fi

    while [ 1 ]
    do
        cur_dir=$(dirname $cur_dir)

        if [ -d $cur_dir/$VENV_DIR ]; then
            echo $cur_dir/$VENV_DIR
            return
        fi
        
        if [ $cur_dir = "/" ]; then
            return
        fi
    done
}

function deactivate_venv() {
    echo Deactivating virtual environment in $(dirname $VIRTUAL_ENV) "..."
    deactivate
}

function activate_venv() {
    source $1/bin/activate
    if [ x"$2" = "xafter_deactivate" ]; then
        echo "..." and entering virtual environment in $(dirname $1) "..."
    else
        echo Entering virtual environment in $(dirname $1) "..."
    fi
}

function change_venv_if_needed() {
    if [ x"$1" != "xignore_pwd" -a "$_OLD_PWD" = "$(pwd)" ]; then
        if [ ! -d $VIRTUAL_ENV ]; then
            deactivate_venv
        fi
        return
    fi

    _OLD_PWD=$(pwd)
       
    new_venv=$(check_for_venv)

    if [ -z $VIRTUAL_ENV ]; then
        # no venv previously, but new one exists
        if [ -n "$new_venv" ]; then
            activate_venv $new_venv
        fi
    else
        # going from venv to non-venv environment
        if [ -z "$new_venv" ]; then
            deactivate_venv
        # switching venv environments
        elif [ $new_venv != $VIRTUAL_ENV ]; then
            deactivate_venv
            activate_venv $new_venv after_deactivate
        fi
    fi

}

function create_venv() {
    if [ -z "$1" ]; then
        virtualenv $VENV_DIR
        change_venv_if_needed ignore_pwd
    elif [ ! -d $1 ]; then
        virtualenv $VENV_DIR $@
        change_venv_if_needed ignore_pwd
    else
        virtualenv $1/$VENV_DIR ${@:2}
    fi
}

case "$0" in
    *zsh*)
        precmd() {
            change_venv_if_needed
        }
        ;;
    *bash*)
        export PROMPT_COMMAND=change_venv_if_needed
esac
