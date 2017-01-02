

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

(provide 'init-keybindings)

