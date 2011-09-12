;;; Shell/Bash

;; delete trailing whitespaces
(add-hook 'shell-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (delete-trailing-whitespace))))))
