(setq org-startup-indented t)
(defun org-mode-reftex-search ()
  ;;jump to the notes for the paper pointed to at from reftex search
  (interactive)
  (org-open-link-from-string (format "[[notes:%s]]" (reftex-citation t))))

(add-hook 'org-mode-hook
          #'(lambda ()
              (load-library "reftex")
              (and (buffer-file-name) (file-exists-p (buffer-file-name))
                   (progn
                     ;;enable auto-revert-mode to update reftex when bibtex file changes on disk
                     (global-auto-revert-mode t)
                     (reftex-parse-all)
                     ;;add a custom reftex cite format to insert links
                     (reftex-set-cite-format
                      '((?b . "[[bib:%l][%l-bib]]")
                        (?n . "[[notes:%l][%l-notes]]")
                        (?p . "[[papers:%l][%l-paper]]")
                        (?t . "%t")
                        (?h . "** %t\n:PROPERTIES:\n:Custom_ID: %l\n:END:\n[[papers:%l][%l-paper]]")))))
              (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
              (define-key org-mode-map (kbd "C-c (") 'org-mode-reftex-search))
          )

(setq org-link-abbrev-alist
      '(("bib" . "~/research/refs.bib::%s")
        ("notes" . "~/research/org/notes.org::#%s")
        ("papers" . "~/research/papers/%s.pdf")))
