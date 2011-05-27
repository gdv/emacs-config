(require 'ispell)
;; When running ispell, consider all 1-3 character words as correct.
(setq ispell-extra-args '("-W" "3"))

;;; ISpell / ASpell
(setq ispell-silently-savep t) ;save new words in pdict without questioning
(setq ispell-help-in-bufferp 'electric) ;get a better help buffer
(setq ispell-program-name "aspell")

;; Load flyspell mode
(require 'flyspell)
