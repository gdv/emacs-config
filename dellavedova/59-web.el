
;; Rhtml

(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
;(add-hook 'rhtml-mode-hook 'my-ruby-mode-init)



; (defun my-ruby-mode-init ()
;   (interactive)
;   (autoload 'rhtml-mode "rhtml-mode" nil t)
;   ;; Keybindings
;   )


;; YAML
(autoload 'yaml-mode "yaml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; Css
(add-hook 'css-mode-hook 'my-css-mode-hook)

(defun my-css-mode-hook ()
  (setq css-indent-level 2)
  (setq css-indent-offset 2))
