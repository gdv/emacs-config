;syntax
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)
;show paren, brace, and curly brace "partners" at all times
(show-paren-mode t)

;show column number in status bar
(column-number-mode t)


;make the y or n suffice for a yes or no question
(fset 'yes-or-no-p 'y-or-n-p)
;; Create non-existent files
(setq confirm-nonexistent-file-or-buffer nil)
;;;; Window appearance

;; When you scroll down with the cursor, emacs will move down the buffer one
;; line at a time, instead of in larger amounts.
(setq scroll-step 1)
(setq scroll-conservatively '1000)


 ;; never use GUI file dialog
(setq use-file-dialog nil)

;; avoid compiz manager rendering bugs
(add-to-list 'default-frame-alist '(alpha . 100))


;; Show lots of messages in the *Messages* buffer
(setq message-log-max 200)

;;Redraw the display before it processes queued input events
;;http://www.masteringemacs.org/articles/2011/10/02/improving-performance-emacs-display-engine/
(setq redisplay-dont-pause t)

; Modeline
(setq-default mode-line-format
      (list " "
            'mode-line-modified
            "--"
            'mode-line-buffer-identification
            "--"
            'mode-line-client ":"
            'mode-line-remote ":"
            'mode-line-frame-identification
            "--"
            'mode-line-modes
            '(which-func-mode ("" which-func-format "--"))
            'mode-line-position
            "-%-"
            ))

;; Zenburn theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/zenburn/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(require 'zenburn)
(load-theme 'zenburn)

;; Frame title
;; http://tsengf.blogspot.com/search/label/emacs
(setq frame-title-format
      '(:eval
        (if buffer-file-name
            (replace-regexp-in-string
             (replace-regexp-in-string "\\\\" "/" (getenv "HOME")) "~"
             (concat "Emacs " (file-name-directory buffer-file-name) "%b"))
          (buffer-name)
          )))
