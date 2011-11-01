;; Mostly from http://emacs-fu.blogspot.com/2009/06/erc-emacs-irc-client.html

(require 'tls)
(require 'erc)
(erc-autojoin-mode t)
;; make sure to use wildcards for e.g. freenode as the actual server
;; name can be be a bit different, which would screw up autoconnect
(setq erc-autojoin-channels-alist '((".*\\.freenode.net" "#emacs" "#screen" "#pdigin" "#bioruby" "#ubuntu" "#git"
                                     "#Cyanogenmod" "##c" "#ubuntu-devel" "#xbmc-linux" "#diaspora" )
                                    ;(".*\\.oftc.net" "#debian")
                                    ))

;; check channels
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "324" "329" "332" "333" "353" "477"))
;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

(defun start-irc ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.freenode.net:6667") ;; ERC already active?
      (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      ;; (erc-tls :server "irc.oftc.net" :port 6697
      ;;          :password "kah3Ieya"
      ;;          :nick "gianlucadv" :full-name "Gianluca Della Vedova")
      (erc-tls :server "calvino.freenode.net" :port 6697
               :password "kah3Ieya"
               :nick "gianlucadv" :full-name "Gianluca Della Vedova"))))
