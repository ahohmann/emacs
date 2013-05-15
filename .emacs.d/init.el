;;----------------------------------------------------------------------
;; paths, loading files

;; local modules
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(byte-recompile-directory "~/.emacs.d/site-lisp")

;; load config files from init sub directory
(mapc 'load-file
      (directory-files
       (expand-file-name "~/.emacs.d/init") t "\\.el\\'"))

;;----------------------------------------------------------------------
;; small module configurations (not worth a separate file in init/)

(require 'table)
(add-hook 'text-mode-hook 'table-recognize)

(require 'buffer-move)

(add-to-list 'load-path "~/.emacs.d/site-lisp/expand-region")
(require 'expand-region)

(ido-mode)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-ignore-extensions t)

(add-to-list 'load-path "~/.emacs.d/site-lisp/multiple-cursors")
(require 'multiple-cursors)

(add-to-list 'load-path "~/.emacs.d/site-lisp/mark-multiple")
(require 'inline-string-rectangle)

(windmove-default-keybindings)

(add-to-list 'load-path "~/.emacs.d/site-lisp/yasnippet")
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
	"~/.emacs.d/site-list/yasnippet/snippets"))
(yas-global-mode 1)

