;;;; SQL mode
(add-hook 'sql-mode-hook 'my-sql-mode-init)

(defun my-sql-mode-init()
  (interactive)
  (define-key sql-mode-map [return] 'newline-and-indent)
  (make-local-variable 'write-contents-hooks)
  (add-hook 'write-contents-hooks 'source-untabify)
                                        ;  (define-key sql-mode-map [tab] 'indent-or-complete)
 )

;; Remove trailing whitespaces.
;; Tab -> Spaces
(add-hook 'sql-mode-hook '(lambda ()
                            ))
