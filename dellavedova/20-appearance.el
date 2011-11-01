;syntax
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)
;show paren, brace, and curly brace "partners" at all times
(show-paren-mode t)

;show column number in status bar
(column-number-mode t)


;make the y or n suffice for a yes or no question
(fset 'yes-or-no-p 'y-or-n-p)

;;;; Window appearance

;; When you scroll down with the cursor, emacs will move down the buffer one
;; line at a time, instead of in larger amounts.
(setq scroll-step 1)
(setq scroll-conservatively '1000)
;; line highlight
;(highlight-current-line-on t)
;(hl-line-mode t)
;(require 'hl-line+)
;(hl-line-toggle-when-idle nil)
;(global-hl-line-mode t)
;(defface hl-line '((t (:background "Blue")))
;  "Face to use for `hl-line-face'." :group 'hl-line)
;(setq hl-line-face 'hl-line)
;(require 'highlight-parentheses)


 ;; never use GUI file dialog
(setq use-file-dialog nil)

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
