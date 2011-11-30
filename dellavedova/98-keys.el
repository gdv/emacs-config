;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                      Global Keys                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [(insert)]             'save-buffer)
;; (global-set-key [(control right)]      'forward-word)
;; (global-set-key [(control left)]       'backward-word)
;(global-set-key [(tab)]                'indent-or-complete)
(global-set-key [(control begin)]      'beginning-of-buffer)
(global-set-key [(control  end)]       'end-of-buffer)
(global-set-key [(select)]             'query-replace)
(global-set-key [(meta g)]             'goto-line)
(global-set-key [(control delete)]     'copy-entire-line)
(global-set-key [(remove)]             'kill-region)
(global-set-key [(shift remove)]       'copy-region-as-kill)
(global-set-key [(find)]               'isearch-forward)
(global-set-key [(control f)]          'isearch-forward)
(global-set-key [(meta f)]             'query-replace)
(global-set-key [(control s)]          'save-buffer)
(global-set-key [(shift find)]         'isearch-backward)
(global-set-key [(control shift f)]    'isearch-backward)
(global-set-key [(control find)]       'isearch-repeat-forward)
(global-set-key [(control shift find)] 'isearch-repeat-backward)
(global-set-key [(execute)]            'execute-extended-command)
(global-set-key [(control z)]          'undo)
(global-set-key [(menu)]               'execute-extended-command)
(global-set-key [(f2)]                 'next-error)
(global-set-key [(f3)]                 'isearch-repeat-forward)
(global-set-key [(f4)]                 'kill-buffer)
(global-set-key [(f6)]                 'kmacro-start-macro)
(global-set-key [(shift f6)]           'kmacro-end-macro)
(global-set-key [(control f6)]         'kmacro-end-macro)
(global-set-key [(f7)]                 'kmacro-end-and-call-macro)
(global-set-key [(f8)]                 'magit-status)
(global-set-key [(f12)]                'compile)
(global-set-key (kbd "C-x 3") 'follow-delete-other-windows-and-split)


(global-set-key [(button1)]         'mouse-track)
(global-set-key [(button2)]         'x-set-point-and-insert-selection)
(global-set-key [(button3)]         'popup-mode-menu)
(global-set-key [(alt \8)]           "(")
(global-set-key [(alt \9)]           ")")
(global-set-key [(alt \0)]           "[")
(global-set-key [(alt \')]           "]")
(global-set-key [(alt .)]           "{")
(global-set-key [(alt -)]           "}")
(global-set-key (kbd "ç") (kbd "{"))
(global-set-key (kbd "°") (kbd "}"))
(global-set-key (kbd "§") (kbd "`"))


(global-set-key "\C-c;" 'comment-region)
(global-set-key "\C-c:" 'uncomment-region)
(global-set-key "\C-c_" 'comment-box)

(global-set-key [kp-add]          'copy-region-as-kill)
(global-set-key [kp-subtract]          'kill-region)
(global-set-key [kp-multiply]          'yank)
(global-set-key [kp-divide]          'execute-extended-command)
;(global-set-key [kp-enter]          'yank)
(global-set-key "\r" 'reindent-then-newline-and-indent)

;; Ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; I do not want windmove to interfere with my keybindings
(windmove-default-keybindings 'meta)

;;
(global-set-key [(control f10)]        'anything)


;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
