(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))

(deftheme arianon "My personal theme for Emacs.")

(let ((background "#000000")
      (background+1 "#222222")
      (background+2 "#444444")

      (foreground "#dddddd")
      (foreground+1 "#cccccc")
      (foreground+2 "#bbbbbb")

      (red "#d33")
      (red+1 "#f22")

      (yellow "#c5aa75")
      (yellow+1 "#ebcb8b")

      (blue "#707e8c")
      (blue+1 "#8fa1b3")

      (cyan "#778f8e")
      (cyan+1 "#96b5b4")

      (green "#849971")
      (green+1 "#a3be8c")

      (magenta "#8f7189")
      (magenta+1 "#b48ead"))
  (custom-theme-set-faces
   'arianon

   ;;UI
   `(cursor                           ((t (:background ,foreground+1))))
   `(default                          ((t (:background ,background :foreground ,foreground))))
   `(fringe                           ((t (:background ,foreground :foreground ,foreground))))
   `(hl-line                          ((t (:background ,foreground :foreground ,foreground))))
   `(linum                            ((t (:background ,foreground :foreground ,foreground))))
   `(mode-line                        ((t (:background ,foreground :foreground ,foreground))))
   `(mode-line-inactive               ((t (:background ,foreground :foreground ,foreground))))
   `(region                           ((t (:background ,background+1))))

   ;; Syntax

   `(font-lock-builtin-face           ((t (:foreground ,cyan))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,magenta))))
   `(font-lock-comment-face           ((t (:foreground ,background+2))))
   `(font-lock-constant-face          ((t (:foreground ,cyan))))
   `(font-lock-doc-string-face        ((t (:foreground ,green))))
   `(font-lock-function-name-face     ((t (:foreground ,blue))))
   `(font-lock-keyword-face           ((t (:foreground ,magenta))))
   `(font-lock-preprocessor-face      ((t (:foreground ,yellow+1))))
   `(font-lock-string-face            ((t (:foreground ,green))))
   `(font-lock-type-face              ((t (:foreground ,yellow))))
   `(font-lock-variable-name-face     ((t (:foreground ,red))))
   ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory
                (file-name-directory load-file-name))))

(provide-theme 'arianon)
