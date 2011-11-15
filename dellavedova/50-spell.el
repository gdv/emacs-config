(require 'ispell)

;;; ISpell / ASpell
(setq ispell-silently-savep t) ;save new words in pdict without questioning
(setq ispell-help-in-bufferp 'electric) ;get a better help buffer
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra" "-W" "3") ;; When running ispell, consider all 1-3 character words as correct.
)

;; flyspell-mode
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'message-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(defun turn-on-flyspell ()
  "Force flyspell-mode on using a positive argument.  For use in hooks."
  (interactive)
  (flyspell-mode 1))
