(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)
(global-set-key [C-down-mouse-1] 'hs-mouse-toggle-hiding)
(global-set-key (kbd "C-z") 'set-window-buffer-to-shell)

(global-set-key (kbd "M-S-<up>") 'er/expand-region)
(global-set-key (kbd "M-S-<down>") 'er/contract-region)

(global-unset-key (kbd "M-t")) ; which is normally transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

(global-set-key (kbd "C-S-<up>") 'buf-move-up)
(global-set-key (kbd "C-S-<down>") 'buf-move-down)
(global-set-key (kbd "C-S-<left>") 'buf-move-left)
(global-set-key (kbd "C-S-<right>") 'buf-move-right)

;; mark-multiple
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

(global-set-key (kbd "C-x f") 'follow-mode)
(global-set-key (kbd "C-x 4 q") 'other-window-q)
(global-set-key (kbd "C-c w r") 'rotate-split)

(global-set-key (kbd "C-c m m") 'idomenu)
(global-set-key (kbd "C-c m b") 'imenu)

(global-set-key (kbd "C-c k") 'delte-this-buffer-and-file)

(define-key emacs-lisp-mode-map (kbd "C-<return>") 'call-keyword-completion)

(global-set-key (kbd "C-c C-o")
		#'(lambda (regex)
		    (interactive "sList lines beginning with regexp ")
		    (occur (concat "^[[:space:]]*" regex))))


		     

