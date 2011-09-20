;(autoload 'python-mode "python-mode" "Python Mode." t)

(add-to-list 'load-path "~/Devel/External/python.el")
(require 'python)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(defvar python-last-buffer nil
  "Name of the Python buffer that last invoked `toggle-between-python-buffers'")

(make-variable-buffer-local 'python-last-buffer)

(defun toggle-between-python-buffers ()
  "Toggles between a `python-mode' buffer and its inferior Python process

When invoked from a `python-mode' buffer it will switch the
active buffer to its associated Python process. If the command is
invoked from a Python process, it will switch back to the `python-mode' buffer."
  (interactive)
  ;; check if `major-mode' is `python-mode' and if it is, we check if
  ;; the process referenced in `python-buffer' is running
  (if (and (eq major-mode 'python-mode)
           (processp (get-buffer-process python-buffer)))
      (progn
        ;; store a reference to the current *other* buffer; relying
        ;; on `other-buffer' alone wouldn't be wise as it would never work
        ;; if a user were to switch away from the inferior Python
        ;; process to a buffer that isn't our current one.
        (switch-to-buffer python-buffer)
        (setq python-last-buffer (other-buffer)))
    ;; switch back to the last `python-mode' buffer, but only if it
    ;; still exists.
    (when (eq major-mode 'inferior-python-mode)
      (if (buffer-live-p python-last-buffer)
           (switch-to-buffer python-last-buffer)
        ;; buffer's dead; clear the variable.
        (setq python-last-buffer nil)))))

 (add-hook 'python-mode-hook
   #'(lambda ()
       (unless (eq buffer-file-name nil) (flymake-mode 1)) ;dont invoke flymake on temporary buffers for the interpreter
       (local-set-key [(shift f2)] 'flymake-goto-prev-error)
       (local-set-key [f2] 'flymake-goto-next-error)
       (local-set-key [(f11)] 'flymake-display-err-menu-for-current-line)
       (local-set-key [(control m)] 'newline-and-indent)
       (local-set-key [(f12)] 'python-shell-switch-to-shell)
       (subword-mode 1)
       (which-func-mode 1)
       (setq
        python-check-command "pycheckers"
        python-shell-interpreter "python3 /home/dellavedova/temp/External/ipython-py3k/ipython.py"
        python-shell-interpreter-args '( "-colors" "Linux")
        python-shell-prompt-regexp "In \\[[0-9]+\\]: "
        python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
        python-shell-completion-setup-code ""
        python-shell-completion-string-code "';'.join(__IP.complete('''%s'''))\n")
       ))

;; delete trailing whitespaces
(add-hook 'python-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (delete-trailing-whitespace))))))

;; Flymake for python
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
           (local-file (file-relative-name temp-file
                                           (file-name-directory buffer-file-name))))
      (list "pycheckers"  (list local-file))))
   (add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init)))

;;
;;;; develock-py.el
;;;;;
;;;;; Made by Daniel Farina
;;;;; Login   <drfarina@acm.org>
;;;;;
;;;;; Started on  Sun Feb 14 09:21:21 2010 Daniel Farina
;;;;; Last update Sun Feb 14 09:27:12 2010 Daniel Farina
;;;;;
;;;
;(require 'develock)
;;;
;(defcustom develock-python-font-lock-keywords
; '(;; a long line
;  (develock-find-long-lines
;   (1 'develock-long-line-1 t)
;    (2 'develock-long-line-2 t))
;     ;; long spaces
;      (develock-find-tab-or-long-space
;       (1 'develock-whitespace-2)
;        (2 'develock-whitespace-3 nil t))
;         ;; trailing whitespace
;          ("[^\t\n ]\\([\t ]+\\)$"
;           (1 'develock-whitespace-1 t))
;            ;; spaces before tabs
;             ("\\( +\\)\\(\t+\\)"
;              (1 'develock-whitespace-1 t)
;               (2 'develock-whitespace-2 t))
;                ;; tab space tab
;                 ("\\(\t\\) \t"
;                  (1 'develock-whitespace-2 append))
;                   ;; only tabs or spaces in the line
;                    ("^[\t ]+$"
;                     (0 'develock-whitespace-2 append))
;                      ;; reachable E-mail addresses
;                       ("<?[-+.0-9A-Z_a-z]+@[-0-9A-Z_a-z]+\\(\\.[-0-9A-Z_a-z]+\\)+>?"
;                        (0 'develock-reachable-mail-address t))
;                         ;; things to be paid attention
;                          ("\\<\\(?:[Ff][Ii][Xx][Mm][Ee]\\|[Tt][Oo][Dd][Oo]\\)\\(?::\\|\\>\\)"
;                           (0 'develock-attention t)))
;                            "Extraordinary level highlighting for the
;                            Python mode."
;                             :type develock-keywords-custom-type
;                              :set 'develock-keywords-custom-set
;                               :group 'develock
;                                :group 'font-lock)
;
;                                (defvar python-font-lock-keywords-x
;                                nil
;                                 "Extraordinary level font-lock
;                                 keywords for the Python mode.")
;
;                                 (setq develock-keywords-alist
;                                  (cons '(python-mode
;                                   python-font-lock-keywords-x
;                                    develock-python-font-lock-keywords)
;                                     develock-keywords-alist))
;
;                                     (plist-put
;                                     develock-max-column-plist
;                                     'python-mode 79)
