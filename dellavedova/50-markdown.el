(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdwn\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

; Enable support for LaTeX in Markdown files
(setq markdown-enable-itex t)


(add-hook 'markdown-mode-hook
          '(lambda ()
             (setq default-fill-column 78)
             (turn-on-auto-fill)
             (define-key markdown-mode-map [(control l)]    'markdown-insert-link)
             ))
