;;; Noweb

(autoload 'noweb-mode "noweb-mode" "Editing noweb files." t)

(setq buffer-file-coding-system 'utf-8)
(add-hook 'noweb-select-mode-hook
          '(lambda () (hack-local-variables-prop-line)))

;;; ;; Remove trailing whitespaces.
;;; ;; Tab -> Spaces
(add-hook 'noweb-mode-hook '(lambda ()
                             (make-local-variable 'write-contents-hooks)
                             (add-hook 'write-contents-hooks 'source-untabify)))

(add-to-list 'auto-mode-alist '("\\.nw\\'" . noweb-mode))
