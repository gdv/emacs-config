;; From http://www.emacswiki.org/emacs-en/ForceBackups
  (setq version-control t ;; Use version numbers for backups
            kept-new-versions 16 ;; Number of newest versions to keep
                kept-old-versions 2 ;; Number of oldest versions to keep
                    delete-old-versions t ;; Ask to delete excess backup versions?
                        backup-by-copying-when-linked t) ;; Copy linked files, don't rename.

  (defun force-backup-of-buffer ()
        (let ((buffer-backed-up nil))
                (backup-buffer)))

  (add-hook 'before-save-hook  'force-backup-of-buffer)
