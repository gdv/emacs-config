;;;diff-mode
(require 'diff-mode "diff-mode" t)
(setq ediff-diff-program "diff -EbBw")
(setq diff-switches "-u") ;; Default to unified diffs

;;(setq ediff-window-setup-function 'ediff-setup-windows-multiframe) ; standard setting
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;(set-default 'ediff-ignore-similar-regions 't)
