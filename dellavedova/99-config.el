;; which-func-mode ( From gnu emacs FAQ ) If you set
;; which-func-mode-global via customize, which-func-mode will not turn
;; on automatically. You need to add the following to your startup
;; file BEFORE the call to custom-set-variables:
(which-func-mode 1)


(setq apropos-sort-by-scores t)
(put 'eval-expression 'disabled nil)

(setq temporary-file-directory "~/temp/tmp")

;; Start server mode to enable emacsclient
(server-start)

;; Make executable each script
(add-hook 'after-save-hook
            'executable-make-buffer-file-executable-if-script-p)


;; Add Marmalade
(add-to-list
  'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))
