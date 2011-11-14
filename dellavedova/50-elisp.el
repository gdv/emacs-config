(add-hook 'emacs-lisp-mode-hook 'gdv-elisp-mode-hook)

(defun gdv-elisp-mode-hook ()
  (add-hook 'after-save-hook 'emacs-lisp-byte-compile t t)
  (define-key emacs-lisp-mode-map [(meta prior)]         'forward-sexp)
  (define-key emacs-lisp-mode-map [(meta next)]          'backward-sexp)
)
