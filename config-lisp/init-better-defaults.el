(setq ring-bell-function 'ignore)

;;set auto-revert-mode
(global-auto-revert-mode t)

;;set abbrev mode ;make variables a alias
(abbrev-mode t)
(add-hook 'emacs-lisp-mode-hook 'abbrev-mode)
(define-abbrev-table 'global-abbrev-table '(
					    ("dong" "Hello Here dong is!")
					    ))
;;It's very intersting,Hello Here dong is! 

;;(find-file "~/.emacs.d/init-packages.el")

;;disable backup file
(setq make-backup-files nil)
;;(setq auto-save-default nil)
;;(setq auto-save-default t)

;;active recentf mode
  (require 'recentf)
  (recentf-mode t)
  (setq recentf-max-menu-items 25)


;;add delete-selection-mode
(delete-selection-mode t)

;;add parents match
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)






(provide 'init-better-defaults)

