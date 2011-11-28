;; default key to switch buffer is C-x b, but that's not easy enough
(global-set-key (kbd "C-x b") 'ido-switch-buffer)
(global-set-key (kbd "C-x B") 'ibuffer)
(global-set-key [(control f8)]         'ido-dired)


;; ;; Taken from http://emacs-fu.blogspot.com/2009/02/switching-buffers.html
;; use ido for minibuffer completion
(ido-mode t)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-show-dot-for-dired t
      ido-max-prospects 10
      ido-save-directory-list-file "~/.emacs.d/.ido.last"
      ido-ignore-buffers      '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido")
      ido-ignore-extensions '("pdf$" ".dvi" ".blg" ".o" ".elc$")
      ido-work-directory-list '("~/Articoli" "~/" "~/Documenti")
      ido-case-fold  t                 ; be case-insensitive
      ido-default-file-method 'selected-window)


(setq completion-ignored-extensions '(".svn/" "CVS/" ".o" "~" ".bin" ".lbin" ".so" ".a" ".pdf" ".dvi"
                                      ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".log" ".idx"
                                      ".lot" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f"
                                      ".sparcf" ".fasl" ".ufsl" ".fsl" ".dxl" ".pfsl" ".dfsl"
                                      ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky"
                                      ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps"
                                      ".vrs" ".pyc" ".pyo" ".jar" ".out"))

;; ;; Taken from http://emacs-fu.blogspot.com/2010/02/dealing-with-many-buffers-ibuffer.html
;; ;; Modified by Gianluca Della Vedova

;; (require 'ibuffer)
;; (setq ibuffer-saved-filter-groups
;;       (quote (("default"
;;                ("Articoli"
;;                 (filename . "/Articoli/")
;;                 )
;;                ;; ("MyProject1"
;;                ;;  (filename . "src/myproject1/"))
;;                ;; ("MyProject2"
;;                ;;  (filename . "src/myproject2/"))

;;                ("Emacs config" ;; prog stuff not already in MyProjectX
;;                 (and
;;                  (filename . "/.emacs.d/")
;;                  (mode . emacs-lisp-mode)
;;                  ))
;;                ("Clojure"
;;                 (mode . clojure-mode)
;;                 )
;;                ("C"
;;                 (or
;;                  (mode . c-mode)
;;                  ))
;;                ("Perl"
;;                 (or
;;                  (mode . Cperl-mode)
;;                  ))
;;                ("Perl"
;;                 (or
;;                  (mode . sas-mode)
;;                  ))
;;                ("emacs" (or
;;                          (name . "^\\*scratch\\*$")
;;                          (name . "^\\*Messages\\*$")))
;;                ))))

;; ;; Buffers that must not be shown
;; ;(add-to-list 'ibuffer-never-show-regexps "^\\*")
;; ;(add-to-list 'ibuffer-never-show-predicates "\.log$")


;; (add-hook 'ibuffer-mode-hook
;;           (lambda ()
;;             (ibuffer-switch-to-saved-filter-groups "default")))
