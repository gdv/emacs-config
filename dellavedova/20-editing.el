(abbrev-mode t)

; My abbreviations
(setq abbrev-file-name "~/.emacs.d/abbrev_defs.el")
(require 'pabbrev)
(global-pabbrev-mode)
; Activate CUA-mode
(cua-mode t)
(setq cua-prefix-override-inhibit-delay 1)
;; Copy selection to clipboard (Gnome style)
(setq x-select-enable-clipboard t)


;;; ; don't automatically add new lines when scrolling down at the bottom
;;; ; of a buffer
(setq next-line-add-newlines nil)

;;; ; ;be able to do Ctrl-X, u/l  to upper/lowercase regions without confirm
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;;; ; ;; Move the mouse in upper right corner when editing
(mouse-avoidance-mode 'cat-and-mouse)

;;will make "Ctrl-k" kills an entire line if the cursor is at the beginning of line -- very usefula
(setq kill-whole-line t)

; ;; Make a passable attempt at using UTF-8 in buffers
(setq buffer-file-coding-system 'utf-8)
(set-language-environment "UTF-8")


(setq file-coding-system-alist '
       (("/debian/changelog\\'" utf-8 . utf-8)
        ("/changelog\\.Debian\\'" utf-8 . utf-8)
         ("\\.elc\\'" emacs-mule . emacs-mule)
         ("\\(\\`\\|/\\)loaddefs.el\\'" raw-text . raw-text-unix)
         ("\\.tar\\'" no-conversion . no-conversion)
         ("" utf-8 . utf-8)))


(setq tab-width 4)                      ; tab = 4 spaces
(setq-default indent-tabs-mode nil)     ; use spaces (not tabs) for indenting
(setq kill-ring-max 10)                 ; don't save too many kills
(setq require-final-newline t)          ; always terminate last line in file
(setq major-mode 'text-mode)    ; default mode is text mode
(setq next-screen-context-lines 1)      ; # of lines of overlap when scrolling
(setq auto-save-interval 300)           ; autosave every N characters typed
(setq fill-column 88)           ; the column beyond which do word wrap
(setq scroll-preserve-screen-position t); make pgup/dn remember current line
(global-auto-revert-mode 1)             ; autorevert buffers if files change
(setq develock-max-column-plist nil)    ; disable highlighting for develock

;; Put autosave files (ie #foo#) in one place, *not* scattered all over the
;; file system! (The make-autosave-file-name function is invoked to determine
;; the filename of an autosave file.)
(setq autosave-dir "~/.emacs-autosave/")

;;; ;;; ;; Specify where backup files are stored
(setq backup-directory-alist (quote ((".*" . "~/.backups"))))
(defconst use-backup-dir t)

(defconst query-replace-highlight t)
(defconst search-highlight t)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Remove the prompt that asks you if you want to kill a buffer with a live process attached to it
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

;; tooltips the echo area
(tooltip-mode -1)
(setq tooltip-use-echo-area t)




(setq track-eol nil)
(setq scroll-step 1)

(setq hscroll-step 1)
(setq visible-bell t) ; no beeping
(when (fboundp 'blink-cursor-mode) (blink-cursor-mode -1)) ; no blinking cursor
(setq imenu-max-items 40)
(setq message-log-max 3000)
(setq line-number-display-limit 10000000)
(setq sentence-end-double-space nil)
(setq read-quoted-char-radix 10)
(setq yank-excluded-properties t) ; do not paste any properties
(setq cursor-in-non-selected-windows nil)
(setq indicate-empty-lines t)


;(require 'highlight-parentheses)
;(setq 'highlight-current-line-globally t nil (highlight-current-line))
;;;
;;;Semantic
;;;;;;
(setq semantic-load-turn-everything-on t)
;;;
;;;Minibuffer stuff
;;;;;Use icomplete mode in Minibuffers
(icomplete-mode 1)


;;; Ediff
(setq ediff-diff-program "diff -EbBw")
;;;

;; Unique buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified


; Search behavior
(defun windows-isearch-hook ()
  (define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
  (define-key isearch-mode-map (kbd "RET") 'isearch-repeat-forward)
  (define-key isearch-mode-map (kbd "<escape>") 'isearch-exit)
  (define-key isearch-mode-map (kbd "C-S-f") 'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "C-v") 'isearch-yank-kill)
)
(add-hook 'isearch-mode-hook 'windows-isearch-hook)


;; Flymake
(add-to-list 'exec-path '"~/.emacs.d/bin/")
(require 'flymake)
(require 'flymake-cursor)
(setq flymake-allowed-file-name-masks (quote (("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-make-init)
                                              ("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup)
                                              ("\\.idl\\'" flymake-simple-make-init))))
(add-hook 'find-file-hook 'flymake-find-file-hook)

 ;;mode-compile
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode"
  t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'"
  t)
(global-set-key "\C-ck" 'mode-compile-kill)


; Compilation window should be small and disappear if there is no error
; from http://www.emacswiki.org/emacs/ModeCompile
(setq compilation-finish-functions 'compile-autoclose)
 (defun compile-autoclose (buffer string)
   (cond ((and (string-match "finished" string)
               (not (string-match "TextLint" (buffer-string))))
          (message "Build likely successful: closing window")
          (run-with-timer 2 nil                      
                          'delete-window              
                          (get-buffer-window buffer t)))
         (t                                                                    
          (message "Compilation exited abnormally: %s" string))))


(global-subword-mode 1)

;; Auto complete
(setq-default ac-sources '(ac-source-words-in-all-buffer))

;; complain whenever I try to save a file with CRLF in it
;; https://synker.wordpress.com/2011/09/13/old-annoyances-that-live-on/
(defun my-save-hook ()
  (if (and (not (eq buffer-file-coding-system nil))
           (not (string-match "unix" (symbol-name buffer-file-coding-system)))
           (y-or-n-p "Convert for UNIX? "))
      (setq buffer-file-coding-system 'undecided-unix)))
(add-hook 'before-save-hook 'my-save-hook)

;; choose your own fonts, in a system dependant way
(set-frame-font "Inconsolata-14")

(global-hl-line-mode)			; highlight current line


;; copy/paste with C-c and C-v and C-x, check out C-RET too
(cua-mode)

;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

