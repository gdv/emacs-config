;; My-editing.el
;; auto completion
;;
;;;GDV
;(require 'pabbrev)
;(global-pabbrev-mode t)
(abbrev-mode 0)

; My abbreviations
(setq abbrev-file-name "~/.emacs.d/abbrev_defs.el")
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

;;
(setq kill-whole-line t) ;will make "Ctrl-k" kills an entire line if the cursor is at the beginning of line -- very useful.

; ;; Make a passable attempt at using UTF-8 in buffers
(setq default-buffer-file-coding-system 'utf-8)
(set-language-environment "UTF-8")


(setq file-coding-system-alist '
       (("/debian/changelog\\'" utf-8 . utf-8)
        ("/changelog\\.Debian\\'" utf-8 . utf-8)
         ("\\.elc\\'" emacs-mule . emacs-mule)
         ("\\(\\`\\|/\\)loaddefs.el\\'" raw-text . raw-text-unix)
         ("\\.tar\\'" no-conversion . no-conversion)
         ("" utf-8 . utf-8)))

;; nuke whitespaces when writing to a file
;;http://ruslanspivak.com/2010/09/27/keep-track-of-whitespaces-and-column-80-overflow/#comment-712
(add-hook 'before-save-hook 'whitespace-cleanup)

(setq tab-width 4)                      ; tab = 4 spaces
(setq-default indent-tabs-mode nil)     ; use spaces (not tabs) for indenting
(setq kill-ring-max 10)                 ; don't save too many kills
(setq require-final-newline t)          ; always terminate last line in file
(setq default-major-mode 'text-mode)    ; default mode is text mode
(setq next-screen-context-lines 1)      ; # of lines of overlap when scrolling
(setq auto-save-interval 300)           ; autosave every N characters typed
(setq default-fill-column 88)           ; the column beyond which do word wrap
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
(setq inhibit-startup-message t)



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
(setq default-indicate-empty-lines t)


;(require 'highlight-parentheses)

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

;; Expand
(make-hippie-expand-function
 '(try-expand-dabbrev-visible
   try-expand-dabbrev-from-kill
   try-expand-dabbrev-all-buffers
   try-complete-file-name-partially
   try-complete-file-name))

;; Unique buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers


; Search behavior
(defun windows-isearch-hook ()
  (define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
  (define-key isearch-mode-map (kbd "RET") 'isearch-repeat-forward)
  (define-key isearch-mode-map (kbd "<escape>") 'isearch-exit)
  (define-key isearch-mode-map (kbd "C-S-f") 'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "C-v") 'isearch-yank-kill)
)
(add-hook 'isearch-mode-hook 'windows-isearch-hook)