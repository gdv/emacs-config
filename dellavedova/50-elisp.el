(add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-hook)
(autoload 'paredit-mode "paredit" "Minor mode for pseudo-structurally editing Lisp code." t)


(defun my-elisp-mode-hook ()
;  (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
  (define-key emacs-lisp-mode-map [(meta prior)]         'forward-sexp)
  (define-key emacs-lisp-mode-map [(meta next)]          'backward-sexp)
  ;; ignore byte-compile warnings
  (setq byte-compile-warnings '(not nresolved
                                    free-vars
                                    callargs
                                    redefine
                                    obsolete
                                    noruntime
                                    cl-functions
                                    interactive-only
                                    ))
 )

(eval-after-load 'paredit-mode
  ;; need a binding that works over SSH
  '(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp))

