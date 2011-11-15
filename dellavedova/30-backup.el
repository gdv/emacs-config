;; From http://www.emacswiki.org/emacs-en/ForceBackups
(setq version-control t ;; Use version numbers for backups
      kept-new-versions 16 ;; Number of newest versions to keep
      kept-old-versions 2 ;; Number of oldest versions to keep
      delete-old-versions t ;; Ask to delete excess backup versions?
      auto-save-interval 300 ;; autosave every N characters typed
      backup-by-copying-when-linked t) ;; Copy linked files, don't rename.

(defun force-backup-of-buffer ()
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook  'force-backup-of-buffer)

;;; ;;; ;; Specify where backup files are stored
(setq backup-directory-alist (quote ((".*" . "~/.backups"))))
(defconst use-backup-dir t)
