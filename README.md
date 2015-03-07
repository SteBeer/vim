README
======

Setting up on a new host
------------------------

    sudo apt-get install git vim
    sudo apt-get install curl build-essential exuberant-ctags cmake python-dev silversearcher-ag
    # OR
    sudo yum install git vim
    sudo yum install ctags cmake python-devel the_silver_searcher

    git clone https://kmARC@bitbucket.org/kmARC/vim.git ~/.vim
    vim -c ':PlugInstall' -c ':qa'
    # Ignore error message by pressing enter

At this point, plugins will automatically installed inside vim. After finished, you can startup vim with all plugins installed.

To configure your system to leverage the color scheme, do the following steps:

    cd ~/.vim/misc
    git clone https://github.com/chriskempson/base16-builder
    ./base16

Put the following configuration in your `~/.bashrc`:

    export TERM="xterm-256color"
    # Base16 Shell
    BASE16_SHELL="$HOME/.vim/misc/base16-builder/output/shell/base16-flat.dark.sh"
    [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


Update a host
-------------

    cd ~/.vim
    git pull
    vim -c ':PlugUpdate'

Programming languages
---------------------
*TODO: These could be written as shell scripts*

Optional for **Python**

    sudo apt-get install pylint
    # OR
    sudo yum install pylint

Optional for **JavaScript**

    # Install nvm
    curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash
    # Install node v0.12
    source ~/.nvm/nvm.sh
    nvm install 0.12
    # Make nvm loaded automatically in bash
    cat << EOF >> ~/.bashrc
    export NVM_DIR="/home/oro/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm use 0.12 > /dev/null
    EOF

    sudo npm install -g jshint
    cd ~/.vim/plugged/tern_for_vim
    npm install

Optional for **C/C++**
*Unfortunately this needs to be done after each :PlugUpdate if YouCompleteMe updated*

    sudo apt-get install libclang-3.5-dev
    # OR
    sudo yum install clang-devel

    cd ~/.vim/misc
    mkdir ycm_build
    cd ycm_build
    cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
    make ycm_support_libs
    cd ..
    rm -rf ycm_build


Optional for **Haskell**

    sudo apt-get install cabal-install
    # OR
    sudo yum install cabal-install

    cabal update
    cabal install ghc-mod
    cabal install hasktags

Installing new modules
----------------------

Refer to https://github.com/junegunn/vim-plug

Example: vim-fugitive. Add the following line to vimrc and run :PlugInstall

    Plug 'tpope/vim-fugitive.git'

To persist the change, commit.

    git commit -m 'Added vim-fugitive'
    git push