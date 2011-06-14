;;;; Perl mode
(add-hook 'cperl-mode-hook
          '(lambda ()
             (interactive)
             (cperl-set-style "PerlStyle")
             (imenu-add-to-menubar "Functions")
             (global-set-key [(f12)] 'perldb)
             (make-local-variable 'write-contents-hooks)
             (add-hook 'write-contents-hooks 'source-untabify)
             (define-key cperl-mode-map [return] 'newline-and-indent)
             ;; indentation
             (setq cperl-indent-level 4)
             ;; enable everything
             (setq cperl-hairy t)
             ;; trailing whitespaces are not shown
             (setq cperl-invalid-face (quote off))
             ))

;; Always use CPerl mode
(defalias 'perl-mode 'cperl-mode)
