(load-file "~/.emacs.d/personal_info.el")

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
(load-file "~/.emacs.d/elpa/framemove-20130328.433/framemove.el")
(require 'framemove)
(global-set-key (kbd "C-c f") #'windmove-right)
(global-set-key (kbd "C-c b") #'windmove-left)
(global-set-key (kbd "C-c n") #'windmove-down)
(global-set-key (kbd "C-c p") #'windmove-up)
(global-set-key (kbd "C-c c f") (lambda () (interactive) (dotimes (i 2) (windmove-right)) ))
(global-set-key (kbd "C-c c b") (lambda () (interactive) (dotimes (i 2) (windmove-left)) ))
(global-set-key (kbd "C-c c n") (lambda () (interactive) (dotimes (i 2) (windmove-down)) ))
(global-set-key (kbd "C-c c p") (lambda () (interactive) (dotimes (i 2) (windmove-up)) ))
;;(global-set-key (kbd "C-/") #'undo)


(setq framemove-hook-into-windmove t)

(global-set-key (kbd "C-c r") #'gnus)

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
 '(column-number-mode t)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(doc-view-continuous t)
 '(gnus-use-full-window nil)
 '(indent-tabs-mode nil)
 '(jabber-account-list
   (\`
    (((\, gmail-user-name)
      (:network-server . "talk.google.com")
      (:connection-type . starttls)))))
 '(magit-commit-arguments nil)
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
(load-file "~/.emacs.d/elpa/magit-gerrit-20160111.1848/magit-gerrit.el")
(require 'magit-gerrit)
;;(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(setq magit-diff-refine-hunk #'all)

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
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 100 :width normal))))
 '(font-lock-function-name-face ((t (:foreground "mediumspringgreen" :weight bold :height 1.0)))))

(require 'xwidget)
(defun xwidget-browse-url-no-reuse (url &optional session)
    (interactive (progn
        (require 'browse-url)
        (browse-url-interactive-arg "URL: ")))
    (xwidget-webkit-browse-url url t))

(defun xwidget-browse-google () (interactive) (xwidget-browse-url-no-reuse "http://google.com"))

(global-set-key (kbd "C-c w") #'xwidget-browse-url-no-reuse)
(global-set-key (kbd "C-c C-w") #'xwidget-browse-google)
(setq browse-url-browser-function (lambda (url session) (other-window 1) (xwidget-browse-url-no-reuse url)))

(defun my-xwidget-webkit-scroll-up ()
  "Scroll webkit up."
  (interactive)
  (xwidget-set-adjustment (xwidget-webkit-current-session) 'vertical t 50))

(defun my-xwidget-webkit-scroll-down ()
  "Scroll webkit down."
  (interactive)
  (xwidget-set-adjustment (xwidget-webkit-current-session) 'vertical t -50))

(defun my-xwidget-webkit-scroll-forward ()
  "Scroll webkit forwards."
  (interactive)
  (xwidget-set-adjustment (xwidget-webkit-current-session) 'horizontal t 50))

(defun my-xwidget-webkit-scroll-backward ()
  "Scroll webkit backwards."
  (interactive)
  (xwidget-set-adjustment (xwidget-webkit-current-session) 'horizontal t -50))

(defun my-xwidget-webkit-jump-up ()
  "Scroll webkit up."
  (interactive)
  (xwidget-set-adjustment (xwidget-webkit-current-session) 'vertical t 1950))

(defun my-xwidget-webkit-jump-down ()
  "Scroll webkit down."
  (interactive)
  (xwidget-set-adjustment (xwidget-webkit-current-session) 'vertical t -1950))

(define-key xwidget-webkit-mode-map (kbd "C-n") #'my-xwidget-webkit-scroll-up)
(define-key xwidget-webkit-mode-map (kbd "C-p") #'my-xwidget-webkit-scroll-down)
(define-key xwidget-webkit-mode-map (kbd "C-f") #'my-xwidget-webkit-scroll-forward)
(define-key xwidget-webkit-mode-map (kbd "C-b") #'my-xwidget-webkit-scroll-backward)
(define-key xwidget-webkit-mode-map (kbd "C-v") #'my-xwidget-webkit-jump-up)
(define-key xwidget-webkit-mode-map (kbd "M-v") #'my-xwidget-webkit-jump-down)

(defun my-xwidget-webkit-insert-string (xw str)
  "Insert string STR in the active field in the webkit XW."
  ;; Read out the string in the field first and provide for edit.
  (interactive
   (let* ((xww (xwidget-webkit-current-session))

          (field-value
           (progn
             (xwidget-webkit-execute-script xww xwidget-webkit-activeelement-js)
             (xwidget-webkit-execute-script-rv
              xww
              "findactiveelement(document).value;")))
          (field-type (xwidget-webkit-execute-script-rv
                       xww
                       "findactiveelement(document).type;")))
     (list xww
           (cond ((equal "text" field-type)
                  (read-string "Text: " field-value))
                 ((equal "password" field-type)
                  (read-passwd "Password: " nil field-value))
                 ((equal "textarea" field-type)
                  (xwidget-webkit-begin-edit-textarea xww field-value))
                 (t (read-string "Text: " field-value))))))

  (xwidget-webkit-execute-script
   xw
   (format "findactiveelement(document).value='%s'" str)))

(define-key xwidget-webkit-mode-map (kbd "RET") #'my-xwidget-webkit-insert-string)

(setq rcirc-server-alist `((,my-irc-server
                            :channels ,irc-channel-list :user-name ,irc-user-name :password ,irc-password
                            :encryption tls :port 6697 :nick ,irc-user-name)))

(rcirc-track-minor-mode 1)

(rcirc)

(jabber-switch-to-roster-buffer)
