(require 'tls)
(require 'erc)
(defun start-irc ()
   "Connect to IRC."
   (interactive)
   (erc-tls :server "irc.oftc.net" :port 6697
            :password "kah3Ieya"
        :nick "gianlucadv" :full-name "Gianluca Della Vedova")
   (erc-tls :server "calvino.freenode.net" :port 6667
            :password "kah3Ieya"
        :nick "gianlucadv" :full-name "Gianluca Della Vedova")
   (setq erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#screen" "#ion")
                                       ("oftc.net" "#debian"))))
