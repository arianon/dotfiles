;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d")
   dotspacemacs-configuration-layers
   '(
     nim

     auto-completion
     better-defaults
     c-c++
     colors
     emacs-lisp
     fasd
     git
     github
     go
     html
     markdown
     org
     javascript
     ruby
     ruby-on-rails
     semantic
     shell
     syntax-checking
     unimpaired
     version-control
     yaml
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
   dotspacemacs-default-font '("Input Mono" :size 14 :weight normal :width normal :powerline-scale 1.1)
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

  ;; Spacemacs theming
  (custom-set-variables
   '(spacemacs-theme-comment-bg nil)
   '(spacemacs-theme-org-highlight nil)
   '(spacemacs-theme-custom-colors
     '((act1       . "#14181f")
       (act2       . "#1e242f")
       (base       . "#b7bdcc")
       (base-dim   . "#b9bbbe")
       (bg1        . "#0a0c10")
       (bg2        . "#14181f")
       (bg3        . "#363c4a")
       (bg4        . "#4d576b")
       (border     . "#0a0c10")
       ;; --- code blocks?
       (cursor     . "#b7bdcc")
       (comment    . "#363c4a")
       (comment-bg . "#0a0c10") ;; This shouldn't be here
       (comp       . "#8fa1b3")

       (const      . "#994e55")
       (err        . "#bf616a")
       (func       . "#778f8e")
       (highlight  . "#a6aab2")
       (keyword    . "#8f7189")
       (lnum       . "#14181f")
       (mat        . "#c5aa75")
       (str        . "#994e55")
       (suc        . "#a3be8c")
       (var        . "#707e8c")
       (war        . "#ebcb8b")
       (type       . "#849971")))

   )

  )

(defun dotspacemacs/user-config ()
  (setq-default
   powerline-default-separator 'arrow
   avy-all-windows 'all-frames

   inhibit-startup-screen t
   initial-major-mode 'ruby-mode
   initial-scratch-message "#!/usr/bin/ruby -wU\n# -*- coding: utf-8 -*-\n"

   evil-move-cursor-back nil
   )

  (global-hungry-delete-mode)
  (aggressive-indent-global-mode)
  (rainbow-mode)

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
        "os" 'c-set-style)))

  (mapc
   (lambda (face)
     (set-face-attribute face nil :weight 'normal ))
   (face-list))

  (use-package helm-flycheck
    :defer t
    :if (configuration-layer/layer-usedp 'syntax-checking)
    :config
    (spacemacs/set-leader-keys "eh" 'helm-flycheck))

  (use-package sh-mode
    :mode (("Pkgfile\\'" . sh-mode)
           ("\\.zsh\\'" . sh-mode)))

  (use-package super-save
    :config
    (progn
      (add-to-list 'super-save-triggers 'select-window)
      (super-save-advise-trigger-commands)
      (super-save-initialize)))
  )
