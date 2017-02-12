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

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
    "Highlight enclosing parens."
    (cond ((looking-at-p "\\s(") (funcall fn))
          (t (save-excursion
               (ignore-errors (backward-up-list))
               (funcall fn)))))


;;test to use autoload function
;;;###autoload
(defun test-autoload()
  (interactive)
  (message "test autoload"))

;;config dired mode

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-copies t)
(setq dired-recursive-deletes t)

(put 'dired-find-alternate-file 'disabled nil)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'dired-x)
(setq dired-dwim-target t)


;;config dos ^M to nil
(defun remove-dos-eof()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun hidden_dos_eol()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;;config for occur-dwim
  (defun occur-dwim ()
    "Call 'occur' with a same default."
    (interactive)
    (push (if (region-active-p)
              (buffer-substring-no-properties
               (region-beginning)
               (region-end))
            (let ((sym (thing-at-point 'symbol)))
              (when (stringp sym)
                (regexp-quote sym))))
          regexp-history)
    (call-interactively 'occur))


;;set default language environment as 'UTF-8'
(set-language-environment "UTF-8")

(provide 'init-better-defaults)

