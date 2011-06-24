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


; Compilation window should be small and disappear if there is no error
; from http://www.emacswiki.org/emacs/ModeCompile
(setq compilation-window-height 8)
(setq compilation-finish-functions 'compile-autoclose)
(defun compile-autoclose (buffer string)
  (cond ((string-match "finished" string)
         (message "Build maybe successful: closing window.")
         (run-with-timer 10 nil
                         'delete-window
                         (get-buffer-window buffer t)))
        (t
         (message "Compilation exited abnormally: %s" string))))

 ;; never use GUI file dialog
(setq use-file-dialog nil)

;; Show lots of messages in the *Messages* buffer
(setq message-log-max 200)


(color-theme-zenburn)

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
