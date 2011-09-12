;;; C/C++
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))


 (defun my-c-mode-init ()
   (interactive)

   ;; keybindings
   (define-key c-mode-base-map [(control M)] 'reindent-then-newline-and-indent)
   (define-key c-mode-base-map [f12] 'compile)
   (define-key c-mode-base-map [(meta right)] 'c-forward-into-nomenclature)
   (define-key c-mode-base-map [(meta left)] 'c-backward-into-nomenclature)
   (define-key c-mode-base-map [(meta ?A)] 'c-beginning-of-defun)
   (define-key c-mode-base-map [(meta ?E)] 'c-end-of-defun)
   (define-key c-mode-base-map [(control c)(control :)] 'comment-region)
   (define-key c-mode-base-map [tab] 'indent-or-complete)
   (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

   ;; Tell cc-mode not to check for old-style (K&R) function declarations.
   ;; This speeds up indenting a lot.
   (setq c-recognize-knr-p nil)

   (imenu-add-to-menubar "Functions")
   (setq c-default-style "linux")
   (setq c-basic-offset 4)
   ;; set my personal style for the current buffer
   (c-toggle-auto-newline 1)
   (c-toggle-electric-state nil)
   (c-toggle-hungry-state 1)
   (setq c-hungry-delete-key t)
   (setq c-auto-newline 1)

   (setq buffer-file-coding-system 'utf-8)
   (which-func-mode 1)
   (flymake-mode 1)
   ;; delete trailing whitespaces
   (add-hook 'local-write-file-hooks
             '(lambda()
                (source-untabify)
                (save-excursion
                  (delete-trailing-whitespace)))))

(add-hook 'c-mode-hook 'my-c-mode-init)
