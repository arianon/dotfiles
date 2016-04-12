;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d")
   dotspacemacs-configuration-layers
   '(
     html
     ;; csv
     shell-scripts
     markdown
     ;; ansible
     ;; javascript
     auto-completion
     c-c++
     colors
     ;; emacs-lisp
     git
     org
     ;; javascript
     ;; python
     ruby
     ;; ruby-on-rails
     ;; semantic
     shell
     ;; shell-scripts
     syntax-checking
     yaml
     evil-cleverparens
     )
   dotspacemacs-additional-packages '(
                                      super-save
                                      )
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim ;; 'hybrid?
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil ;; 'official
   dotspacemacs-startup-lists '(recents bookmarks projects)
   dotspacemacs-themes '(spacemacs-dark spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("ariafont" :size 10 :weight normal :width normal :powerline-scale 1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-RET"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "M-p"
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize t
   dotspacemacs-helm-no-header t
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state t
   dotspacemacs-which-key-delay 0.5 ;; 0.1?
   dotspacemacs-which-key-position 'right-then-bottom
   dotspacemacs-loading-progress-bar nil
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server t
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  (setq-default custom-file "~/.spacemacs.d/.custom.el")

  (custom-set-variables
   '(spacemacs-theme-comment-bg nil)
   '(spacemacs-theme-org-highlight nil)
   '(spacemacs-theme-org-height nil)
   '(spacemacs-theme-custom-colors
     '(
       ;; UI            MINE         ORIG
       (act1        . "#000000") ; #121212
       (act2        . "#222222") ; #444444
       (base        . "#ffffff") ; #b2b2b2
       (base-dim    . "#dddddd") ; #585858
       (bg1         . "#000000") ; #262626
       (bg2         . "#151515") ; #1c1c1c
       (bg3         . "#2a2a2a") ; #121212
       (bg4         . "#333333") ; #080808
       (border      . "#000000") ; #111111
       (comment-bg  . "#000000") ; #262626
       (cursor      . "#d0d0d0") ; #d0d0d0
       (highlight   . "#222222") ; #444444
       (lnum        . "#222222") ; #444444

       ;; CODE
       (comment     . "#777777") ; #008787
       (const       . "#d54e53") ; #d75fd7
       (err         . "#ff0000") ; #e0211d
       (func        . "#b9ca4a") ; #d75fd7
       (keyword     . "#7aa6da") ; #268bd2
       (str         . "#e78c45") ; #2aa198
       (type        . "#e7c547") ; #df005f
       (var         . "#c397d8") ; #8787d7

       ;; ORG
       (cblk        . "#ffffff") ; #b2b2b2
       (cblk-bg     . "#000000") ; #262626
       (cblk-ln     . "#af5faf") ; #af5faf
       (cblk-ln-bg  . "#333333") ; #333333
       (head1       . "#268bd2") ; #268bd2
       (head1-bg    . "#000000") ; #262626
       (head2       . "#2aa198") ; #2aa198
       (head2-bg    . "#000000") ; #262626
       (head3       . "#67b11d") ; #67b11d
       (head3-bg    . "#000000") ; #262626
       (head4       . "#875f00") ; #875f00
       (head4-bg    . "#000000") ; #262626

       ;; MISC
       (comp        . "#7aa6da") ; #d75fd7
       (mat         . "#86dc2f") ; #86dc2f
       (meta        . "#af875f") ; #af875f
       (suc         . "#86dc2f") ; #86dc2f
       (ttip        . "#888888") ; #888888
       (ttip-bg     . "#222222") ; #444444
       (ttip-sl     . "#333333") ; #333333
       (war         . "#dc752f") ; #dc752f

       ;; COLORS
       (aqua        . "#2aa198") ; #2aa198
       (aqua-bg     . "#000000") ; #262626
       (green       . "#67b11d") ; #67b11d
       (green-bg    . "#000000") ; #262626
       (green-bg-s  . "#000000") ; #262626
       (cyan        . "#00ffff") ; #00ffff
       (red         . "#d70000") ; #d70000
       (red-bg      . "#000000") ; #262626
       (red-bg-s    . "#000000") ; #262626
       (blue        . "#268bd2") ; #268bd2
       (blue-bg     . "#000000") ; #262626
       (violet      . "#af00df") ; #af00df
       (yellow      . "#875f00") ; #875f00
       (yellow-bg   . "#000000") ; #262626
       )))
  )

(defun dotspacemacs/user-config ()
  (setq-default
   powerline-default-separator 'arrow
   avy-all-windows 'all-frames

   ;; inhibit-startup-screen t
   ;; initial-major-mode 'ruby-mode
   ;; initial-scratch-message "#!/usr/bin/ruby -wU\n# -*- coding: utf-8 -*-\n"

   evil-move-cursor-back nil
   )

  (global-hungry-delete-mode)
  (spacemacs/toggle-aggressive-indent-globally-on)

  (if (configuration-layer/layer-usedp 'colors)
      (rainbow-mode))

  (define-key evil-normal-state-map "H" "^")
  (define-key evil-normal-state-map "L" "$")

  ;; C theming
  (if (configuration-layer/layer-usedp 'c-c++)
      (c-add-style
       "arianon"
       '((indent-tabs-mode . t)
         (c-basic-offset . 4)
         (c-hanging-braces-alist
          (substatement-open before after)
          (brace-list-open)
          (brace-list-open))
         (c-offsets-alist
          (substatement-open . 0)
          (inline-open . 0)
          (statement-cont . c-lineup-assignments)
          (inextern-lang . 0)
          (innamespace . 0))))

    (dolist (mode '(c-mode c++-mode))
      (spacemacs/set-leader-keys-for-major-mode mode
        "os" #'c-set-style)))

  (use-package super-save
    :config
    (progn
      (super-save-initialize)))

  (if (configuration-layer/layer-usedp 'evil-cleverparens)
      (spacemacs/toggle-evil-cleverparens-on))
  )
