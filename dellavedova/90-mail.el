(add-to-list 'auto-mode-alist
             '("\\mutt-*\\|.article\\|\\.followup"
               . mail-mode))

(add-hook
   'mail-mode-hook
   (lambda ()
     (auto-fill-mode t)
     (setq fill-column 72)    ; rfc 1855 for usenet messages
     (setq make-backup-files nil) ;;; No backups necessary.
     (require 'boxquote)
     (define-key mail-mode-map [(control c) (control c)]
       (lambda ()
         (interactive)
         (save-buffer)
         (server-edit)))))

