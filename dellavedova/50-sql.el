;;;; SQL mode
(add-hook 'sql-mode-hook
   #'(lambda ()
       (interactive)
       (define-key sql-mode-map [return] 'newline-and-indent)
       (make-local-variable 'write-contents-hooks)
                                        ;  (define-key sql-mode-map [tab] 'indent-or-complete)
       ))
