

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)



;;config undo quickly key
(global-set-key (kbd "C-/") 'undo)

;;recentf mode
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;config hippie-expand to help company-mode better
(global-set-key (kbd "M-/") 'hippie-expand)

;;config for occur-dwim
(global-set-key (kbd "M-s o") 'occur-dwim)

;;config for imenu
(global-set-key (kbd "M-s i") 'counsel-imenu)

;;config for regoin
(global-set-key (kbd "C-=") 'er/expand-region)

;;config for iedit
(global-set-key (kbd "M-s e") 'iedit-mode)

;;config for company when you choose sub items
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))



(provide 'init-keybindings)

