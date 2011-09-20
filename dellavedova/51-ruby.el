;; Ruby related init

(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))

 (defun my-ruby-mode-init ()
   (interactive)
   (setq ruby-deep-arglist t)
   (setq ruby-deep-indent-paren nil)
   (setq c-tab-always-indent nil)
   (require 'inf-ruby)
   (require 'ruby-compilation)
   ;; keybindings
   (define-key ruby-mode-map [f12] 'compile-ruby)
   )



;; functions used in init
(defun compile-ruby ()
  (if (file-exists-p "Makefile")
      (compile "make -k"))
  (if (file-exists-p "Rakefile")
      (compile "rake -k")))

