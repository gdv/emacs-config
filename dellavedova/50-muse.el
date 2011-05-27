;;; muse-init.el --- Initialize Emacs Muse

;; This file is part of Michael Olson's Emacs settings.

;; The code in this file may be used, distributed, and modified
;; without restriction.

;; I use initsplit.el to separate customize settings on a per-project
;; basis.

;; In order to see the scripts that I use to publish my website to a
;; remote webserver, check out
;; http://mwolson.org/projects/SiteScripts.html.

;;; Setup

;; Add to load path

;; Initialize
;; (require 'outline)       ; I like outline-style faces
(require 'muse)          ; load generic module
(require 'muse-colors)   ; load coloring/font-lock module
(require 'muse-mode)     ; load authoring mode
;; (require 'muse-blosxom)  ; load blosxom module
;; (require 'muse-docbook)  ; load DocBook publishing style
(require 'muse-html)     ; load (X)HTML publishing style
(require 'muse-latex)    ; load LaTeX/PDF publishing styles
(require 'muse-latex2png) ; publish <latex> tags
(require 'muse-texinfo)  ; load Info publishing style
(require 'muse-wiki)     ; load Wiki support
;; (require 'muse-xml)      ; load XML support
;;(require 'muse-message)  ; load message support (experimental)

;; Setup projects

;; Here is my master project listing.

(setq muse-project-alist
      `(
        ("Notes"   ("~/Devel/Note/"
                    :default "Index"))
        ("Private" ("~/Private/Note/"
                    :default "Index"
                    ))))

;; Wiki settings
(setq muse-wiki-interwiki-alist
      '(("PlugWiki" . "http://purduelug.org/wiki/")
        ("EmacsWiki" . "http://www.emacswiki.org/cgi-bin/wiki/")
        ("ArchWiki" . "http://gnuarch.org/gnuarchwiki/")
        ;; abbreviations
        ("CERIAS" . "http://www.cerias.purdue.edu/")
        ("PlannerMode" .
"http://www.emacswiki.org/cgi-bin/wiki/PlannerMode")
        ("RememberMode" .
"http://www.emacswiki.org/cgi-bin/wiki/RememberMode")
        ("GP2X" . "http://www.gp2x.co.uk/")
        ("UbuntuLinux" . "http://ubuntulinux.org/")
        ("PLUG" . "http://purduelug.org/")
        ("PAC" . "http://web.ics.purdue.edu/~pac/")))

;;; Functions


;; Switch to the given project and prompt for a file
(defun my-muse-project-find-file (project)
  (interactive)
  (let ((muse-current-project (muse-project project)))
    (call-interactively 'muse-project-find-file)))



;; Turn a word or phrase into a clickable Wikipedia link
(defun my-muse-dictize (beg end)
  (interactive "r")
  (let* ((text (buffer-substring-no-properties beg end))
         (link (concat "dict:" (replace-regexp-in-string " " "_" text t
t))))
    (delete-region beg end)
    (insert "[[" link "][" text "]]")))

(defun my-muse-surround-math (beg end)
  (interactive "r")
  (save-restriction
    (narrow-to-region beg end)
    (goto-char (point-min))
    (insert "<math>")
    (goto-char (point-max))
    (insert "</math>")))

(defun my-muse-cdotize-region (beg end)
  (interactive "r")
  (save-restriction
    (narrow-to-region beg end)
    (goto-char (point-min))
    (while (re-search-forward " *\\* *" nil t)
      (replace-match " \\\\cdot "))))

;;; Key customizations

;; (global-set-key "\C-cpn" #'(lambda () (interactive)
;;                              (my-muse-project-find-file "MyNotes")))
;; (global-set-key "\C-cpp" #'(lambda () (interactive)
;;                              (my-muse-project-find-file "Plans")))
;; (global-set-key "\C-cpr" #'(lambda () (interactive)
;;                              (my-muse-project-find-file "Projects")))
;; (global-set-key "\C-cps" #'(lambda () (interactive)
;;                              (my-muse-project-find-file "Classes")))
;; (global-set-key "\C-cpw" #'(lambda () (interactive)
;;                              (my-muse-project-find-file "Website")))
;; (global-set-key "\C-cpC" #'my-muse-cdotize-region)
;; (global-set-key "\C-cpM" #'my-muse-surround-math)
;; (global-set-key "\C-cpW" #'my-muse-dictize)

;;; Custom variables

(custom-set-variables
 '(muse-colors-autogen-headings (quote outline))
 '(muse-colors-inline-image-method (quote muse-colors-use-publishing-directory))
 '(muse-html-charset-default "utf-8")
 '(muse-html-encoding-default (quote utf-8))
 '(muse-html-meta-content-encoding (quote utf-8))
 '(muse-mode-hook (quote (flyspell-mode footnote-mode)))
 '(muse-publish-comments-p t)
)

;;; muse-init.el ends here
