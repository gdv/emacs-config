;; Ruby related init

(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(autoload 'run-ruby "inf-ruby"   "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"   "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))

 (defun my-ruby-mode-hook ()
   (interactive)
   (setq ruby-deep-arglist t)
   (setq ruby-deep-indent-paren nil)
   (setq c-tab-always-indent nil)
   (require 'inf-ruby)
   (require 'ruby-compilation)
   ;; keybindings
   (inf-ruby-keys)
   ;; turn off the annoying input echo in irb
   (setq comint-process-echoes t)
   (ruby-block-mode t)
   (local-set-key (kbd "C-h r") 'yari)
   (define-key ruby-mode-map [f12] 'compile-ruby)
   (yas/minor-mode-on)

   ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
   (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
       (flymake-mode))
   (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
   (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
   (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)
   )

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

;; yari provides a nice Emacs interface to ri
(require 'yari)

;; HAML and SASS are quite handy in Rails development
(require 'haml-mode)
(require 'scss-mode)

;; functions used in init
(defun compile-ruby ()
  (if (file-exists-p "Makefile")
      (compile "make -k"))
  (if (file-exists-p "Rakefile")
      (compile "rake -k")))

;; I don't like the default colors :)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))


