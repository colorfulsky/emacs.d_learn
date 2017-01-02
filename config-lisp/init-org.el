(require 'org)

(setq org-src-fontify-natively t)

(setq org-agenda-files '("c:/Users/dong/Dropbox/emacs_file"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
