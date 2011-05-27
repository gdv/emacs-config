;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                ;;;
;;; Some local functions                                           ;;;
;;;                                                                ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun source-untabify ()
  "Stolen from Jamie Zawinski's homepage,
  http://www.jwz.org/doc/tabs-vs-spaces.html
  Remove any right trailing whitespaces and convert any tab
  character to the spaces"
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (delete-region (match-beginning 0) (match-end 0)))
    (goto-char (point-min))
    (if (search-forward "\t" nil t)
        (untabify (1- (point)) (point-max))))
  nil)



;(defun indent-or-complete ()
;  "Complete if point is at end of a word, otherwise indent line."
;  (interactive)
;  (if (looking-at "\\>")
;      (dabbrev-expand nil)
;    (indent-for-tab-command)
;    ))
