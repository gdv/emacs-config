;; From http://emacs-fu.blogspot.com/2010/07/navigating-through-files-and-buffers.html
(when (require 'lusty-explorer nil 'noerror)

  ;; overrride the normal file-opening, buffer switching
  (global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
  (global-set-key (kbd "C-x b")   'lusty-buffer-explorer))

;; ;; Taken from http://emacs-fu.blogspot.com/2009/02/switching-buffers.html

;; (require 'ido)                      ; ido is part of emacs
;; (ido-mode t)                        ; for both buffers and files
;; (setq
;;    ido-ignore-buffers               ; ignore these guys
;;    '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido")
;;    ido-work-directory-list '("~/Articoli" "~/" "~/Documenti")
;;    ido-case-fold  t                 ; be case-insensitive
;;    ido-use-filename-at-point nil    ; don't use filename at point (annoying)
;;    ido-use-url-at-point nil         ;  don't use url at point (annoying)
;;    ido-enable-flex-matching t       ; be flexible
;;    ido-max-prospects 6              ; don't spam my minibuffer
;;    ido-confirm-unique-completion t) ; wait for RET, even with unique completion


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
