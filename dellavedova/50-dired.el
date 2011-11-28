;; Load `dired' itself, with `tramp' extension
(require 'dired)
(require 'dired-x)
(require 'wdired)
(require 'tramp)

;; List directories first in dired
(require 'ls-lisp)


;; Enable wdired on "r"
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; Make tramp's backup directories the same as the normal ones
(setq tramp-backup-directory-alist backup-directory-alist)

(setq dired-recursive-copies t)
(setq dired-recursive-deletes t)
(setq tramp-default-method "ssh")

(setq dired-listing-switches "-lph")
