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

(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)

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

(add-to-list 'load-path "~/.emacs.d/site-lisp/js2-mode")
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;; markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; julia
(require 'julia-mode)

(defun mechanics ()
  (interactive)
  (run-scheme
    "/usr/local/scmutils/mit-scheme/bin/scheme --library /usr/local/scmutils/mit-scheme/lib"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-offsets-alist (quote ((innamespace . 0))))
 '(column-number-mode t)
 '(js2-basic-offset 2)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
