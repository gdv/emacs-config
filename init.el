; emacs kicker --- kick start emacs setup
;; Copyright (C) 2010 Dimitri Fontaine
;; Copyright (C) 2009-2011  Bozhidar Batsov.
;; Copyright (C) 2002-2011  Gianluca Della Vedova
;; https://github.com/gdv/emacs-kicker
;;
;; Licence: GPLv3
;;
;;
;; on to the visual settings
(setq inhibit-splash-screen t)		; no splash screen, thanks
(tool-bar-mode -1)
(line-number-mode 1)			; have line numbers and
(column-number-mode 1)			; column numbers in the mode line

  ;; You can keep system- or user-specific customizations here
(add-hook 'after-init-hook 'my-after-init)

(require 'cl)				; common lisp goodies, loop

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
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

   (:name magit				; git meet emacs, and a binding
	  :after (lambda ()
		   (global-set-key [(f8)] 'magit-status)))
   (:name flymake-cursor)

   (:name goto-last-change		; move pointer back to last change
	  :after (lambda ()
		   ;; when using AZERTY keyboard, consider C-x C-_
		   (global-set-key (kbd "C-x C-/") 'goto-last-change)))))

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
  (setq my-user-dir (concat user-emacs-directory user-login-name))
  (add-to-list 'load-path my-user-dir)
  (add-to-list 'load-path user-emacs-directory)

  (when (file-exists-p my-user-dir)
       (mapc 'load (directory-files my-user-dir nil ".*el$")))
  (desktop-read)
  )
