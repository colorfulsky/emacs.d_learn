;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/config-lisp")
(require 'init-packages)

(setq ring-bell-function 'ignore)


(tool-bar-mode 0)
(scroll-bar-mode 0)
;;(electric-indent-mode 0)
(global-linum-mode t)
(setq inhibit-splash-screen t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

;;(recentf-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.01)
 '(custom-safe-themes
   (quote
    ("c924950f6b5b92a064c5ad7063bb34fd3facead47cd0d761a31e7e76252996f7" default)))
 '(package-selected-packages (quote (popwin helm hungry-delete monokai-theme company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;set default cursor type
(setq-default cursor-type 'bar)

;;disable backup file
(setq make-backup-files nil)
;;(setq auto-save-default nil)
;;(setq auto-save-default t)

;;active recentf mode
  (require 'recentf)
  (recentf-mode t)
  (setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;add delete-selection-mode
(delete-selection-mode t)

;;open with full screen
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;add parents match
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;Highlight current line
(global-hl-line-mode t)

;;----------------------------------------------------




;;set smex
;;(require 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)



;;config undo quickly key
(global-set-key (kbd "C-/") 'undo)



;;config nodejs repl
;;(require 'nodejs-repl)

;;config js-comint
;;(require 'js-comint)
;;(setq inferior-js-program-command "node -i")


;;export shell to emacs nodejs
;;(exec-path-from-shell)


;;use native code to enable nodejs repl
 (defun node-repl () (interactive)
	(pop-to-buffer (make-comint "node-repl" "node" nil "--interactive")))

;;(node-repl)
;;

;;set auto-revert-mode
(global-auto-revert-mode t)



;;set abbrev mode ;make variables a alias
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("dong" "Hello Here dong is!")
					    ))
;;It's very intersting,Hello Here dong is! 

;;(find-file "~/.emacs.d/init-packages.el")

;;setting mit-scheme-----------------
(global-font-lock-mode 1)    
;;; Also highlight parens    
(setq show-paren-delay 0    
      show-paren-style 'parenthesis)    
(show-paren-mode 1)    
;;(setenv "MITSCHEME_LIBRARY_PATH" "C:/Program Files (x86)/MIT-GNU Scheme/lib")
;;; This is the binary name of my scheme implementation    
(setq scheme-program-name "mit-scheme")    
;;-----------------------
(setq exec-path (append exec-path '("C:/Program Files (x86)/MIT-GNU Scheme/bin")))

