;; =====================================================================
;; Saving Emacs Sessions
;; =====================================================================
(require 'session)
(session-initialize)




;;; Desktop
;;
(desktop-save-mode 1)
;(setq desktop-path (list my-config-dir))
(setq desktop-base-file-name "emacs.desktop")
(setq history-length 2500)
(add-to-list 'desktop-globals-to-save 'file-name-history)
(setq desktop-buffers-not-to-save
      (concat "\\(" "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
              "\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
              "\\)$"))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

(setq desktop-globals-to-save
      (append '((extended-command-history . 300)
                (file-name-history        . 1000)
                (grep-history             . 300)
                (minibuffer-history       . 500)
                (query-replace-history    . 600)
                (read-expression-history  . 600)
                (regexp-history           . 600)
                (regexp-search-ring       . 200)
                (search-ring              . 200)
                (shell-command-history    . 500)
                tags-file-name
                register-alist)))

;; automatic buffer cleanup
(require 'midnight)
(midnight-delay-set 'midnight-delay "7:30pm") ; Cleanup time
;; don't kill my precious manuals while I'm still reading them
(add-to-list 'clean-buffer-list-kill-never-buffer-names "*info*")
(setq clean-buffer-list-delay-general 10)  ;; remove buffers after 10 days without use
(setq clean-buffer-list-delay-special (* 6 3600))  ;; special buffers after 6 hours
(add-to-list 'clean-buffer-list-kill-buffer-names
             '("*buffer-selection*"
               "*Finder*"
               "*Finder Category*"
               "*Finder-package*"
               "*RE-Builder*"
               "*vc-change-log*"))
(add-to-list 'clean-buffer-list-kill-regexps
             '("\\`\\*Customize .*\\*\\'"
               "\\`\\*\\(Wo\\)?Man .*\\*\\'"))
(add-to-list 'clean-buffer-list-kill-never-buffer-names
             '("*eshell*"
               "*ielm*"
               "*mail*"
               "*w3m*"
               "*w3m-cache*"))
