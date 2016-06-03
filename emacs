(load-file ".emacs.d/personal_info.el")

(setq gnus-select-method '(nnimap "gmail"
				   (nnimap-address "imap.gmail.com")
				   (nnimap-server-port 993)
				   (nnimap-stream ssl)))

;;(require 'bbdb)
;;(load "bbdb-com" t)
;;(bbdb-initialize 'gnus 'message)
;;(bbdb-insinuate-message)
;;(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
;;(setq bbdb/news-auto-create-p t)

(require 'cl)

;; not certain what's special about this package that it can't be required without extra work
(load-file ".emacs.d/elpa/framemove-20130328.433/framemove.el")
(require 'framemove)
(global-set-key (kbd "C-c f") #'windmove-right)
(global-set-key (kbd "C-c b") #'windmove-left)
(global-set-key (kbd "C-c n") #'windmove-down)
(global-set-key (kbd "C-c p") #'windmove-up)
(setq framemove-hook-into-windmove t)

(global-set-key (kbd "C-c r") #'gnus)
(global-set-key (kbd "C-c w") #'eww)

(global-set-key (kbd "C-x C-f") #'find-file-in-repository)
(global-set-key (kbd "C-x f") #'find-file)

(global-set-key (kbd "C-c q") #'bury-buffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "red3" "green3" "yellow3" "royal blue" "magenta3" "cyan3" "gray90"])
 '(c-basic-offset 4)
 '(c-offsets-alist
   (quote
    ((substatement-open . 0)
     (arglist-intro . +)
     (arglist-cont . 0)
     (arglist-cont-nonempty . +)
     (arglist-close . 0)
     (innamespace . 0)
     (template-args-cont . +))))
 '(case-fold-search t)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(doc-view-continuous t)
 '(gnus-use-full-window nil)
 '(indent-tabs-mode nil)
 '(jabber-account-list
   (quote
    ((gmail-user-name
      (:network-server . "talk.google.com")
      (:connection-type . starttls)))))
 '(magit-diff-arguments (quote ("--ignore-space-change")))
 '(send-mail-function (quote smtpmail-send-it))
 '(smftpmail-smtp-service 587)
 '(smtpmail-smtp-server "smtp.gmail.com"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-hook 'shell-mode-hook #'compilation-shell-minor-mode)
(column-number-mode)

(ggtags-mode)
(global-set-key (kbd "C-.") #'ggtags-find-definition)
(global-set-key (kbd "C-,") #'ggtags-find-reference)

(helm-mode)

(require 'magit)
(global-set-key (kbd "C-c g") #'magit-status)

;; not certain what's special about this package that it can't be required without extra work
(load-file ".emacs.d/elpa/magit-gerrit-20160111.1848/magit-gerrit.el")
(require 'magit-gerrit)
;;(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook #'delete-trailing-whitespace)

(when (getenv "DISPLAY")
  (setq x-select-enable-clipboard t)
  (setq interprogram-paste-function 'x-cut-buffer-or-selection-value))

(global-visual-line-mode 1)
(setq visual-line-mode-qmap nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq rcirc-server-alist `((,my-irc-server
                            :channels ,irc-channel-list :user-name ,irc-user-name :password ,irc-password
                            :encryption tls :port 6697 :nick ,irc-user-name)))

(rcirc-track-minor-mode 1)
