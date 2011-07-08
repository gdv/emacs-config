;; which-func-mode ( From gnu emacs FAQ ) If you set
;; which-func-mode-global via customize, which-func-mode will not turn
;; on automatically. You need to add the following to your startup
;; file BEFORE the call to custom-set-variables:
(which-func-mode 1)

(setq completion-ignored-extensions '(".svn/" "CVS/" ".o" "~" ".bin" ".lbin" ".so" ".a"
                                      ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".log" ".idx"
                                      ".lot" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f"
                                      ".sparcf" ".fasl" ".ufsl" ".fsl" ".dxl" ".pfsl" ".dfsl"
                                      ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky"
                                      ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps"
                                      ".vrs" ".pyc" ".pyo" ".jar" ".out"))

(setq apropos-sort-by-scores t)
(put 'eval-expression 'disabled nil)

(setq temporary-file-directory "/tmp")

; Customize related files
(setq custom-file "~/.emacs.d/custom-config.el")
(load custom-file 'noerror)

;; Start server mode to enable emacsclient
(server-start)

;; Make executable each script
(add-hook 'after-save-hook
            'executable-make-buffer-file-executable-if-script-p)


;; Add Marmalade
(add-to-list
  'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))
