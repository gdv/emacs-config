;;;; Perl mode
(autoload 'cperl-mode "cperl-mode" "Major mode for perl files" t)
(defalias 'perl-mode 'cperl-mode) ;; use cperl-mode instead of perl-mode
(add-hook 'cperl-mode-hook 'my-cperl-mode-hook)

(add-to-list 'auto-mode-alist '("\\.pl$" . cperl-mode))

(defun my-cperl-mode-hook ()
  (interactive)
  (make-local-variable 'write-contents-hooks)
  (define-key cperl-mode-map [f12] 'perldb)
  (define-key cperl-mode-map [return] 'newline-and-indent)
  (setq cperl-indent-level 4)
  (setq cperl-continued-statement-offset 8)
  ;; cperl-hairy affects all those variables, but I prefer
  ;; a more fine-grained approach as far as they are concerned
  (setq cperl-font-lock t)
  (setq cperl-electric-lbrace-space t)
  (setq cperl-electric-parens nil)
  (setq cperl-electric-linefeed nil)
  (setq cperl-electric-keywords nil)
  (setq cperl-info-on-command-no-prompt t)
  (setq cperl-clobber-lisp-bindings t)
  (setq cperl-lazy-help-time 3)

  ;; if you want all the bells and whistles
  ;; (setq cperl-hairy)

  (set-face-background 'cperl-array-face nil)
  (set-face-background 'cperl-hash-face nil)
  (setq cperl-invalid-face nil))

(autoload 'perlcritic        "perlcritic" "" t)
(autoload 'perlcritic-region "perlcritic" "" t)
(autoload 'perlcritic-mode   "perlcritic" "" t)

(eval-after-load "cperl-mode"
  '(add-hook 'cperl-mode-hook 'perlcritic-mode))
