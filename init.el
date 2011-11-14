; emacs kicker --- kick start emacs setup
;; Copyright (C) 2010 Dimitri Fontaine
;; Copyright (C) 2009-2011  Bozhidar Batsov.
;; Copyright (C) 2002-2011  Gianluca Della Vedova
;; https://github.com/gdv/emacs-kicker
;;
;; Licence: GPLv3
;;

;; Turn off mouse interface early in startup to avoid momentary display
(tool-bar-mode -1)			; no tool bar with icons
(scroll-bar-mode -1)			; no scroll bars

;; on to the visual settings
(setq inhibit-splash-screen t)		; no splash screen, thanks
(line-number-mode 1)			; have line numbers and
(column-number-mode 1)			; column numbers in the mode line


  ;; You can keep system- or user-specific customizations here
(add-hook 'after-init-hook 'my-after-init)

(require 'cl)				; common lisp goodies, loop

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
;; (unless (require 'el-get nil t)
;;   (url-retrieve
;;    "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
;;    (lambda (s)
;;      (end-of-buffer)
;;      (eval-print-last-sexp))))

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.
(setq
 el-get-sources
 '(el-get				; el-get is self-hosting
   escreen                              ; screen for emacs, C-\ C-h
   php-mode-improved			; if you're into php...
   switch-window			; takes over C-x o
   auto-complete			; complete as you type with overlays

   (:name textlint
    :type git
    :url "git://github.com/DamienCassou/textlint.git"
    :website "http://scg.unibe.ch/research/textlint"
    :description "Allows the integration of TextLint within Emacs"
    :load "textlint.el")
   ;;TeXtLint finds common grammatical/style errors in a text
   
   ;; (:name smex				; a better (ido like) M-x
   ;;        :after (lambda ()
   ;;                 (setq smex-save-file "~/.emacs.d/.smex-items")
   ;;                 (global-set-key (kbd "M-x") 'smex)
   ;;                 (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

   (:name magit				; git meet emacs, and a binding
          :after (lambda ()
                   (global-set-key [(f8)] 'magit-status)))
   (:name flymake-cursor)

   (:name goto-last-change		; move pointer back to last change
          :after (lambda ()
                   ;; when using AZERTY keyboard, consider C-x C-_
                   (global-set-key (kbd "C-x C-/") 'goto-last-change)))))

;;
;; Some recipes require extra tools to be installed
;;
;; Note: el-get-install requires git, so we know we have at least that.
;(when (el-get-executable-find "svn")
;  (loop for p in '(
;                  yasnippet		; powerful snippet mode
;                  )
;	do (add-to-list 'el-get-sources p)))

;; install new packages and init already installed packages
(el-get 'sync)



;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)




;; Customize related files
(setq custom-file "~/.emacs.d/custom-config.el")
(load custom-file 'noerror)


;; You can keep system- or user-specific customizations here
;; (add-hook 'after-init-hook 'my-after-init)
;;
(defun my-after-init()
  (setq esk-user-dir (concat user-emacs-directory user-login-name))
  (add-to-list 'load-path esk-user-dir)
  (add-to-list 'load-path user-emacs-directory)

  (when (file-exists-p esk-user-dir)
       (mapc 'load (directory-files esk-user-dir nil ".*el$")))
  (desktop-read)

  ;; Taken from Emacs-dev-kit
  ;; determine the load path dirs
  ;; as relative to the location of this file
  (defvar dotfiles-dir "~/.emacs.d/emacs-dev-kit/"
    "The root Emacs Lisp source folder")
  ;; external packages reside here
  (defvar ext-dir (concat dotfiles-dir "vendor/")
    "The root folder for external packages")
  (add-to-list 'custom-theme-load-path (concat dotfiles-dir "themes/"))

  ;; load misc utils
  (load (concat dotfiles-dir "misc-utils"))
  ;; load editing utils
  (load (concat dotfiles-dir "editing-utils"))
  ;; load navigation utils
  (load (concat dotfiles-dir "navigation-utils"))
  ;; load coding utils - should be done before coding configs!
  (load (concat dotfiles-dir "coding-utils"))

  
  (load (concat ext-dir "projectile" ))
  (load (concat dotfiles-dir "misc-config"))
  (load (concat dotfiles-dir "coding-config"))

  (load (concat dotfiles-dir "perl-config"))
;  (load (concat dotfiles-dir "emacs-lisp-config.el"))
  (load (concat dotfiles-dir "c-config"))

  (load (concat dotfiles-dir "python-config"))

  (load (concat ext-dir "feature-mode/feature-mode" ))
  (load (concat dotfiles-dir "ruby-config"))

  (load (concat dotfiles-dir "ibuffer-config"))

  (load (concat dotfiles-dir "auctex-config"))

  (load (concat dotfiles-dir "nxml-config"))

  
    ;; zenburn color theme setup
  (if (>= emacs-major-version 24)
      (load-theme 'zenburn)
    (progn
      (require 'color-theme-zenburn)
      (color-theme-zenburn)))
)

