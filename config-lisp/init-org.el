(require 'org)

(setq org-src-fontify-natively t)

(setq org-agenda-files '("c:/Users/dong/Dropbox/emacs_learn_21days"
			 "~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)
;;(setq truncate-line t)

(require 'ob-ipython)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ipython . t)
	(python . t)
	(C . t)
	;; other languages..
   ))


(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")))

(global-set-key (kbd "C-c c") 'org-capture)



(provide 'init-org)
