;;; PHP

(add-hook 'php-mode-hook 'my-php-hook)

(defun my-php-hook ()
  (interactive)
  (make-local-variable 'write-contents-hooks)
  (add-hook 'write-contents-hooks 'source-untabify)
  (setq buffer-file-coding-system 'utf-8)
  ;; Pear coding standards : http://pear.php.net/manual/en/standards.indenting.php
  (setq case-fold-search t)
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (setq c-basic-offset 4)
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'case-label 2)
  (c-set-offset 'arglist-close 0)
  (flymake-mode 1)
;  (define-key php-mode-map [(meta up)] ‘flymake-goto-next-error)
;  (define-key php-mode-map [(meta down)] ‘flymake-goto-next-error)
  (set (make-local-variable 'compile-command)
       (format "php_lint %s" (buffer-file-name)))
  )



          
; Taken from http://www.enigmacurry.com/2011/07/01/php-code-compliance-in-emacs/

(require 'php-mode)

; Flymake

(defun flymake-php-init ()
  "Use php and phpcs to check the syntax and code compliance of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
         (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "php_lint" (list local))))

;;This is the error format for : php -f somefile.php -l
(add-to-list 'flymake-err-line-patterns '("\(Parse\|Fatal\) error: +\(.?\) in \(.?\) on line \([0-9]+\)$" 3 4 nil 2))
(add-to-list 'flymake-allowed-file-name-masks '("\.php$" flymake-php-init))
