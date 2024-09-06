# venv_manager: Manage your python virtual environments without any effort. Literally.

![Demo](https://github.com/purajit/venv_manager/blob/master/demo.gif "Demo")

Have multiple python virtual environments and find it annoying to manage them? Ever
install PyPI packages into the wrong environment or otherwise make modifications you
meant to make to some other environment? Then this plugin is for you!

This plugin helps you create and change/activate/deactivate python virtual
environments depending on your current path. It searches through each parent in the
working directory for the folder `$VENV_DIR`, and activates the closest one,
or deactivates the active venv if you have left its context.

## Installation

* `oh-my-zsh`: clone into `custom/plugins` in your `oh-my-zsh` folder, and add `venv_manager`
  to the list of plugins in your `.zshrc`.
* otherwise, clone anywhere, `source` it from your shell rc.

This makes the command `venv_manager_switch_venv` available to use.

Add the following to your shell rc for automatic switching:
```sh
# zsh
precmd() {
  venv_manager_switch_venv
}

# bash
export PROMPT_COMMAND=venv_manager_switch_venv
```

You can configure `$VENV_DIR`, which defaults to `.venv`

## Usage

Try it out! Simply `cd` in and out of folders that have virtual environments!

## History

21 March, 2017: created repository.

05 September, 2024: several updates now that I'm a more mature, grounded individual.

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
