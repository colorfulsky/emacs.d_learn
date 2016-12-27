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
			  popwin
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
;;Melpa
;;more package
(setq package-archives
      '(;;("gnu" . "http://elpa.gnu.org/packages/")
;;    ("melpa-stable" . "http://stable.melpa.org/packages/")
	;; ("melpa" . "https://melpa.org/packages/")
	 ("pokit" . "http://elpa.popkit.org/packages/")))
;;------------------------------------------------
(require 'hungry-delete)
(global-hungry-delete-mode t)

;;configure smartparens
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode-hook)
(smartparens-global-mode t)


;;config javascript in js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


;;set swiper as well as counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;;config company mode
(global-company-mode t)

;;load theme
(load-theme 'monokai t)

;; set popwin
(require 'popwin)
(popwin-mode t)

;;Always to  be the last one
(provide 'init-packages)
