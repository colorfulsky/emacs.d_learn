;;Enforce your package manage system.
  (when (>= emacs-major-version 24)
    (require 'package)

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
			  web-mode
			  js2-refactor
			  color-theme-sanityinc-solarized
			  expand-region
			  iedit
			  org-pomodoro
			  ;;			  helm-ag
			  anaconda-mode
			  company-anaconda
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
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
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

;;setting mit-scheme-----------------
(global-font-lock-mode 1)    
;;; Also highlight parens    
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)    
(show-paren-mode 1)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)
;;(setenv "MITSCHEME_LIBRARY_PATH" "C:/Program Files (x86)/MIT-GNU Scheme/lib")
;;; This is the binary name of my scheme implementation    
(setq scheme-program-name "mit-scheme")    

(setq exec-path (append exec-path '("C:/Program Files (x86)/MIT-GNU Scheme/bin")))


;;-----------------------
;;use native code to enable nodejs repl
 (defun node-repl () (interactive)
	(pop-to-buffer (make-comint "node-repl" "node" nil "--interactive")))

;;(node-repl)



;;-----------------------------web-mode indent
  (defun my-web-mode-indent-setup ()
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    )

  (add-hook 'web-mode-hook 'my-web-mode-indent-setup)

  (defun my-toggle-web-indent ()
    (interactive)
    (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
        (progn
          (setq js-indent-level (if (= js-indent-level 2) 4 2))
          (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))
    (if (eq major-mode 'web-mode)
        (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
               (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
               (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
    (if (eq major-mode 'css-mode)
        (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
    (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)


;;--------------------------- config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")


;;-----------------require for expand-region
(require 'expand-region)


;;----config for company-anaconda
(eval-after-load "company"
 '(add-to-list 'company-backends 'company-anaconda))
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;;Always to  be the last one
(provide 'init-packages)
