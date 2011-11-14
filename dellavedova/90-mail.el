(add-to-list 'auto-mode-alist
             '("\\mutt-*\\|.article\\|\\.followup"
               . mail-mode))

(add-hook
   'mail-mode-hook
   (lambda ()
     (auto-fill-mode t)
     (setq fill-column 72)    ; rfc 1855 for usenet messages
     (setq make-backup-files nil) ;;; No backups necessary.
     (require 'boxquote)
     (define-key mail-mode-map [(control c) (control c)]
       (lambda ()
         (interactive)
         (save-buffer)
         (server-edit)))))

;; mode:-*-emacs-lisp-*-
;; wanderlust 
(setq 
 wl-plugged t
 elmo-maildir-folder-path "~/Mail/"
 elmo-message-fetch-confirm t
 elmo-message-fetch-threshold 250000

 wl-stay-folder-window t                       ;; show the folder pane (left)
 wl-folder-window-width 25                     ;; toggle on/off with 'i'
 elmo-imap4-use-modified-utf7 t
 wl-thread-insert-opened t
 wl-thread-indent-level 1
 wl-thread-have-younger-brother-str "+"
 wl-thread-youngest-child-str       "+"
 wl-thread-vertical-str             "|"
 wl-thread-horizontal-str           "-"
 wl-thread-space-str                " "  

 ;; note: all below are dirs (Maildirs) under elmo-maildir-folder-path 
 ;; the '.'-prefix is for marking them as maildirs
 wl-fcc ".Sent"                       ;; sent msgs go to the "sent"-folder
 wl-fcc-force-as-read t               ;; mark sent messages as read 
 wl-default-folder ".OTHERS"           ;; my main inbox 
 wl-default-folder ".Managers"           ;; my main inbox 
 wl-default-folder ".Team"           ;; my main inbox 
 wl-draft-folder ".drafts"            ;; store drafts in 'postponed'
 wl-trash-folder ".trash"             ;; put trash in 'trash'
 wl-spam-folder ".trash"              ;; ...spam as well
 wl-queue-folder ".queue"             ;; we don't use this

 ;; check this folder periodically, and update modeline
 wl-biff-check-folder-list '(".linux")
 wl-biff-check-folder-list '(".OTHERS") ;; check every 180 seconds
 wl-biff-check-folder-list '(".Managers") ;; check every 180 seconds
 wl-biff-check-folder-list '(".Team") ;; check every 180 seconds
 wl-biff-check-interval 5



 ;; User Email addresses
 wl-user-mail-address-list nil

 wl-draft-reply-buffer-style 'keep
 wl-interactive-send nil
 wl-interactive-exit nil

 ;; Windows and decoration
 wl-folder-use-frame nil
 wl-highlight-body-too t
 wl-use-highlight-mouse-line nil
 wl-show-plug-status-on-modeline t
 wl-message-window-size '(1 . 4)
 ) 



;; Set mail-icon to be shown universally in the modeline.
(setq global-mode-string
      (cons
       '(wl-modeline-biff-status
         wl-modeline-biff-state-on
         wl-modeline-biff-state-off)
       global-mode-string))

;; Use wanderlust for default compose-mail
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

;; BUILD the folder tree automatically
;; Note: if you change the hierarchy and want to rebuild the tree do
;; rm -rf ~/Emacs/Wanderlust/Elmo/folder
(setq wl-folder-hierarchy-access-folders
      '("^.\\([^/.]+[/.]\\)*[^/.]+\\(:\\|@\\|$\\)"
        "^-[^.]*\\(:\\|@\\|$\\)"
        "^@$"
        "^'$"))

;; ----------------------------------------------------------------------------
;;; Summary

(setq wl-auto-select-next 'unread
      wl-summary-width nil
      wl-summary-weekday-name-lang "en"
      wl-summary-showto-folder-regexp ".Sent.*"
      ;;wl-summary-line-format "%n%T%P%M/%D(%W)%h:%m %t%[%17(%c %f%) %] %s"
      wl-summary-line-format "%T%P%M/%D(%W)%h:%m %[ %17f %]%[%1@%] %t%C%s"

      ;; Summary threads
      wl-thread-insert-opened t
      wl-thread-open-reading-thread t
      )

(setq
 wl-forward-subject-prefix "Fwd: " )    ;; use "Fwd: " not "Forward: "


;;; Message:

(setq mime-view-mailcap-files '("~/.emacs.d/wanderlust/mailcap")
      wl-message-ignored-field-list '("^.*:")
      wl-message-visible-field-list
      '("^\\(To\\|Cc\\):"
        "^Subject:"
        "^\\(From\\|Reply-To\\):"
        "^Organization:"
        "^X-Attribution:"
        "^\\(Posted\\|Date\\):"
        )
      wl-message-sort-field-list
      '("^From"
        "^Organization:"
        "^X-Attribution:"
        "^Subject"
        "^Date"
        "^To"
        "^Cc"))

;; ----------------------------------------------------------------------------
;;; Configure BBDB to manage Email addresses

(require 'bbdb-wl)
(bbdb-wl-setup)

(setq bbdb-use-pop-up t ;; Allow pop-ups
      bbdb-pop-up-target-lines 2
      bbdb/mail-auto-create-p t ;; auto collection
      bbdb-wl-ignore-folder-regexp "^@" ;; folders without auto collection
      bbdb-north-american-phone-numbers-p nil
      bbdb-auto-notes-alist '(("X-ML-Name" (".*$" ML 0)))
      bbdb-dwim-net-address-allow-redundancy t
      
      ;; shows the name of bbdb in the summary
      
      ;; Not with wl-summary-showto-folder-regexp
      ;;wl-summary-from-function 'bbdb-wl-from-func
      ;; Use the default:
      wl-summary-from-function 'wl-summary-default-from
      
      ;; Using BBDB for pet names is OK
      wl-summary-get-petname-function 'bbdb-wl-get-petname
      )

;; ----------------------------------------------------------------------------
;;; Configure recently used Email addresses


;; added hook.
(add-hook 'bbdb-notice-hook 'bbdb-auto-notes-hook)
(setq wl-biff-notify-hook '(ding))

;; xxxxxxxxxxxxxxx Set the templates xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
(setq wl-template-alist
      '(
        ("gmail"                            ; Gmail
         (wl-from . "Gianluca Della Vedova <gianluca@dellavedova.org>")
         ("From" . wl-from)

         ;; SMTP
         (wl-smtp-connection-type . 'starttls)
         (wl-smtp-posting-port . 587)
         (wl-smtp-authenticate-type ."plain")
         (wl-smtp-posting-user . "*****")
         (wl-smtp-posting-server . "smtp.gmail.com")
         (wl-local-domain . "gmail.com")
         ;; (wl-smtp-connection-type . 'starttls)
         ;; (wl-smtp-posting-port . 587)
         ;; (wl-smtp-authenticate-type . "plain")
         ;; (wl-smtp-posting-user . "****")
         ;; (wl-smtp-posting-server . "smtp.gmail.com")
         ;; (wl-local-domain . "localhost")
         ;; (signature-file-name . "/mnt/usb/root/.signature")
         )
        ("Work"
         (wl-from . "Deepak Tripathi <tripathi@office.net>")
         ("From" . wl-from)
         ;; (wl-smtp-connection-type . nil)
         (wl-smtp-posting-port . 25)
         ;;  (wl-smtp-authenticate-type . "login") ; change if necessary
         (wl-smtp-posting-user . "tripathi")
         (wl-smtp-posting-server . "mail.office.net")
         (wl-local-domain . ".office.net")
         (signature-file-name . "~/mnt/usb/root/.signature_work")
         )
        ))
;; xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

;; xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;; Automatically select the correct template based on which folder I'm visiting
(setq wl-draft-config-matchone t) ;; If non-nil, applied only one element of `wl-draft-config-alist'.

(setq wl-draft-config-alist
      '(
	( ; If I start a draft from my work e-mail folder and I'm using my
					; personal computer (from home) use the template "Work-From-Home". I
					; use a two different templates for my work E-Mail because I don't
					; have access to the smtp server of my work when I'm at home. But
					; since I can ssh to it i redirect a port to be able to sent e-mail
					; from home though the smtp server of my work
	 ;;  (and (string-match ".*WORK" wl-draft-parent-folder) (string-match "dtripathi" system-name))
	 ;; (template . "Work-From-Home")
	 ;; )
	 ;;  ( ; If I start a draft from my work e-mail folder and I'm using my
					; work computer, use the "Work" template
	 
	 (and (string-match ".*OTHERS.*\\|.*Managers.*\\|.*Team.*" wl-draft-parent-folder) )
	 (template . "Work")
         )
	( ;; If I start a draft from any other folder, use the "gmail" template.
	 (not (string-match ".*OTHERS.*\\|.*Managers.*\\|.*Team.*" wl-draft-parent-folder))
	 (template . "gmail")
	 )
	))

;; Apply wl-draft-config-alist as soon as you enter in a draft buffer. Without
;; this wanderlust would apply it only when actually sending the e-mail.
(add-hook 'wl-mail-setup-hook 'wl-draft-config-exec)
;; xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
