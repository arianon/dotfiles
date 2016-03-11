;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d")
   dotspacemacs-configuration-layers
   '(
     auto-completion
     ;; better-defaults
     ;; c-c++
     ;; colors
     ;; emacs-lisp
     ;; fasd
     git
     ;; github
     ;; go
     ;; rust
     html
     ;; markdown
     ;; org
     javascript
     ;; python
     ruby
     ;; ruby-on-rails
     ;; semantic
     shell
     ;; shell-scripts
     syntax-checking
     ;; unimpaired
     ;; yaml
     ;; evil-cleverparens
     )
   dotspacemacs-additional-packages '(
                                      helm-flycheck
                                      super-save
                                      )
   dotspacemacs-excluded-packages '(persp-mode)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim ;; 'hybrid?
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil ;; 'official
   dotspacemacs-startup-lists '(recents bookmarks projects)
   dotspacemacs-themes '(spacemacs-light spacemacs-dark)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Liberation Mono" :size 14 :weight normal :width normal :powerline-scale 1.1)
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
  (aggressive-indent-global-mode)

  (if (configuration-layer/layer-usedp 'colors)
      (rainbow-mode))

  (define-key evil-normal-state-map "H" "^")
  (define-key evil-normal-state-map "L" "$")

  ;; C theming
  (if (configuration-layer/layer-usedp 'c-c++)
      (c-add-style "arianon"
                   '((indent-tabs-mode . t)
                     (c-basic-offset . 4)
                     (c-hanging-braces-alist (substatement-open before after)
                                             (brace-list-open)
                                             (brace-list-open))
                     (c-offsets-alist (substatement-open . 0)
                                      (inline-open . 0)
                                      (statement-cont . c-lineup-assignments)
                                      (inextern-lang . 0)
                                      (innamespace . 0))))

    (dolist (mode '(c-mode c++-mode))
      (spacemacs/set-leader-keys-for-major-mode mode
        "os" #'c-set-style)))

  (use-package helm-flycheck
    :defer t
    :if (configuration-layer/layer-usedp #'syntax-checking)
    :config
    (spacemacs/set-leader-keys "eh" #'helm-flycheck))

  (use-package super-save
    :config
    (progn
      (super-save-initialize)))

  (if (configuration-layer/layer-usedp 'evil-cleverparens)
      (spacemacs/toggle-evil-cleverparens-on))
  )
