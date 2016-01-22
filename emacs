(load-file ".emacs.d/personal_info.el")

(setq gnus-select-method '(nnimap "gmail"
				   (nnimap-address "imap.gmail.com")
				   (nnimap-server-port 993)
				   (nnimap-stream ssl)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(c-offsets-alist
   (quote
    ((substatement-open . 0)
     (arglist-intro . +)
     (arglist-cont . 0)
     (arglist-cont-nonempty . +)
     (arglist-close . 0)
     (innamespace . 0))))
 '(case-fold-search t)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(doc-view-continuous t)
 '(gnus-use-full-window nil)
 '(indent-tabs-mode nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587))

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
