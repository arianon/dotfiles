(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))

(deftheme arianon "My personal theme for Emacs.")

(let ((background "#14181f")
      (background+1 "#2b303b")
      (background+2 "#4d576b")

      (foreground "#b7bdcc")
      (foreground+1 "#a6aab2")
      (foreground+2 "#b9bbbe")

      (red "#bf616a")
      (red+1 "#994e55")

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
