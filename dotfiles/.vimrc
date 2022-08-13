set encoding=utf-8
scriptencoding utf-8

"基本設定
set shortmess+=I               " 起動時のメッセージを消す
set nocompatible               " vi互換モードオフ
set backupdir=$HOME/vimbackup  " バックアップファイルのディレクトリを指定
set noswapfile                 " スワップファイルを作らない
set autoread                   " 他で書き換えられたら自動で読み直す
set hidden                     " 編集中でも他のファイルを開けるようにする
set wildmenu                   " コマンドモードの補完
set history=5000               " 保存するコマンド履歴の数
"------------------------------------------------------------------------------
"表示系
set showmatch                  " 閉じ括弧が入力された時、対応する括弧を強調する
set showcmd                    " 入力中のコマンドをステータスに表示
set showmode                   " INSERTなどのステータスを表示する
set number                     " 行番号の表示
set notitle                    " タイトルバーに編集中のファイル名などを表示
set ruler                      " カーソル位置情報を表示
set laststatus=2               " ファイル名を表示
syntax enable
"------------------------------------------------------------------------------
"インデント系
set autoindent                 " ENTER時に自動でインデント
set smartindent                " インデントを空気読んでやってくれる
set expandtab                  " タブ文字の代わりに同じ幅の空白文字を入れる
set tabstop=2                  " タブ文字のインデント幅
set shiftwidth=2               " 「＞＞」、「＜＜」操作のシフト幅
"------------------------------------------------------------------------------
"全角、タブの判別
"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_
"------------------------------------------------------------------------------
"" 全角スペースをハイライト表示
function! ZenkakuSpace()
        highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

    if has('syntax')
        augroup ZenkakuSpace
            autocmd!
            autocmd ColorScheme       * call ZenkakuSpace()
            autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
        augroup END
        call ZenkakuSpace()
    endif
"------------------------------------------------------------------------------
"NeoBundle
if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " NeoBundleが未インストールであればgit cloneする
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするVimプラグインを以下に記述
" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'

"-------------------
" ここに追加したいVimプラグインを記述する

NeoBundle 'scrooloose/nerdtree'           "左にディレクトリ一覧を表示
NeoBundle 'Townk/vim-autoclose'           "閉じカッコを補完
NeoBundle 'Yggdroot/indentLine'           "インデントの可視化
NeoBundle 'nikvdp/ejs-syntax'             "ejsにシンタックスカラー設定

"-------------------
call neobundle#end()

" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck


"------------------------------------------------------------------------------
"NERDTree起動ショートカット
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"閉じカッコ補完
inoremap { {}<LEFT>
inoremap ( ()<LEFT>

"------------------------------------------------------------------------------
"移動系
source $VIMRUNTIME/macros/matchit.vim

"------------------------------------------------------------------------------
"閉じタグ補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

"------------------------------------------------------------------------------
"検索結果をハイライト表示
set hlsearch
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore

" ステータスラインの表示
  set statusline=%<     " 行が長すぎるときに切り詰める位置
  set statusline+=[%n]  " バッファ番号
  set statusline+=%m    " %m 修正フラグ
  set statusline+=%r    " %r 読み込み専用フラグ
  set statusline+=%h    " %h ヘルプバッファフラグ
  set statusline+=%w    " %w プレビューウィンドウフラグ
  set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
  set statusline+=%y    " バッファ内のファイルのタイプ
  set statusline+=\     " 空白スペース
if winwidth(0) >= 130
  set statusline+=%F    " バッファ内のファイルのフルパス
else
  set statusline+=%t    " ファイル名のみ
endif
  set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
  set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
  set statusline+=\ \   " 空白スペース2個
  set statusline+=%1l   " 何行目にカーソルがあるか
  set statusline+=/
  set statusline+=%L    " バッファ内の総行数
  set statusline+=,
  set statusline+=%c    " 何列目にカーソルがあるか
  set statusline+=%V    " 画面上の何列目にカーソルがあるか
  set statusline+=\ \   " 空白スペース2個
  set statusline+=%P    " ファイル内の何％の位置にあるか

