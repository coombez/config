(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(require 'cl)

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
 '(magit-commit-arguments nil)
 '(magit-diff-arguments (quote ("--ignore-space-change")))
 '(magit-diff-section-arguments (quote ("--no-ext-diff")))
 '(package-selected-packages
   (quote
    (helm find-file-in-repository))))


(add-hook 'shell-mode-hook #'compilation-shell-minor-mode)
(column-number-mode)

(require 'helm)
(helm-mode)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x f") #'helm-find-files)

(require 'find-file-in-repository)
(global-set-key (kbd "C-x C-f") #'find-file-in-repository)
;;(global-set-key (kbd "C-x f") #'find-file)

(require 'magit)
(global-set-key (kbd "C-c g") #'magit-status)

(add-hook 'before-save-hook #'delete-trailing-whitespace)
(setq magit-diff-refine-hunk #'all)

(when (getenv "DISPLAY")
  (setq x-select-enable-clipboard t)
  (setq interprogram-paste-function 'x-cut-buffer-or-selection-value))

(global-visual-line-mode 1)
(setq visual-line-mode-qmap nil)
