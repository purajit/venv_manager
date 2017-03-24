# venv_manager: Manage your python virtual environments without any effort. Literally.

![Look, a moving picture!](https://github.com/purajit/venv_manager/blob/master/demo.gif "Demo")

Have multiple python virtual environments and find it annoying to manage them? Ever
install PyPI packages into the wrong environment or otherwise make modifications you
meant to make to some other environment? Then this plugin is for you!

This plugin helps you create and change/activate/deactivate python virtual
environments depending on your current path. It searches through each parent in the
working directory for the folder `$VENV_DIR` (by default ".venv"). If it exists,
it sources its activation script (after deactivating the current virtualenv, if there
is one). If it doesn't, then it just deactivates the current environment if there is
one, leaving you in a non-virtual environment.

(Currently works with `zsh` and `bash`; specifically written for oh-my-zsh but extendable)

## Installation

* `zsh`: clone into `custom/plugins` in your oh-my-zsh folder, and add "venv_manager"
  to your list of plugins in your `.zshrc`. If you're not using oh-my-zsh, you can
  simply `source` it.
* `bash`: clone anywhere, `source` it from `.bashrc`.
* Others: if you want to add support for other shells, I'm open to accepting changes
  for it.

In addition, I set

    export VIRTUAL_ENV_DISABLE_PROMPT=1

to disable virtualenv from messing with my prompt and instead use my own function
that shows the _parent_ of the virtualenv directory, which I find more useful:

    # get parent folder of virtualenv location
    function get_python_venv {
        if [[ -n "$VIRTUAL_ENV" ]] ; then
            echo "($(basename -- "$(dirname -- "$VIRTUAL_ENV")")) "
        fi
    }

and incorporate it into my prompt:

    PROMPT="$(get_python_venv) ...

## Usage

Try it out! Simply `cd` in and out of folders that have virtual environments! It
assumes that all your virtual environment folders have the same name, `$VENV_DIR`. To
define your own name, set it in your shell config. If unset, it assumes you use
`".venv"`.

To create a new virtual environment, run `create_venv <path>`. If `<path>` is not
provided, it creates it in the current working directory. You can also provide all
the usual virtualenv options, such as the path to the python interpreter. This helps
you create virtual environments that follow the naming convention assumed by the plugin.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

21 March, 2017: created repository.

## Credits

Authored by Purajit Malalur

## License

MIT License

Copyright (c) [2017] [Purajit Malalur]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
