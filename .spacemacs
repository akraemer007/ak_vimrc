;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
;; clean example of dotspacemacs https://github.com/kwrooijen/.spacemacs.d/blob/master/init.el

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(sql
     (python :variables python-formatter 'black)
     scala
     markdown
     graphviz
     scheme
     racket
     octave
     javascript
     scala
     ipython-notebook
     csv
     html
     vimscript
     helm
     auto-completion
     ;; better-defaults
     common-lisp
     emacs-lisp
     git
     markdown
     org
     ;; themes-megapack
     (spell-checking :variables
                     spell-checking-enable-by-default nil)
     (syntax-checking :variables
                      syntax-checking-enable-by-default nil)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; version-control
     )
   dotspacemacs-additional-packages '(blacken
                                      (jedi :location elpa)
                                      ;; lispy
                                      ;; lispyville
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only)
  )

 (defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the currnt branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(nord
                         spacemacs-dark
                         spacemacs-light
                         wheatgrass
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;;PERSONAL HOTKEYS
  ;; gets rid of pesky buffers
  (spacemacs/set-leader-keys "b k" 'kill-buffer-and-window)

  ;; fast register changea
  (spacemacs/set-leader-keys "o r" 'jump-to-register)
  (spacemacs/set-leader-keys "o R" 'window-configuration-to-register)

  ;; golden ratio hotkey
  (spacemacs/set-leader-keys "o g" 'golden-ratio)

  ;; inserts src_sections for viz in orgmode
  (spacemacs/set-leader-keys "o b" 'insert-bable)
  (spacemacs/set-leader-keys "o o" 'air-pop-to-org-agenda)
  ;; (define-key org-agenda-mode-map "J" 'air-org-agenda-next-header)
  ;; (define-key org-agenda-mode-map "K" 'air-org-agenda-previous-header)

  (setq nord-comment-brightness 15)

  (defun insert-bable ()
    "inserts src_sections for viz in orgmode"
    (interactive)
    (insert "#+begin_src "
            (read-string "Enter Language (R, python, lisp): ")
            (if (equal (read-string "Return Viz (y/n) ") "y")
                " :results output graphics :file img.png"
              ""))
    (insert "\n \n#+end_src"))

  ;; quick open gtd file
  (global-set-key (kbd "C-c i")
                  (lambda () (interactive) (find-file "~/Dropbox/org/inbox.org")))
  (global-set-key (kbd "C-c o")
                  (lambda () (interactive) (find-file "~/Dropbox/org/gtd.org")))
  (global-set-key (kbd "C-c n")
                  (lambda () (interactive) (find-file "~/Dropbox/org/notes.org")))

  ;; default notes file
  (setq org-default-notes-file "~/Dropbox/org/inbox.org")

  ;;should fix M-RET but doesn't
  (with-eval-after-load 'org 
    (org-defkey org-mode-map [(meta return)] 'org-meta-return)  ;; The actual fix
    )

  (defun kill-buffer-and-window ()
    "Run `kill-this-buffer' and `delete-window' in sequence."
    (interactive)
    (kill-this-buffer)
    (delete-window))

  ;; set todos with t
  (setq evil-org-key-theme '(textobjects navigation additional insert todo))

  ;; TODO Keywords
  (setq org-todo-keywords
        (quote ((sequence "NEXT(n)" "TODO(t)" "WAITING(w@/)" "IN_PROGRESS(i)" "DONE(d)"))))

  ;; I picked up this neat trick from the Venerable Sacha Chua
  (defvar my/org-meeting-template "** Meeting about %^{something}
    SCHEDULED: %<%Y-%m-%d %H:%M>

    *Attendees:*

    - [X] Nick Anderson
    - [ ] %?

    *Agenda:*
    -
    -

    *Notes:*

    " "Meeting Template")

  ;; add org habit
  (with-eval-after-load 'org
    (add-to-list 'org-modules 'org-habit t))
  (setq org-habit-show-all-today t)
  ;; Configure custom capture templates
  (setq org-capture-templates
      `(;; Note the backtick here, it's required so that the defvar based tempaltes will work!
        ;;http://comments.gmane.org/gmane.emacs.orgmode/106890

        ("c" "Capture" entry (file+headline "~/Dropbox/org/inbox.org" "Tasks")
          "** %^{Task Description}" :prepend t)
        ("t" "To-do" entry (file+headline "~/Dropbox/org/inbox.org" "Tasks")
          "** TODO [#%^{priority}] %^{Task Description}" :prepend t)
        ("m" "Meeting" entry (file+headline "~/Dropbox/org/meetings.org" "Meeting Notes")
         ,my/org-meeting-template)
        ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")
  ))

  ;; non prioritized tasks will be sorted to d
  (setq org-lowest-priority ?D)
  (setq org-default-priority ?D)
  (setq org-agenda-sorting-strategy
        '((agenda time-up priority-down tag-up category-keep effort-up)
          ;; (todo user-defined-up todo-state-up priority-down effort-up)
          (todo todo-state-up priority-down effort-up) 
          (tags user-defined-up)
          (search category-keep)))

  ;; https://blog.aaronbieber.com/2016/09/24/an-agenda-for-life-with-org-mode.html
  ;; custom agenda view and supporting functions
  (defun air-org-skip-subtree-if-habit ()
    "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (if (string= (org-entry-get nil "STYLE") "habit")
          subtree-end
        nil)))

  (defun air-org-skip-subtree-if-priority (priority)
    "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
    (let ((subtree-end (save-excursion (org-end-of-subtree t)))
          (pri-value (* 1000 (- org-lowest-priority priority)))
          (pri-current (org-get-priority (thing-at-point 'line t))))
      (if (= pri-value pri-current)
          subtree-end
        nil)))
  (setq org-agenda-custom-commands
        '(("d" "Daily agenda and all TODOs"
           ((tags "PRIORITY=\"A\""
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                   (org-agenda-overriding-header "High-priority unfinished tasks:")))
            (agenda "test" ((org-agenda-ndays 1)
                        (org-agenda-overriding-header "ALL normal priority tasks:")))
            (tags (or "PRIORITY=\"B\"" "PRIORITY=\"C\"")
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                   (org-agenda-overriding-header "Unfinished tasks:")))
            (alltodo ""
                     ((org-agenda-skip-function '(or (air-org-skip-subtree-if-habit)
                                                     (air-org-skip-subtree-if-priority ?A)
                                                     (air-org-skip-subtree-if-priority ?B)
                                                     (org-agenda-skip-if nil '(scheduled deadline))))
                      (org-agenda-overriding-header "Eventually:"))))
           ;; ((org-agenda-compact-blocks t)) ;; removes = breaks
           )))

  ;; AGENDA GO TO THE NEXT HEADER
  (defun air-org-agenda-next-header ()
  "Jump to the next header in an agenda series."
    (interactive)
    (air--org-agenda-goto-header))

  (defun air-org-agenda-previous-header ()
    "Jump to the previous header in an agenda series."
    (interactive)
    (air--org-agenda-goto-header t))

  (defun air--org-agenda-goto-header (&optional backwards)
    "Find the next agenda series header forwards or BACKWARDS."
    (let ((pos (save-excursion
                 (goto-char (if backwards
                                (line-beginning-position)
                              (line-end-position)))
                 (let* ((find-func (if backwards
                                       'previous-single-property-change
                                     'next-single-property-change))
                        (end-func (if backwards
                                      'max
                                    'min))
                        (all-pos-raw (list (funcall find-func (point) 'org-agenda-structural-header)
                                           (funcall find-func (point) 'org-agenda-date-header)))
                        (all-pos (cl-remove-if-not 'numberp all-pos-raw))
                        (prop-pos (if all-pos (apply end-func all-pos) nil)))
                   prop-pos))))
      (if pos (goto-char pos))
      (if backwards (goto-char (line-beginning-position)))))

  (defun air-pop-to-org-agenda (&optional split)
    "Visit the org agenda, in the current window or a SPLIT."
    (interactive "P")
    (org-agenda nil "d")
    (when (not split)
      (delete-other-windows)))

  ;;agenda and refile
  (with-eval-after-load 'org (setq org-agenda-files
                                   '("~/Dropbox/org/")))
  (setq org-refile-targets '(
                             (nil :maxlevel . 4)             ; refile to headings in the current buffer
                             (org-agenda-files :maxlevel . 4) ; refile to any of these files
                             ))

  ;; INLINE CODE FOR ORGMODE ;;
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (python . t)))
  ;; put viz inline by default
  (setq org-startup-with-inline-images t)

  ;;racket settings
  (setq geiser-racket-binary "/Applications/Racket/bin/racket")
  ;; PYTHON SETTINGS ;;
  ;; (require 'bl)
  (setenv "WORKON_HOME" "~/anaconda3/envs")


  ;; LISP SETTINGS ;;
  ;; clever parens
  (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hooks)
  ;; lambda as lambda symbol
  (global-prettify-symbols-mode 1)
  ;; alwasy close parens even in SLIME
  (electric-pair-mode +1)

  ;; SLIME SETUP ;;
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
  (setq inferior-lisp-program "sbcl")
  ;; (setq inferior-lisp-program "clisp")
  (require 'slime)
  (slime-setup '(slime-fancy slime-tramp slime-asdf))
  (slime-require :swank-listener-hooks)

  ;;LATEX
  ;; increase size of inline and general latex
  (plist-put org-format-latex-options :scale 1.5)

  ;; PANDOC MAC FIX
  (setenv "PATH" (concat (getenv "PATH") ":/sw/bin"))
  (setq exec-path (append exec-path '("/sw/bin")))

  ;; TRAMP SPEED INCREASE
  (setq tramp-default-method "ssh")
  (setq remote-file-name-inhibit-cache nil)
  (setq vc-ignore-dir-regexp
        (format "%s\\|%s"
                vc-ignore-dir-regexp
                tramp-file-name-regexp))
  ;; (setq tramp-verbose 1)
  ;;projectile fix
  (setq projectile-enable-caching t)
  ;; http://gleek.github.io/blog/2017/04/11/editing-remote-code-with-emacs/ 
  (setq tramp-auto-save-directory "~/tmp/tramp/")
  (setq tramp-chunksize 2000)
  ;; TRAMP HELP FROM https://stackoverflow.com/questions/13997965/bizzarre-emacs-tramp-fix
  ;; (require 'tramp)
  ;; (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  ;; (setq tramp-default-method "ssh")
  ;; ;; Backup (file~) disabled and auto-save (#file#) locally to prevent delays in editing remote files
  ;; (add-to-list 'backup-directory-alist
  ;;              (cons tramp-file-name-regexp nil))
  ;; (setq tramp-auto-save-directory temporary-file-directory)
  ;; (setq tramp-verbose 10)



  ;; BLOG
  ;; (require 'ox-publish)
  ;; (require 'ox-html)
  ;; (defun add-html-file (arg)
  ;;   (with-temp-buffer
  ;;     (insert-file-contents arg)
  ;;     (buffer-string)))

  ;; (defun my-site-format-entry (entry style project)
  ;;   (format "[[file:%s][%s]] --- %s"
  ;;           entry
  ;;           (org-publish-find-title entry project)
  ;;           (format-time-string "%Y-%m-%d" (org-publish-find-date entry project))))

  ;; (setq my-site-project-path "~/projects/org_blog/")
  ;; (setq my-site-publish-path (concat my-site-project-path "_build/"))

  ;; (setq my-site-extra-head "<link rel='stylesheet' href='/static/main.css' />")
  ;; (setq my-site-header-file (concat my-site-project-path "templates/header.html"))
  ;; (setq my-site-footer-file (concat my-site-project-path "templates/footer.html"))

  ;; (setq org-publish-project-alist
  ;;       `(("site"
  ;;          :components ("site-static", "site-pages", "site-images", "site-articles", "site-dl"))
  ;;         ("site-static"
  ;;          :base-directory, (concat my-site-project-path "static/")
  ;;          :base-extension ".*"
  ;;          :publishing-directory, (concat my-site-publish-path "static/")
  ;;          :publishing-function org-publish-attachment
  ;;          :recursive t)

  ;;         ("site-images"
  ;;          :base-directory, (concat my-site-project-path "img")
  ;;          :base-extension ".*"
  ;;          :publishing-directory, (concat my-site-publish-path "img/")
  ;;          :publishing-function org-publish-attachment
  ;;          :recursive t)

  ;;         ("site-dl"
  ;;          :base-directory, (concat my-site-project-path "dl")
  ;;          :base-extension ".*"
  ;;          :publishing-directory, (concat my-site-publish-path "dl/")
  ;;          :publishing-function org-publish-attachment
  ;;          :recursive t)

  ;;         ("site-pages"
  ;;          :base-directory, (concat my-site-project-path "pages/")
  ;;          :base-extension "org"
  ;;          :publishing-directory, my-site-publish-path

  ;;          :html-link-home "/"
  ;;          :html-head nil
  ;;          :html-head-extra, my-site-extra-head
  ;;          :html-head-include-default-style nil
  ;;          :html-head-include-scripts nil
  ;;          :html-home/up-format ""

  ;;          :html-preamble, (add-html-file my-site-header-file)
  ;;          :html-postamble, (add-html-file my-site-footer-file)

  ;;          :makeindex nil
  ;;          :with-toc nil
  ;;          :section-numbers nil

  ;;          :publishing-function org-html-publish-to-html)

  ;;         ("site-articles"
  ;;          :base-directory, (concat my-site-project-path "articles/")
  ;;          :base-extension "org"
  ;;          :publishing-directory, (concat my-site-publish-path "blog/")

  ;;          :html-link-home "/"
  ;;          :html-head nil
  ;;          :html-head-extra ,my-site-extra-head
  ;;          :html-head-include-default-style nil
  ;;          :html-head-include-scripts nil
  ;;          :html-home/up-format ""

  ;;          :html-preamble, (add-html-file my-site-header-file)
  ;;          :html-postamble, (add-html-file my-site-footer-file)

  ;;          :makeindex nil
  ;;          :auto-sitemap t
  ;;          :sitemap-filename "index.org"
  ;;          :sitemap-title "Articles"
  ;;          :sitemap-style list
  ;;          :sitemap-sort-files anti-chronologically
  ;;          :sitemap-format-entry my-site-format-entry 
  ;;          :with-toc nil
  ;;          :section-numbers nil

  ;;          :publishing-function org-html-publish-to-html
  ;;          :recursive t)))







(require 'ox-publish)
(require 'org)
(require 'ox-html)
;; (require 'ox-rss)

(defun add-html-file (arg)
  (with-temp-buffer
    (insert-file-contents arg)
    (buffer-string)))

(setq my-site-extra-head "<link rel='stylesheet' href='/static/main.css' />")
(setq my-site-header-file (concat "~/projects/org_blog/" "templates/header.html"))
(setq my-site-footer-file (concat "~/projects/org_blog/" "templates/footer.html"))

;; (setq website-html-preamble
;;       "<h1 id=\"site-title\">Eric Evenchick</h1>
;;       <div id=\"nav\">
;;       <a href=\"/\">home</a>
;;       <a href=\"/blog/index.html\">blog</a>
;;       </div>")
(setq website-html-preamble
      "<h1>Richard Kallos</h1>
<hr></hr>
<div class=\"nav\">
<ul>
<li><a href=\"/\">Home</a></li>
<li><a href=\"/static/about.html\">About</a></li>
<li><a href=\"https://github.com/rkallos\">GitHub</a></li>
<li><a href=\"/static/resume.html\">Résumé</a></li>
<li><a href=\"/index.xml\">RSS</a></li>
</ul>
</div>")
(setq website-html-postamble "<div class=\"footer\"> Copyright 2016 %a (%v HTML).<br> Last updated %C.<br> Built with %c.  </div>")

(setq org-publish-project-alist
      '(("org-notes"
         :base-directory "~/projects/org_blog/static/general/"
         :base-extension "org"
         :publishing-directory "~/projects/org_blog/_blog"

         ;; :recursive t
         ;; :headline-levels 4             ; Just the default for this project.
         ;; :auto-preamble t
         :html-preamble ,website-html-preamble
         :html-postamble ,website-html-postamble

         :makeindex nil ;;check this one
         :with-toc nil
         :section-numbers nil

         :publishing-function org-html-publish-to-html)
        ;; ("org-static"
        ;;  :base-directory "~/projects/org_blog/static"
        ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
        ;;  :publishing-directory "~/projects/org_blog/_blog"
        ;;  :recursive t
        ;;  :publishing-function org-publish-attachment
        ;;  )
        ;; ("org" :components ("org-notes" "org-static"))
        ("org" :components ("org-notes"))
        )

        ;; ... add all the components here (see below)...

        )

;; emacs --script bort.el --funcall=org-publish-all
;; rm -r ~/.org-timestamps/*
  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "bf390ecb203806cbe351b966a88fc3036f3ff68cd2547db6ee3676e87327b311" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(evil-want-Y-yank-to-eol t)
 '(org-agenda-files (quote ("~/Dropbox/org/"))))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "bf390ecb203806cbe351b966a88fc3036f3ff68cd2547db6ee3676e87327b311" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(evil-want-Y-yank-to-eol t)
 '(org-agenda-files (quote ("~/Dropbox/org/")))
 '(package-selected-packages
   (quote
    (geiser sqlup-mode sql-indent doom-themes zones blacken nord-theme ws-butler writeroom-mode visual-fill-column winum volatile-highlights vi-tilde-fringe uuidgen treemacs-projectile treemacs-evil treemacs ht pfuture toc-org symon string-inflection spaceline-all-the-icons spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode password-generator paradox spinner overseer org-bullets open-junk-file nameless move-text macrostep lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state iedit evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens smartparens paredit evil-args evil-anzu anzu eval-sexp-fu elisp-slime-nav editorconfig dumb-jump doom-modeline shrink-path all-the-icons memoize f dash s define-word counsel-projectile projectile counsel swiper ivy pkg-info epl column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile packed aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core popup which-key use-package pcre2el org-plus-contrib hydra lv font-lock+ evil goto-chg undo-tree dotenv-mode diminish bind-map bind-key async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
