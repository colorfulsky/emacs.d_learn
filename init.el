
;;- turn off tool-bar
;;- turn off scroll-bar
;;- show linum-mode
;;- turn off splash screen
;;- save your config
;;- define a function to quickly open your config file.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;;Enforce your package manage system.
  (when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    )
  (require 'cl)

  ;;add package you want here
  (defvar dong/packages '(
                          company
			  monokai-theme
			  hungry-delete
;;			  smex
			  swiper
			  counsel
			  smartparens
			  js2-mode
			  ;;nodejs-repl
;;			  js-comint
			  ;;			  exec-path-from-shell
;;			  elpy
                          ) "Default packages")

(setq dong/packages-installed-p 'dong/packages)

  (defun dong/packages-installed-p ()
    (loop for pkg in dong/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

  (unless (dong/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg dong/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))
;;------------------------------------------------------------------

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

;;Melpa
;;more package
(setq package-archives
      '(;;("gnu" . "http://elpa.gnu.org/packages/")
;;    ("melpa-stable" . "http://stable.melpa.org/packages/")
	;; ("melpa" . "https://melpa.org/packages/")
	 ("pokit" . "http://elpa.popkit.org/packages/")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.01)
 '(custom-safe-themes
   (quote
    ("c924950f6b5b92a064c5ad7063bb34fd3facead47cd0d761a31e7e76252996f7" default)))
 '(package-selected-packages (quote (helm hungry-delete monokai-theme company))))
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

(global-company-mode t)

;;load theme
(load-theme 'monokai t)

(require 'hungry-delete)
(global-hungry-delete-mode t)


;;set smex
;;(require 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)

;;set swiper as well as counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;;configure smartparens
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode-hook)
(smartparens-global-mode t)


;;config undo quickly key
(global-set-key (kbd "C-/") 'undo)


;;config javascript in js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

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
