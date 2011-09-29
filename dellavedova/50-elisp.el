(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
;             (add-hook 'after-save-hook 'emacs-lisp-byte-compile t t)
             (define-key emacs-lisp-mode-map [(meta prior)]         'forward-sexp)
             (define-key emacs-lisp-mode-map [(meta next)]          'backward-sexp)

             ))
