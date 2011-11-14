;; From http://emacs-fu.blogspot.com/2010/07/navigating-through-files-and-buffers.html
(when (require 'lusty-explorer nil 'noerror)

  ;; overrride the normal file-opening, buffer switching
  (global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
  (global-set-key (kbd "C-x b")   'lusty-buffer-explorer))


;; default key to switch buffer is C-x b, but that's not easy enough
;;
;; when you do that, to kill emacs either close its frame from the window
;; manager or do M-x kill-emacs.  Don't need a nice shortcut for a once a
;; week (or day) action.
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x B") 'ibuffer)


;; ;; Taken from http://emacs-fu.blogspot.com/2009/02/switching-buffers.html
;; use ido for minibuffer completion
(require 'ido)
(ido-mode t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)

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
