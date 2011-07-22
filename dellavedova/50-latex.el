;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  Customization of LaTeX Mode                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setenv "TEXINPUTS" (concat ".:~/texmf//:" (getenv "TEXINPUTS")))
(setenv "BIBINPUTS" (concat ".:~/Articoli/BibInput:" (getenv "BIBINPUTS")))

;; PDF mode for latex
(setq-default TeX-PDF-mode t)


(add-hook 'LaTeX-mode-hook
           #'(lambda ()
               (interactive)
               (setq fill-column 78)
;               (define-key LaTeX-mode-map [(f10)]   '(TeX-command-master "BibTeX"))
               (define-key LaTeX-mode-map [(f9)]    'TeX-view)
               (define-key LaTeX-mode-map [(f12)]   'save-and-latex-file)
               (define-key LaTeX-mode-map (kbd "_") 'tex-smart-underscore)
               (define-key LaTeX-mode-map (kbd "^") 'tex-smart-caret)
               (define-key LaTeX-mode-map (kbd ".") 'tex-smart-period)
                                        ;  (define-key LaTeX-mode-map [tab] 'indent-or-complete)

               (setq buffer-file-coding-system 'utf-8)
               (setq TeX-shell "/bin/bash")

               (which-func-mode 1)

               ;;Abbreviations
               (load "latex-abbrev.el")
               (abbrev-mode t)
               (setq local-abbrev-table LaTeX-mode-abbrev-table)

               ;; Smart quotes
               (defadvice TeX-insert-quote (around wrap-region activate)
                 (cond
                  (mark-active
                   (let ((skeleton-end-newline nil))
                     (skeleton-insert `(nil ,TeX-open-quote _ ,TeX-close-quote) -1)))
                  ((looking-at (regexp-opt (list TeX-open-quote TeX-close-quote)))
                   (forward-char (length TeX-open-quote)))
                  (t
                   ad-do-it)))
               (put 'TeX-insert-quote 'delete-selection nil)

               ;; More complex editing features
               ;;  (load "latex-bindings.el")
               ;;  (my-latex-bindings)

               ;; Math mode for LaTex
               (LaTeX-math-mode)

               ;; Outline mode
               (outline-minor-mode t)
               (define-key LaTeX-mode-map '[C-prev] 'outline-previo-visible-heading)
               (define-key LaTeX-mode-map '[C-next] 'outline-next-visible-heading)

               ;; Add a document headings menu
               (imenu-add-to-menubar "Structure")
               (add-hook 'reftex-load-hook 'imenu-add-menubar-index)
               (add-hook 'reftex-mode-hook 'imenu-add-menubar-index)


               (make-local-variable 'write-contents-hooks)
               (add-hook 'write-contents-hooks 'source-untabify)
                                        ; Make compilation window go away if there is no error
                                        ;http://www.emacswiki.org/emacs/ModeCompile
               (kill-local-variable 'compile-command)
               ;; (setq mode-compile-modes-alist
               ;;       (append '((latex-mode . (tex-compile kill-compilation)))
               ;;               mode-compile-modes-alist))

               ;; Flymake
               (flymake-mode 1)
               (define-key LaTeX-mode-map '[M-up] 'flymake-goto-prev-error)
               (define-key LaTeX-mode-map '[M-down] 'flymake-goto-next-error)

               (defun flymake-get-tex-args (file-name)
                 (list "pdflatex" (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

               ;; Flyspell
               (flyspell-mode t)
               ))





;; Try to initialize AUC-TeX mode
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq LaTeX-math-abbrev-prefix 'ù)

;;   If you want to make AUC TeX aware of style files and multi-file
;;   documents right away, insert the following in your `.emacs' file.
(setq TeX-auto-save t)
(setq TeX-save-query nil) ;;autosave before compiling
(setq TeX-parse-self t)
(setq-default TeX-master nil)



;; Initialisations for LaTeX-mode

;; Turns plain-tex-mode always into LaTeX-mode
(add-hook 'plain-tex-mode-hook '(lambda () (LaTeX-mode)))

;; Turn on auto-fill-mode for BibTeX and LaTeX
(add-hook 'bibtex-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)


;;
;; RefTeX
;  (turn-on-reftex)
(autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

(setq reftex-format-cite-function
          '(lambda (key fmt)
             (let ((cite (replace-regexp-in-string "%l" key fmt)))
               (if (or (= ?~ (string-to-char fmt))
                       (member (preceding-char) '(?\ ?\t ?\n ?~)))
                   cite
                 (concat "~" cite)))))

;; Make RefTeX faster
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-bibpath-environment-variables  '("~/Articoli/BibInput/"))
(setq reftex-file-extensions '(("nw" "tex" ".tex" ".ltx") ("bib" ".bib")))
(setq reftex-cite-prompt-optional-args nil)
(setq reftex-cite-cleanup-optional-args t)

(setq reftex-label-alist
      (quote (
              ("Algorithm"   ?a "algorithm:"      "~\\ref{%s}" nil ("Algorithm" "Algorithms" "Algoritmo" "Alg."))
              ("Problem"     ?b "problem:"        "~\\ref{%s}" nil ("Prob." "Problem" "Problems" "Problema"))
              ("Claim"       ?c "claim:"          "~\\ref{%s}" nil ("Claim" "Claims" "Asserzione"))
              ("Definition"  ?d "definition:"     "~\\ref{%s}" nil ("Def." "Definition" "Definizione"))
              ("definition"  ?d "definition:"     "~\\ref{%s}" nil ("Def." "Definition" "Definizione"))
              ("Exercise"    ?e "exercise:"       "~\\ref{%s}" nil ("Exercise" "Esercizio"))
              ("Program"     ?g "program:"        "~\\ref{%s}" nil ("Prog." "Program" "Programma"))
              ("Theorem"     ?h "theorem:"        "~\\ref{%s}" nil ("Thm" "Theorem" "Teorema"))
              ("Remark"      ?k "remark:"         "~\\ref{%s}" nil ("Remark" "Nota"))
              ("Lemma"       ?l "lemma:"          "~\\ref{%s}" nil ("Lemma" "Lemmas" "Lemmata"))
              ("Observation" ?o "observation:"    "~\\ref{%s}" nil ("Observation" "Observations" "Obs." "Osservazione"))
              ("Proposition" ?p "proposition:"    "~\\ref{%s}" nil ("Prop." "Proposition"  "Propositions" "Proposizione"))
              ("Corollary"   ?r "corollary:"      "~\\ref{%s}" nil ("Cor." "Corollary" "Corollario"))
              ("Example"     ?x "example:"        "~\\ref{%s}" nil ("Example" "Es." "Esempio"))
              )))

;; Define the functions that we calls from the toolbar


(defun LaTeX-run-BibTeX ()
  "Run BibTeX from the toolbar."
  (interactive)
  (TeX-command-master "BibTeX"))

(setq TeX-view-program-selection '((output-pdf "Evince")))
(setq TeX-view-program-list '(("Evince" "evince --page-index=%(outpage) %o")))
(defun LaTeX-view ()
  "Run the View command from the toolbar. Automagicly inhibits
the confirmation garbage."
  (interactive)
  (let* ((entry (copy-sequence (assoc "View" TeX-command-list)))
         TeX-command-list)
    (rplaca (nthcdr 3 entry) nil)
    (setq TeX-command-list (list entry))
    (TeX-command-master "View")))

;; save a file and compile it with latex
(defun save-and-latex-file ()
  "Save and latex file"
  (interactive)
  (TeX-save-document (TeX-master-file))
  (if (file-exists-p "Makefile")
      (compile "make -k pdf")
      (TeX-command "LaTeX" 'TeX-master-file -1)))


;; following for latex, adapted from ess-smart-underscore
;; can also be implemented using sequential command http://www.emacswiki.org/emacs/SequentialCommand
(defun tex-smart-underscore ()
  "Smart \"_\" key: insert \"_{}\".
If the underscore key is pressed a second time, \"_{}\" is removed and replaced by the underscore."
  (interactive)
  (let ((assign-len (length "_{")))
    (if (and
         (>= (point) (+ assign-len (point-min))) ;check that we can move back
         (save-excursion
           (backward-char assign-len)
           (looking-at "_{}")))
      ;; If we are currently looking at ess-S-assign, replace it with _
        (progn
          (forward-char)
          (delete-backward-char (+ 1 assign-len))
          (insert "_"))
    (delete-horizontal-space)
    (insert "_{}")
    (backward-char))))

(defun tex-smart-caret ()
  "Smart \"^\" key: insert \"^{}\".
If the caret key is pressed a second time, \"^{}\" is removed and replaced by the caret."
  (interactive)
  (let ((assign-len (length "^{")))
    (if (and
         (>= (point) (+ assign-len (point-min))) ;check that we can move back
         (save-excursion
           (backward-char assign-len)
           (looking-at "\\^{}"))) ;; looking-at reads regexp, so need to escape the caret character
      ;; If we are currently looking at ess-S-assign, replace it with ^
        (progn
          (forward-char)
          (delete-backward-char (+ 1 assign-len))
          (insert "^"))
    (delete-horizontal-space)
    (insert "^{}")
    (backward-char))))


(defun tex-smart-period ()
  "Smart \".\" key: insert \".  \n\".
If the period key is pressed a second time, \".  \n\" is removed and replaced by the period."
  (interactive)
  (let ((assign-len (length ".    \n")))
    (if (and
         (>= (point) (+ assign-len (point-min))) ;check that we can move back
         (save-excursion
           (backward-char assign-len)
           (looking-at "\\.    ")))
      ;; If we are currently looking at ess-S-assign, replace it with _
        (progn
          (delete-backward-char assign-len)
          (insert "."))
    (delete-horizontal-space)
    (insert ".    \n"))))
