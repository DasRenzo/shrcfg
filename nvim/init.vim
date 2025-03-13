" My "INIT.VIM"; maintained on "ACER"

" Source my basic vim-config that is intentionally kept simple without plugs
let $INIT_VIM_BASIC_PATH='/shrcfg/nvim/init.vim.basic'
source $INIT_VIM_BASIC_PATH

" VimWiki Ctrl-i of Tab overschrijft Jumping-werking met 'NextWikiLink'
" Hieronder een andere kb, zodat basic jumping Ctrl-o Ctrl-i werkt
" Only affects VimWiki directories or extensions
nmap <C-w>t <Plug>VimwikiNextLink

" Vim-plug 'Plugin-manager', config:
" Plug.vim code-file, to be autoloaded, should reside here: ~/.local/share/nvim/site/autoload/plug.vim
" Plugins-path for installed plugs: ~/.local/share/nvim/plugged
call plug#begin()
	Plug 'preservim/nerdtree' " Nice filetree; I use it mainly for its bookmark-function, which is lacking in 'netrw'
	Plug 'mbbill/undotree' " Provides undo-history; extends on vim's native Undofile
	Plug 'vim-airline/vim-airline' "A statusbar
	Plug 'vim-airline/vim-airline-themes' "Airline themes
	Plug 'vimwiki/vimwiki' "VimWiki for creating Wikis
	Plug 'sainnhe/sonokai' "Theme Sonokai
	Plug 'ryanoasis/vim-devicons' "Icons or glyphs for file-extensions; requires a Nerdfont set to Vim or Terminal
call plug#end()

" Settings for Nerdtree
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
nnoremap <F2> :NERDTreeToggle<CR>

" Settings for UndoTree
" Make .undodir and set undofile
if has("persistent_undo")
   let target_path = expand('~/.undodir')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif
    let &undodir=target_path
    set undofile
endif
nnoremap <F5> :UndotreeToggle<CR>

" Settings for Airline
let g:airline_theme='base16_ashes'
let g:airline_powerline_fonts = 1 " For plugin Ryanoasis/Devicons

" Settings for FZF
" Actions to open the selected file(s), when a sink-value is NOT provided
" let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }
" Call FZF; method = call a basic function
" nnoremap <leader>u :call fzf#run({'sink': 'e', 'options': '--multi --reverse', 'window': {'width': 0.9, 'height': 0.8, 'relative': v:true}})<CR>
" Call FZF; method = define a command with a bang-switch and dir-argument, that calls a basic function
" command! -bang -complete=dir -nargs=? FRPA call fzf#run(fzf#wrap({'sink': 'e', 'dir': <q-args>}, <bang>0))
" nnoremap <leader>f :FRPA!<CR>
" Remap for Ag grep into FZF
" nnoremap fa :Ag<CR>
" Remap for Rg grep into FZF
" nnoremap fr :Rg<CR>

" Settings for VimWiki
let g:vimwiki_list = [{'path': '/aux/todo/', 'index': 'todo', 'ext': '.tdw'}, {'path': '/aux/documentatie/', 'index': 'documentatie', 'ext': '.docw'}]
" VimWiki operating on list-extensions, outside the list-dirs
let g:vimwiki_global_ext = 1
" VimWiki always operating on these extensions-syntax pairs
let g:vimwiki_ext2syntax = {'.wiki': 'media', '.docw': 'media'}
" let g:vimwiki_ext2syntax = {'.md': 'markdown', '.wiki': 'media', '.docw': 'media'}

" Theme-style-pick for 'sonokai'
let g:sonokai_style = 'espresso'
let g:sonokai_better_performance = 1

" Colorschemes
nnoremap <leader>1 :call RPA_CS("default")<CR>
nnoremap <leader>2 :call RPA_CS("sonokai")<CR>
nnoremap <leader>3 :call RPA_CS("slate")<CR>
nnoremap <leader>4 <nop>
nnoremap <leader>5 <nop>
" call RPA_CS("default")

