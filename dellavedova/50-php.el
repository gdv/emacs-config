;;; PHP

 (add-hook 'php-mode-hook
   #'(lambda ()
       (interactive)
                                        ;(define-key php-mode-map [tab] 'indent-or-complete)
       (make-local-variable 'write-contents-hooks)
       (add-hook 'write-contents-hooks 'source-untabify)
       (setq buffer-file-coding-system 'utf-8)
       ))
