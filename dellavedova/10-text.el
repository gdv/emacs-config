;; turn on auto-fill in text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq major-mode 'text-mode)            ; default mode is text mode
;; abbrev config
(add-hook 'text-mode-hook (lambda () (abbrev-mode +1)))

