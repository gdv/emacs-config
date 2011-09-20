;; emacs kicker --- kick start emacs setup
;; Copyright (C) 2010 Dimitri Fontaine
;;
;; Author: Dimitri Fontaine <dim@tapoueh.org>
;; Modified by Gianluca Della Vedova
;; URL: https://github.com/gdv/emacs-kicker
;;
;; Keywords: emacs setup el-get kick-start starter-kit
;; Licence: GPLv3
;;

; Taken from Emacs Starter Kit
(progn
  ;; Turn off mouse interface early in startup to avoid momentary display
  (dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1))))


  ;; You can keep system- or user-specific customizations here
(add-hook 'after-init-hook 'my-after-init)


(require 'cl)				; common lisp goodies, loop

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.
(setq
 el-get-sources
 '(el-get				; el-get is self-hosting
   escreen                              ; screen for emacs, C-\ C-h
   php-mode-improved			; if you're into php...
   switch-window			; takes over C-x o
   auto-complete			; complete as you type with overlays

;   (:name pabbrev	; predictive abbreviation
;          :after (lambda ()
;                   (require 'pabbrev)
;                   (global-pabbrev-mode t))
;   )

   (:name textlint
    :type git
    :url "git://github.com/DamienCassou/textlint.git"
    :website "http://scg.unibe.ch/research/textlint"
    :description "Allows the integration of TextLint within Emacs"
    :load "textlint.el")
   ;;TeXtLint finds common grammatical/style errors in a text
   
   (:name smex				; a better (ido like) M-x
          :after (lambda ()
                   (setq smex-save-file "~/.emacs.d/.smex-items")
                   (global-set-key (kbd "M-x") 'smex)
                   (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

   (:name magit				; git meet emacs, and a binding
          :after (lambda ()
                   (global-set-key [(f8)] 'magit-status)))
   (:name flymake-cursor
          :after (lambda ()
                   (global-set-key [(f8)] 'magit-status)))

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

;; on to the visual settings
(setq inhibit-splash-screen t)		; no splash screen, thanks
(line-number-mode 1)			; have line numbers and
(column-number-mode 1)			; column numbers in the mode line

(tool-bar-mode -1)			; no tool bar with icons
(scroll-bar-mode -1)			; no scroll bars

;; choose your own fonts, in a system dependant way
(set-frame-font "Inconsolata-14")

(global-hl-line-mode)			; highlight current line

;; avoid compiz manager rendering bugs
(add-to-list 'default-frame-alist '(alpha . 100))

;; copy/paste with C-c and C-v and C-x, check out C-RET too
(cua-mode)

;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; M-x shell is a nice shell interface to use, let's make it colorful.  If
;; you need a terminal emulator rather than just a shell, consider M-x term
;; instead.
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; If you do use M-x term, you will notice there's line mode that acts like
;; emacs buffers, and there's the default char mode that will send your
;; input char-by-char, so that curses application see each of your key
;; strokes.
;;
;; The default way to toggle between them is C-c C-j and C-c C-k, let's
;; better use just one key to do the same.
(require 'term)
(define-key term-raw-map  (kbd "C-'") 'term-line-mode)
(define-key term-mode-map (kbd "C-'") 'term-char-mode)

;; Have C-y act as usual in term-mode, to avoid C-' C-y C-'
;; Well the real default would be C-c C-j C-y C-c C-k.
(define-key term-raw-map  (kbd "C-y") 'term-paste)

;; use ido for minibuffer completion
(require 'ido)
(ido-mode t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)

;; default key to switch buffer is C-x b, but that's not easy enough
;;
;; when you do that, to kill emacs either close its frame from the window
;; manager or do M-x kill-emacs.  Don't need a nice shortcut for a once a
;; week (or day) action.
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x B") 'ibuffer)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)

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
)

