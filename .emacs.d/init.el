;;------------------------------------------------------------------------------
;; paths, loading files

;; local modules
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(byte-recompile-directory "~/.emacs.d/site-lisp")

;; load config files from init sub directory
(mapc 'load-file
      (directory-files
       (expand-file-name "~/.emacs.d/init") t "\\.el\\'"))

