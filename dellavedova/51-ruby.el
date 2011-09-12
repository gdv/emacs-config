;; Ruby related init

(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))


 (defun my-ruby-mode-init ()
   (interactive)

   ;; keybindings
   (define-key ruby-mode-map [f12] 'compile-ruby)
   )



;; functions used in init
(defun compile-ruby ()
  (if (file-exists-p "Makefile")
      (compile "make -k"))
  (if (file-exists-p "Rakefile")
      (compile "rake -k")))

