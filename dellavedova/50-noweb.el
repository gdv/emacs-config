;;; Noweb

(autoload 'noweb-mode "noweb-mode" "Editing noweb files." t)

(setq buffer-file-coding-system 'utf-8)
(add-hook 'noweb-select-mode-hook
          '(lambda () (hack-local-variables-prop-line)))

(add-to-list 'auto-mode-alist '("\\.nw\\'" . noweb-mode))
