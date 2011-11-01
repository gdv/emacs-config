;;;; Perl mode
(add-hook 'cperl-mode-hook 'gdv-cperl-mode-hook t)


(defun gdv-cperl-mode-hook ()
  (make-local-variable 'write-contents-hooks)
  (add-hook 'write-contents-hooks 'source-untabify)
  (define-key cperl-mode-map [f12] 'perldb)
  (define-key cperl-mode-map [return] 'newline-and-indent))
