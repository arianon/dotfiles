;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/configure-org ()
  (setq-default

   org-agenda-files '("~/usr/org/evaluaciones.org")
   org-agenda-span 'week
   org-agenda-tags-column -100
   org-bullets-bullet-list '("*" ">" "+" "-")

   org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "DONE"))))

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d")
   dotspacemacs-configuration-layers
   '(
     c-c++

     typescript

     auto-completion
     evil-cleverparens

     ;; (spell-checking :variables
     ;;                 spell-checking-enable-by-default nil
     ;;                 spell-checking-enable-auto-dictionary t)

     latex
     html
     javascript
     shell-scripts
     markdown
     ;; colors
     emacs-lisp
     git
     org
     python
     ruby
     (shell :variables
            shell-default-shell 'eshell
            shell-enable-smart-eshell t)
     sql
     syntax-checking
     yaml
     )
   dotspacemacs-additional-packages '(
                                      muttrc-mode
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
   dotspacemacs-themes '(spacemacs-light spacemacs-dark)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("tewi" :size 11 :weight normal :width normal :powerline-scale 1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
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
   dotspacemacs-default-package-repository nil
   dotspacemacs-scratch-mode 'org-mode
   ))

(defun dotspacemacs/user-init ()
  (setq-default custom-file "~/.spacemacs.d/.custom.el")

  ;; (custom-set-variables
  ;;  '(spacemacs-theme-comment-bg nil)
  ;;  '(spacemacs-theme-org-highlight nil)
  ;;  '(spacemacs-theme-org-height nil)
  ;;  '(spacemacs-theme-custom-colors
  ;;    '(
  ;;      ;; UI            MINE         ORIG
  ;;      (act1        . "#000000") ; #121212
  ;;      (act2        . "#222222") ; #444444
  ;;      (base        . "#ffffff") ; #b2b2b2
  ;;      (base-dim    . "#dddddd") ; #585858
  ;;      (bg1         . "#000000") ; #262626
  ;;      (bg2         . "#151515") ; #1c1c1c
  ;;      (bg3         . "#2a2a2a") ; #121212
  ;;      (bg4         . "#333333") ; #080808
  ;;      (border      . "#000000") ; #111111
  ;;      (comment-bg  . "#000000") ; #262626
  ;;      (cursor      . "#d0d0d0") ; #d0d0d0
  ;;      (highlight   . "#222222") ; #444444
  ;;      (lnum        . "#222222") ; #444444
  ;;      ;; CODE
  ;;      (comment     . "#777777") ; #008787
  ;;      (const       . "#d54e53") ; #d75fd7
  ;;      (err         . "#ff0000") ; #e0211d
  ;;      (func        . "#b9ca4a") ; #d75fd7
  ;;      (keyword     . "#7aa6da") ; #268bd2
  ;;      (str         . "#e78c45") ; #2aa198
  ;;      (type        . "#e7c547") ; #df005f
  ;;      (var         . "#c397d8") ; #8787d7
  ;;      ;; ORG
  ;;      (cblk        . "#ffffff") ; #b2b2b2
  ;;      (cblk-bg     . "#999999") ; #262626
  ;;      (cblk-ln     . "#ffffff") ; #af5faf
  ;;      (cblk-ln-bg  . "#999999") ; #333333
  ;;      (head1       . "#268bd2") ; #268bd2
  ;;      (head1-bg    . "#000000") ; #262626
  ;;      (head2       . "#2aa198") ; #2aa198
  ;;      (head2-bg    . "#000000") ; #262626
  ;;      (head3       . "#67b11d") ; #67b11d
  ;;      (head3-bg    . "#000000") ; #262626
  ;;      (head4       . "#875f00") ; #875f00
  ;;      (head4-bg    . "#000000") ; #262626
  ;;      ;; MISC
  ;;      (comp        . "#7aa6da") ; #d75fd7
  ;;      (mat         . "#86dc2f") ; #86dc2f
  ;;      (meta        . "#af875f") ; #af875f
  ;;      (suc         . "#86dc2f") ; #86dc2f
  ;;      (ttip        . "#888888") ; #888888
  ;;      (ttip-bg     . "#222222") ; #444444
  ;;      (ttip-sl     . "#333333") ; #333333
  ;;      (war         . "#dc752f") ; #dc752f
  ;;      ;; COLORS
  ;;      (aqua        . "#2aa198") ; #2aa198
  ;;      (aqua-bg     . "#000000") ; #262626
  ;;      (green       . "#67b11d") ; #67b11d
  ;;      (green-bg    . "#000000") ; #262626
  ;;      (green-bg-s  . "#000000") ; #262626
  ;;      (cyan        . "#00ffff") ; #00ffff
  ;;      (red         . "#d70000") ; #d70000
  ;;      (red-bg      . "#000000") ; #262626
  ;;      (red-bg-s    . "#000000") ; #262626
  ;;      (blue        . "#268bd2") ; #268bd2
  ;;      (blue-bg     . "#000000") ; #262626
  ;;      (violet      . "#af00df") ; #af00df
  ;;      (yellow      . "#875f00") ; #875f00
  ;;      (yellow-bg   . "#000000") ; #262626
  ;;      )))

  )

(defun dotspacemacs/user-config ()
  (setq-default
   powerline-default-separator nil
   avy-all-windows 'all-frames

   evil-move-cursor-back nil
   confirm-nonexistent-file-or-buffer nil

   js2-basic-offset 2
   )

  (global-hungry-delete-mode)
  (spacemacs/toggle-aggressive-indent-globally-on)

  ;; (if (configuration-layer/layer-usedp 'colors)
  ;;     (rainbow-mode))

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

  (dotspacemacs/configure-org)
  )
