;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/config-lisp")
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)

(setq custom-file (expand-file-name "config-lisp/init-custom.el" user-emacs-directory))

(load-file custom-file)

(set-fontset-font "fontset-default"
		  'gb18030' ("Microsoft YaHei" . "unicode-bmp"));;微软雅黑

;;(load "init-ui")
;;load函数会首先查找此文件名的.elc文件，如果想要使用即兴更新的文件需要你使用编译方法首先进行编译。
;;bite-complete-file

;;(load-file) 命令可以以绝对路径的方式加载.elc文件或者.el文件。

;;(test-autoload)
;;(autoload 'test-autoload "init-better-defaults")
;;(setq my-local-dir "~/.emacs.d/config-lisp/")
;;(update-directory-autoloads my-local-dir)
