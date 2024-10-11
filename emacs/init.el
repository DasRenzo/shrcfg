;; EMACS-CONFIG RPA MAINTAINED ON ACER; emacsclient -c -e "(select-frame-set-input-focus (selected-frame))"

;; BASICS
;; c-x c-s		save
;; c-x c-c		close emacs
;; c-x k		kill-buffer ==> kill-this-buffer
;; c-l			recenter-top-bottom
;; c-m-l		scroll heuristically to bring useful information onto the screen (reposition-window)
;; m-g g		goto-line
;; about		start emacs in a terminal: emacs -nw (short for: --no-window-system)
;; END-BASICS

;; FRAMES
;; C-x 5 2		create a new frame using the default frame parameters (make-frame-command)
;; C-x 5 c		create a new frame using the window configuration and frame parameters of the current frame (clone-frame)
;; C-x 5 b		select buffer bufname in another frame
;; C-x 5 f		visit file filename and select its buffer in another frame
;; C-x 5 d		select a dired-buffer for directory directory in another frame
;; C-x 5 0		delete the selected frame (delete-frame); this signals an error if there is only one frame
;; C-x 5 1		delete all frames on the current terminal, except the selected one
;; C-x 5 o		selects the next frame (other-frame)
;; F11			toggle full-screen mode for the current frame
;; M-F10		toggle the maximization state of the current frame
;; C-z			minimize (or iconify) the selected emacs-frame (suspend-frame); ==> however in CUA-mode it means 'undo'
;; END-FRAMES

;; VISITING
;; C-x C-f		visit a file (find-file)
;; C-x C-v		visit a different file instead of the one visited (find-ALTERNATE-file); kill current file and start visiting another file
;; C-x 4 f		visit a file, in another window (find-file-other-window)
;; C-x 5 f		visit a file, in a new frame (find-file-other-frame)
;; about		to create a new file, just visit it using the command C-x C-f; emacs displays ‘(New file)’ in the echo area
;; about		the mode line displays two stars near the left margin to indicate that a buffer is modified
;; about		if you visit a file that is already in Emacs, C-x C-f switches to the existing buffer instead of making another copy
;; about		for editing a file as a sequence of ASCII chars with no special encoding/conversion, use command: find-file-literally
;; END-VISITING

;; BUFFERS
;; C-x b buffer RET		select or CREATE a buffer named buffer (switch-to-buffer)
;; C-x 4 b buffer RET	select buffer in another window (switch-to-buffer-other-window)
;; C-x 5 b buffer RET	select buffer in a separate frame (switch-to-buffer-other-frame)
;; C-x x u				rename the current buffer by adding ‘<number>’ to the end
;; C-x C-b				list existing buffers (list-buffers) ==> buffer-menu; allows you to perform various operations on buffers, dired-style
;; about *Buffer List*	in the first field: ‘.’ indicates the 'current buffer', ‘%’ indicates 'read-only', ‘*’ indicates 'modified' ==> CRM-indicators
;; C-u C-x C-b			list only buffers that are visiting files
;; C-x C-q				toggle read-only status of buffer (read-only-mode)
;; C-x x r				change the name of the current BUFFER
;; about				for creating another FILENAME: set-visited-file-name
;; about				buffer-menu gedraagt zich als een dired-buffer; het heeft veel commands in zich:
;; d					flag buffer for deletion (killing)
;; s					flag buffer for saving
;; x					execute operations on flagged deletions/saves
;; u					remove all flags from the current line
;; U					remove all flags from all the lines
;; f					follow; buffer-menu-this-window
;; o					other; select buffer in another window; buffer-menu-other-window
;; m					mark for displaying in other window; buffer-menu-mark
;; v					select this buffer, and also display in other windows any m flagged buffers; buffer-menu-select
;; g					revert-buffer
;; q					quit the buffermenu
;; bs-show				buffers-show ==> 'list-buffers', but customizable ==> bs-customize; default list shows only the filebuffers
;; ibuffer				make a list of buffers and operate on them in a dired-like fashion
;; END-BUFFERS

;; WINDOWS
;; C-x 2		split the selected window into two windows, one above the other (split-window-BELOW)
;; C-x 3		split the selected window into two windows, positioned side by side (split-window-RIGHT)
;; C-mouse-2	in the mode line of a window: split that window ==> so CTRL AND M2
;; C-x o		select another window (other-window); moves through windows in a cyclic order, top to bottom and left to right
;; mouse-1		in the textarea of a window, selects the window and moves point to the position clicked
;; C-l			recenter-top-bottom
;; about		4 in a keybinding hints for: 'other window'
;; about		5 in a keybinding hints for: 'other frame'
;; C-x 4 b		select buffer bufname in another window (switch-to-buffer-other-window)
;; C-x 4 f		visit file filename and select its buffer in another window (find-file-other-window)
;; C-x 4 d		select a dired-buffer for directory directory in another window (dired-other-window)
;; C-x 0		delete the selected window (delete-window)
;; C-x 4 0		stronger than C-x 0; it kills the current buffer and deletes the selected window (kill-buffer-and-window)
;; C-x 1		delete all windows in the selected frame except the selected window (delete-other-windows)
;; C-x ^		make selected window taller (enlarge-window)
;; C-x -		shrink this window if its buffer doesn’t need so many lines (shrink-window-if-larger-than-buffer)
;; C-x +		make all windows the same height (balance-windows)
;; about		deleting the window has no effect on the buffer; the buffer continues to exist; you can switch to it with C-x b
;; END-WINDOWS

;; SAVING
;; C-x C-s					save the current buffer to its file (save-buffer)
;; C-x s					save any or all buffers to their files (save-some-buffers)
;; C-x C-w					write the current buffer with a specified file name (write-file)
;; set-visited-file-name	set a (different) filename, for writing out to this new file on the next save
;; rename-visited-file		rename the file the buffer is visiting
;; about
;; the command C-x s (SAVE-SOME-BUFFERS) asks you what to do with each buffer;
;; options within this presentationprompt are:
;; y	save this buffer and continue
;; n	do not save this buffer and continue
;; !	save all with no more questions
;; q	quit; no more saving
;; .	save this buffer, then exit
;; d	diff the buffer against its corresponding file (diff-buffer-with-file)
;; C-f	exit and visit current buffer
;; C-h	display a help message about these options
;; about
;; the key C-x C-c to exit emacs, invokes 'save-some-buffers' and therefore asks the same questions
;; about canceling by commanding: 'revert-buffer':
;; you can cancel all the changes made since the file was visited or saved, by reading from file again; this is called 'REVERTING'
;; END-SAVING

;; TRANSPOSING
;; C-t		transpose two characters (transpose-chars), on either side of point
;; M-t		transpose two words (transpose-words)
;; C-x C-t	transpose two lines (transpose-lines)
;; END-TRANSPOSING

;; CASECONVERSION
;; M-- M-l	convert last (part of) word to lower case
;; M-- M-u	convert last (part of) word to all upper case
;; M-- M-c	convert last (part of) word to lower case with capital initial
;; about	the first negative argument hast the effect of not moving the cursor
;; END-CASECONVERSION

;; SPELLING
;; ispell				check and correct spelling of all words in the buffer; if the region is active, do it for the region instead
;; ispell-kill-ispell	kill the spell-checker 'subprocess'; not usually necessary, since it uses little processortime
;; flyspell-mode		highlights misspelled words; minor mode that performs AUTOMATIC spell-checking of text you type, as you type
;; END-SPELLING

;; MISC
;; ediff						builtin difftool
;; downcase-word				set wordchars at/after point in downcase
;; upcase-word					set wordchars at/after point in upcase
;; c-u c-x =					check char and font at point
;; ways to express a fontname	fontconfig pattern, GTK font pattern; XLFD (X Logical Font Description), <== font nickname
;; END-MISC

;; REGEXP
;; .				a period is a special character that matches any single character except a newline
;; example			regular expressions ‘a.b’ matches any three-character string that begins with ‘a’ and ends with ‘b’
;; [ ... ]			set of alternative characters aka 'characterset'; picks just one out of the set/range
;; example			So [ad] matches one ‘a’ or one ‘d’, and [ad]* matches any string of just a’s and d’s (incl empty string)
;; [^ ... ]			begins a 'complemented characterset' which matches any character except the ones specified
;; example			thus [^a-z0-9A-Z] matches all characters except normal letters and digits, and [^\] matches any character except a backslash
;; END-REGEXP

;; DIRED
;; C-x d	dired (directory)
;; about:	in the minibuffer kun je meteen een bestandsfilter meegeven, bijvoorbeeld: ~/*.txt
;; s		toggle between alphabetical and date order, and with a prefix argument (c-u s), also edit listing switches like: ls -alith
;; t		toggle selection; from a just started dired-buffer with no files selected, this means: select all
;; A		search for regexp or textstrings in the file-selection (so first mark at least 1 file)
;; m		mark a file
;; D		delete marked files
;; U		unmark all
;; R		rename
;; END-DIRED

;; PACKAGE-ARCHIVES
;; melpa (explicitly declared)
;; gnu
;; nongnu
;; END-PACKAGE-ARCHIVES

;; THEMES
;; alect-dark, monokai, doom-series
;; END-THEMES

;; BOOKMARKS
;; C-x r l					list all bookmarks (list-bookmarks); type 'C-h m' in the 'bookmarkbuffer' for special commands
;; C-x r m bookmark RET		set the bookmark named bookmark at point (bookmark-set)
;; C-x r b bookmark RET		jump to the bookmark named bookmark (bookmark-jump)
;; bookmark-delete			delete a bookmark to specify (via commandcenter m-x)
;; about topic				bookmarks are saved to the file ~/.emacs.d/bookmarks
;; END-BOOKMARKS

;; FACES-FOR-TEMPORARY-HIGHLIGHTING
;; region
;; isearch
;; highlight (when hoovering over hyperlinks)
;; query-replace
;; lazy-highlight
;; trailing-whitespace
;; END-FACES-FOR-TEMPORARY-HIGHLIGHTING


;; FACES-FOR-INTERFACE-PARTS
;; mode-line; a baseface used for the mode line, as well as header lines and for menu bars
;; header-line; window’s header line, which appears at the top of a window
;; tab-line; window’s tab line, which appears at the top of a window with tabs representing window buffers
;; minibuffer-prompt; prompt strings displayed in the minibuffer
;; cursor; background attribute of this face specifies the color of the text cursor
;; tooltip; tooltip text
;; mouse; color of the mouse pointer
;; END-FACES-FOR-INTERFACE-PARTS

;; ZOOMING
;; C-wheelmouse, or:
;; C-x C-=		zoom in
;; C-x C--		zoom uit
;; C-x C-0		herstel normaal
;; Na eerste actie volstaat een + of - voor verder zoomen
;; END-ZOOMING

;; UNDO-DELETE-REPEAT
;; C-/		undo
;; C-_		undo
;; C-x C-o	delete blank lines around the current line (delete-blank-lines)
;; C-x C-o	delete solitary blank line
;; M-\		delete whitespace characters around point: spaces, tabs and newlines (delete-horizontal-space)
;; C-x z	repeat last command
;; END-UNDO-DELETE-REPEAT

;; KILL-COPY-YANK
;; C-w				kill-region (cut)
;; M-w				kill-ring-save (copy)
;; C-y				yank (paste); first checks if 'another application' has placed any text in the system clipboard
;; M-y				yank-down; moves the last-yank-pointer to the previous entry
;; C-S-backspace	kill an entire line at once (kill-whole-line)
;; M-z char			zap through the next occurrence of char (zap-to-char)
;; C-x DEL			kill back to beginning of sentence (backward-kill-sentence)
;; M-d				kill the next word (kill-word)
;; M-BACKSPC		kill one word backwards (backward-kill-word)
;; C-k				kill rest of line (kill-line)
;; mouse-2			mouse-yank-primary; yanks primary region/selection at the mouse-2 clickpoint
;; C-x SPC			activate rectangle markmode (rectangle-mark-mode)
;; C-x C-x			rectangle-exchange-point-and-mark, which cycles between the four corners of a rectangle
;; END-KILL-COPY-YANK

;; REGISTERS
;; C-x r SPC r		record the position of point and the current buffer (point-to-register)
;; C-x r j r		jump to the position and buffer saved in register r (jump-to-register)
;; C-x r s r		store region into register r (copy-to-register)
;; C-x r i r		insert text from register r (insert-register)
;; C-x r r r		copy the region-rectangle into register r (copy-rectangle-to-register)
;; C-x r i r		insert the rectangle stored in register r (insert-register)
;; END-REGISTERS

;; MOUSE
;; first mouse-3-click: mark end of a region (relative to point) and save it; second click kills it to killring ==> mouse3-save-then-kill;
;; every selection/region is stored as the current 'primary region', without having to copy anything; mouse-2 yanks/pasts it where you click;
;; mouse-1 triple-click on a line copies the line;
;; setting 'mouse-autoselect-window' to a non-nil value: moving the mouse over a different window, selects that window;
;; drag-mouse-1		activate the region around the text selected by dragging, and put the text in the 'primary selection' (mouse-set-region)
;; mouse-2			move point to where you click, and insert the contents of the 'primary selection' there (mouse-yank-primary)
;; mouse-3			regio aanpassen of maken (tussen point en clickposition); on second click do a kill (mouse-save-then-kill)
;; C-M-mouse-1		activate a RECTANGULAR region around the text selected by dragging (block-selection)
;; C-mouse-1		menu for "selecting a buffer"
;; C-mouse-2		this menu contains entries for examining FACES and other text properties
;; C-mouse-3		contect-menu
;; S-mouse-1		this menu is for changing the DEFAULT FACE within the window’s buffer
;; END-MOUSE

;; MARK-REGION
;; Selecting (making a region):
;; C-SPC or SHIFT, followed by a motionkey (ARROWS, HOME, END); alternatively CTRL-SHIFT for a faster wordjump
;; Cancel with arrow-up/down, or C-g; or some other non-motion that breaks a selection
;; If the echoarea displays 'mark set' you can swiftly return to this last mark by: C-u C-SPC
;; C-x C-x		exchange-point-and-mark (in a selection/region)
;; C-x C-u		upcase-region
;; C-x C-l		downcase-region
;; C-SPC C-SPC	remember a position by adding it to the markring; set/unset mark
;; C-u C-SPC	jump back to (last) mark on markring
;; M-h			mark paragraph
;; C-x h		mark entire buffer
;; C-x r s		save region into a register
;; C-M-mouse-1	start a rectangle-region, aka blockselection; alternatively use C-x SPC
;; C-x r t		string-rectangle; replace blocklines with argument-string for each line
;; C-x r k		kill-rectangle
;; C-x r y		yank-rectangle
;; C-x r d		delete the text of the region-rectangle (delete-rectangle)
;; C-x r o		insert one blank space to the region-rectangle (open-rectangle)
;; C-x r c		clear-rectangle; replace block with whitespace
;; END-MARK-REGION

;; SEARCHING
;; C-s			isearch-forward, let 'next occurence' appear in the 'isearch face'
;; C-r			isearch-backward
;; BCKDEL		isearch-delete-char, delete last char in searchstring minibuffer
;; RET			isearch-exit; leaving the cursor where the search brought it
;; C-a			exits occurence and moves to BOL; Arrow-key exits occurence and performs the motion
;; RET			when search string EMPTY: launches a non-incremental search
;; C-s C-s		search again for the same string
;; M-p			previous entry in the 'searchring'
;; M-n			next entry in the 'searchring'
;; M-e			isearch-edit-string; edit the current search string in the minibuffer without replacing
;; about		other matches are highlighted differently, using the customizable face 'lazy-highlight'
;; about		you can alternate direction between forward- and backwardsearching: C-s <=> C-r
;; about		when in isearch action, there is isearch yanking:
;; C-w			isearch-yank-word-or-char; appends the next character or word at point to the search string
;; M-s C-e		isearch-yank-line; appends the rest of the current line to the search string
;; C-y			isearch-yank-kill; appends the CURRENT kill to the search string
;; M-y			isearch-yank-pop; called after C-y during incremental search, replaces appended text with an EARLIER kill
;; M-s o		isearch-occur; shows lines with occurences of specified searchstring in another window
;; M-TAB		invokes isearch-complete, which attempts to complete the searchstring using the search ring
;; M-s h r		isearch-highlight-regexp; exit the search while leaving the matches highlighted
;; M-s h l		isearch-highlight-lines-matching-regexp
;; M-s h u		unhighlight-regexp; remove the highlighting
;; M-s M->		will go to the last occurrence
;; M-s M-<		will go to the first occurrence
;; about		when 'isearch-yank-on-move' is set to 'shift' you can extend the searchstring by holding down shift
;; M-s w		isearch-forward-word; begin an incremental forward word search; any sequence of two words anyway separated
;; M-s M-w		search the web for the text in region; use search engine whose URL is set in variable 'eww-search-prefix'
;; about		above two commands are called 'word search'
;; M-s _		isearch-forward-symbol; begin an incremental forward symbol search (realm of searching source code elements)
;; M-s .		start a 'symbol incremental search forward' with the symbol found near point, added to the search string
;; M-s _ RET	start a non-incremental forward symbol search (RET means empty searchstring ==> turn into non-incremental search)
;; C-M-s		isearch-forward-regexp; begin incremental REGEXP search
;; C-M-r		isearch-backward-regexp; begin reverse incremental regexp search
;; about		regexp and non-regexp searches work independently, with separate search rings; use M-p and M-n
;; C-M-s RET	turn incremental into non-incremental REGEXP search; alternatively use command: re-search-forward
;; about		searches ignore the case of the text, if the search string is in 'lower case'
;; about		however, an upper-case letter anywhere in the search string makes the search case-sensitive
;; about		'list-matching-lines' is a synonym for: m-x occur
;; how-many		prompt for a regexp, and print the number of matches for it in the buffer after point
;; about		setting var 'isearch-lazy-count' shows the total number of matches and current number
;; M-% string RET newstring RET		replace some occurrences of string with newstring in a presentation-style
;; C-M-% regexp RET newstring RET	replace some matches for regexp with newstring in a presentation-style
;; use C-h or F1 to view all the options
;; END-SEARCHING

;; LINGO
;; char, line, word, sentence, paragraph, region, page, sexp, list, defun, rect, buffer,
;; frame, window, face, file, dir, register, mode, beginning, end, forward, backward,
;; next, previous, up, down, search, goto, kill, delete, mark, insert, yank, fill, indent,
;; case, change, set, what, list, find, view, describe, default, point, killring, fringe,
;; prefix-key, key keysequence keychord, universal argument, numeric argument, dired,
;; markring, last-yank-pointer, primary selection, system clipboard for applications,
;; rectangle-region aka columnselection aka vertical block, linear text, narrowing, view mode,
;; fontlock mode, fringes, truncation/continuation, logicalline/screenline, fill-column indicator,
;; trailing whitespace, selective-display (concept van outlining alleen nuttig in orgmode mi),
;; load-path/load-file, require, provide, characterset, complemented characterset (negatie-set of inverse-set),
;; lax spacematching, casefolding, characterfolding, garbage collection, interactive spellchecking,
;; keyboard macroring, expansion aka 'variable substitution', quoted filename quoted with ‘/:’,
;; tree-sitter parsing library, largefile, file archives dired mode, siblingfiles, simultaneous editing, lockfile,
;; autosave feature, auto-save file, timestamps, reverting (file/read-from-disk aot diredbuffer/refresh),
;; autoreverting (logfiles), hunkheader/fileheader, tar-mode, tar-buffer, remote-file, tramp, quoted filenames,
;; file-cache, ffap (an extended find-file command), image-mode, file-set, recentf mode, hook, kill-buffer-hook,
;; hookfunctions, midnightmode, customization-buffer, the buffermenu, indirect buffer, base-buffer,
;; vertical divider, tabline (buffers), tabbar (window-configs), client-side fonts, server-side fonts,
;; speedbar, x-server display (connect to another display, remoty/networky), (local) multi-monitor display ==> make-frame-on-monitor,
;; default-frame-alist, initial-frame-alist, X resources, desktop-library/desktop-file (save and restore a session),
;; scrollbar, vertical border, window dividers, tab-bar-mode (implicitly enabled on opening a tab), tab-bar-show,
;; tooltip-mode, mouse-avoidance-mode, xterm-mouse-mode, gpm-mouse-mode, gpm-server, dialogboxes aot echo-area.
;; END-LINGO

;; TABLINE
;; C-x t 2		add a new tab (tab-new)
;; C-x t b		select buffer bufname in another tab (switch-to-buffer-other-tab)
;; C-x t f		visit the file filename and select its buffer in another tab (find-file-other-tab)
;; C-x t d		edit the specified directory in another tab (dired-other-tab)
;; about		by default, a new tab starts with the buffer that is current
;; C-x t 0		close the selected tab (tab-close)
;; C-x t 1		close all tabs, except the selected tab, on the selected frame
;; C-TAB		switch to the next tab (tab-next) ==> alternative: C-x t o
;; C-x t r		rename the current tab to tabname (tab-rename)
;; C-x t m		move the current tab one position to the right (tab-move)
;; about		a tab has a tab-number that can be shown besides the tabname
;; about		switch to the tab by pressing the (set) modifierkey and the tab-number (tab-select)
;; about		tab-modifierkey-9 = lasttab; tab-modifierkey-0 = recenttab
;; about		you can use the mouse to operate on tabs; clicking mouse-2 closes the tab;
;; about		clicking mouse-3 pops up a context menu with the items that operate on the clicked tab;
;; about		dragging the tab with mouse-1 moves it to another position on the tab bar;
;; END-TABLINE

;; INTERACTIVE-HIGHLIGHTING
;; highlight-changes-mode	'highlightchanges-mode' highlights parts of the buffer that were changed recently
;; also: 'hiLock-mode' is a minor mode that highlights text that matches phrases or regular expressions you specify
;; m-s h p phrase RET	highlight matches of phrase (highlight-phrase); in a phrase a space is treated as a normal character
;; m-s h u regexp RET	unhighlight phrase or regexp (unhighlight-regexp)
;; END-INTERACTIVE-HIGHLIGHTING

;; NARROWING-WIDENING
;; C-x n n		narrow down between point and mark (narrow-to-region)
;; C-x n w		widen to make the entire buffer accessible again (widen)
;; C-x n p		narrow down to the current page (narrow-to-page)
;; C-x n d		narrow down to the current defun (narrow-to-defun)
;; END-NARROWING-WIDENING

;; HELP
;; c-h c describe key briefly
;; c-h b describe bindings (listed vanuit minor mode context naar meer globaal)
;; c-h p finder-by-keyword (packages gerubriceerd op keyword)
;; c-h a apropos-command (zoek commandos bij een gegeven topic)
;; c-h w where-is (command ==> key)
;; c-h r info-emacs-manual
;; c-h i info
;; c-h F command-info-manual
;; c-h m specific help about current mode(s) in use
;; c-h d apropos-documentation; function and variables; documentationstrings
;; c-h . display-local-help (at point)
;; c-h l view-lossage (all previously entered commands, a history)
;; c-h c-f view-emacs-faqs
;; c-h c-e view-external-packages
;; c-x c-h help for key c-x, or alternatively c-x F1
;; c-h c-h help for key c-h, or alternatively c-h F1
;; c-c c-c show all documentation about the symbol at point (help-follow-symbol)
;; END-HELP

;; DESCRIBE
;; describe-variable c-h v
;; describe-function c-h f
;; describe-command c-h x
;; describe-key c-h k
;; describe-package c-h P
;; END-DESCRIBE

;; COMMANDS
;; shortdoc ==> short documentation for functions in a given functiongroup
;; list-packages
;; comment-region; uncomment region; een geheel blok als commentaar markeren
;; view-lossage; toon historie van laatst gebruikte keys en commands
;; eval-region (eval lisp code)
;; eval-buffer
;; string-insert-rectangle; 'insert' string on each line of the rectangle/block
;; string-rectangle; 'replace' rectangle contents with string on each line
;; list-faces-display; to see what faces are CURRENTLY defined; eg.: search the face for 'region'
;; list-colors-display
;; display-fill-column-indicator-mode (hulpje/mode bij programmeren)
;; delete-trailing-whitespace; delete all trailing whitespace
;; whitespace-mode; samenhangend globallish var 'whitespace-style' (bijvoorbeeld: show 'tab-mark')
;; individual elements can be toggled in the CURRENT buffer by typing via m-x: whitespace-toggle-options
;; toggle-truncate-lines c-x x t	(for current buffer)
;; replace-string; replaces every occurrence of a string unconditionally (exact matches)
;; replacement happens in the text after point, so if you want to cover the whole buffer, go to the beginning first;
;; however, when the region is active, replacement is limited to the region only
;; replace-regexp; replaces any match for a specified regular expression pattern
;; unlike incremental search, the replacement commands do not use lax spacematching for the searchstring, by default
;; if 'case-fold-search' is set to nil, case is always significant in all searches
;; when the second argument of a replace is all or partly lowercase, replacement tries to preserve the casepattern of an occurrence
;; flush-lines; prompt for a regexp, and delete each line that contains a match for it, operating on the text after point
;; keep-lines; prompt for a regexp, and delete each line that does not contain a match for it, operating on the text after point
;; kill-matching-lines
;; copy-matching-lines
;; recover-file (autosave should be enabled)
;; recover-session (autosave should be enabled)
;; revert-buffer-quick; C-x x g (een snellere versie van revert-buffer)
;; clone-indirect-buffer; create an indirect buffer that is a twin copy of the current buffer
;; END-COMMANDS

;; QUITTING
;; q		special helpwindow containing a helpbuffer
;; ESC		mini-buffer dialogs
;; C-g		cancel (many commands/dialogs)
;; C-c		end a process (linux general)
;; C-c C-c	sometimes needed for a thougher approach
;; END-QUITTING

;; DIFFEN
;; about: diff-mode is a major mode used for the output of M-x ediff and similar commands
;; about: changes specified in a patch are grouped into hunks, which are contiguous chunks of text that contain one or more changed lines;
;; about: hunks usually also include unchanged lines to provide context for the changes
;; ediff (compare 2 files; builtin tool)
;; diff-buffer-with-file
;; diff-backup; compares a specified file with its most recent backup
;; diff-buffers; compares the contents of two specified buffers
;; compare-windows; compares the text in the current window with that in the window that was the selected window before
;; END-DIFFEN

;; BULK-RENAMING
;; about: an instruction that shows making 25 files and then renaming the filenames
;; in a terminal make 25 files in current dir: seq 25 | xargs -I {} touch foo{}.txt
;; use a dired-buffer for renaming the 25 files; these are the four steps:
;; step 1: set dired in 'writemode', via m-x: wdired-change-to-wdired-mode
;; step 2: make a visual block for selecting the files: C-x SPC (now make a 'rectangle')
;; step 3: m-x: string-rectangle (replace the contents of the rectangle)
;; step 4: save the operations and finish wdired-mode, m-x: wdired-finish-edit
;; about: instead of replacing there is also a command for 'inserting': string-insert-rectangle
;; END-BULK-RENAMING

;; KODE
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(bookmark-save-flag 1)
 '(bookmark-sort-flag 'last-modified)
 '(column-number-mode t)
 '(completion-auto-select 'second-tab)
 '(completion-styles '(basic partial-completion emacs22 flex initials substring))
 '(cua-mode t)
 '(delete-by-moving-to-trash t)
 '(delete-old-versions t)
 '(delete-selection-mode t)
 '(desktop-save nil)
 '(desktop-save-mode t)
 '(display-line-numbers 'relative)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-mode t)
 '(electric-indent-mode t)
 '(fast-but-imprecise-scrolling t)
 '(frame-resize-pixelwise t)
 '(global-auto-revert-mode t)
 '(global-display-line-numbers-mode t)
 '(global-hi-lock-mode t)
 '(global-hl-line-mode t)
 '(global-visual-line-mode t)
 '(help-window-select t)
 '(icomplete-mode nil)
 '(icomplete-vertical-mode t)
 '(indent-tabs-mode t)
 '(inhibit-startup-screen t)
 '(isearch-lazy-count t)
 '(isearch-yank-on-move 'shift)
 '(mouse-autoselect-window 0.25)
 '(mouse-drag-copy-region t)
 '(org-return-follows-link t)
 '(org-support-shift-select t)
 '(package-selected-packages
   '(php-mode web-mode doom-themes neotree rainbow-mode vterm-toggle vterm diminish all-the-icons-dired all-the-icons sudo-edit rainbow-delimiters drag-stuff org-bullets toc-org which-key general))
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(scroll-bar-mode nil)
 '(show-trailing-whitespace t)
 '(suggest-key-bindings 6)
 '(tab-always-indent nil)
 '(tab-bar-select-tab-modifiers '(control))
 '(tab-bar-show 1)
 '(tab-bar-tab-hints t)
 '(tab-line-tabs-function 'tab-line-tabs-mode-buffers)
 '(tab-width 4)
 '(trash-directory "~/.local/share/Trash/files/")
 '(version-control t)
 '(whitespace-style '(face trailing tabs tab-mark))
 '(window-divider-default-places 'right-only)
 '(window-divider-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-changes ((t (:foreground "spring green"))))
 '(highlight-changes-1 ((t (:foreground "cyan"))) t)
 '(highlight-changes-2 ((t (:foreground "green yellow"))) t)
 '(highlight-changes-3 ((t (:foreground "white smoke"))) t)
 '(highlight-changes-5 ((t (:foreground "indian red"))) t)
 '(highlight-changes-6 ((t (:foreground "navajo white"))) t)
 '(highlight-changes-delete ((t (:foreground "light coral"))))
 '(mode-line ((t nil)))
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
 '(region ((t (:extend t :background "slate blue"))))
 '(trailing-whitespace ((t (:background "indian red"))))
 '(whitespace-tab ((t (:background "#5f5f5f" :foreground "orchid")))))

;; disable menubar, toolbar and scrollbar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; start every frame maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; my package-manager is native 'package.el'
;; packagerepo to be used = [melpa]
;; initialize the native package-manager
;; do only occasionally a 'package-refresh-contents', as it delays startup significantly (commented out most of the time)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; (package-refresh-contents)

;; dired-homefolder as initial buffer
;; (setq initial-buffer-choice "~/")

;; delete by moving to trash: path
(setq delete-by-moving-to-trash t
	  trash-directory "~/.local/share/Trash/files/")

;; replace longversion yes-no-prompt by a shorthand
(fset 'yes-or-no-p 'y-or-n-p)

;; themes
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  ;; enable custom neotree theme; all-the-icons must be installed
  (doom-themes-neotree-config)
  ;; corrects (and improves) org-mode's native fontification
  (doom-themes-org-config))

(load-theme 'alect-dark t) ;; approved: doom-one, alect-dark

;; after opening existing file goto last edit-position
(save-place-mode 1)

;; kill a single line when no active region exists; C-w
(defadvice kill-region (before slick-cut activate compile)
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
	 (message "Just killed a line...")
     (list (line-beginning-position) (line-beginning-position 2)))))

;; copy a single line when no active region exists; M-w
(defadvice kill-ring-save (before slick-copy activate compile)
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (message "Copied current line...")
     (list (line-beginning-position) (line-beginning-position 2)))))

;; loadfile user-init-file
(defun rpa/load-file-init ()
  (interactive)
  (load-file user-init-file))

;; open user-init-file
(defun rpa/visit-init ()
  (interactive)
  (find-file user-init-file))

;; eval-buffer, with notification in echo-area
(defun rpa/eval-buffer ()
  (interactive)
  (eval-buffer)
  (message "Evaluated this buffer..."))

;; override C-x k naar kill 'THIS' buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; which-key
(require 'which-key)
(which-key-mode)

;; orgmode - toc
(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable)
)

;; orgmode - orgbullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; minibuffer-escape by a single ESC (not three, dude come on...)
(global-set-key [escape] 'keyboard-escape-quit)

;; location backupfiles
(setq backup-directory-alist '((".*" . "~/.local/share/Trash/files")))

;; about moving words and lines:
;; in standard-emacs M-t 'transposes the word' where point is at; no selection needed for this builtin feature
;; when point on first char: move to front
;; when point on other char: move to back
;; however you need 'drag-stuff' to move a region (selection) with M-up, M-down, M-left, M-right
(use-package drag-stuff
  :init
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))

;; rainbow delimiters; kleurgeven aan haakjesparen
(use-package rainbow-delimiters
  :hook ((emacs-lisp-mode . rainbow-delimiters-mode)
         (clojure-mode . rainbow-delimiters-mode)))

;; some other 'sane defaults' taken over from dt
(electric-pair-mode 0)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq pop-up-windows nil)

;; disable auto-save (but not auto-backup)
(setq auto-save-default nil)

;; org-tempo (not a package, but a module within org)
;; org-tempo allows for '<s' followed by a Tab, to expand to a '#+begin_src' tag
(require 'org-tempo)
;; fix for a minor issue involving putting a closing '>' after the '#+end_src' tag, which is not correct syntax
(add-hook 'org-mode-hook (lambda ()
           (setq-local electric-pair-inhibit-predicate
                   `(lambda (c)
                  (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))

;; zooming in/out, a tiny more convenient
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;; sudo-edit; open files with sudo privileges or switchover to sudo privileges if we opened the file without sudo
(use-package sudo-edit
  :ensure t)

;; all the icons; an iconset that can be used with dired, ibuffer, dashboard and other emacs-programs
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :diminish
  :hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))

;; diminish (remove a mode from the modeline)
(use-package diminish
  :ensure t)

;; vterm (aka emacs-libvterm)
;; vterm is a terminal emulator inside emacs based on libvterm, a c-library; it uses compiled code (instead of elisp)
;; dependencies: cmake, libtool-bin, libvterm-dev (on some systems it is called: 'libvterm')

(use-package vterm
:ensure t
:config
(setq shell-file-name "/bin/sh"
      vterm-max-scrollback 5000))

;; rainbowmode
(use-package rainbow-mode
  :ensure t
  :diminish
  :hook org-mode prog-mode)

;; neotree
(use-package neotree
  :ensure t
  :config
  (setq neo-smart-open t
        neo-show-hidden-files t
        neo-window-width 55
        neo-window-fixed-size nil
        inhibit-compacting-font-caches t)
        ;; truncate long file names in neotree
        (add-hook 'neo-after-create-hook
           #'(lambda (_)
               (with-current-buffer (get-buffer neo-buffer-name)
                 (setq truncate-lines t)
                 (setq word-wrap nil)
                 (make-local-variable 'auto-hscroll-mode)
                 (setq auto-hscroll-mode nil)))))

;; language/mode support for extra programminglanguages
(use-package web-mode
  :ensure t)

(use-package php-mode
  :ensure t)

;; open current buffer in standard webbrowser
(defun open-in-browser()
  (interactive)
  (let ((filename (buffer-file-name)))
    (browse-url (concat "file://" filename))))

;; show absolute path of filename
(setq-default frame-title-format "%b (%f)")

;;---------------------------------------------------------------------------

;; cfg-additions above this line, because bindings need to be 'last-in-order'
;; keybindings via package GENERAL.EL
(require 'general)
(defconst my-leader "C-c")
(general-create-definer rpa-leader-def
  :prefix my-leader)
;; global keybindings
(rpa-leader-def
  "1" 'highlight-changes-mode
  "7" 'open-in-browser
  "8" 'customize
  "9" 'revert-buffer

  "l" 'rpa/load-file-init
  "i" 'rpa/visit-init
  "e" 'rpa/eval-buffer
  "w" 'whitespace-mode
  "t" 'tab-new
  "c" 'tab-close
  "k" 'comment-line ;; das Kommentar
  "v" 'vterm
  "n" 'neotree-toggle
  "b" 'ibuffer
  "s" 'bs-show
)
