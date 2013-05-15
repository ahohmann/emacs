(defun set-window-buffer-to-shell ()
  "Shows the *shell* buffer or opens a new shell if it does not exist."
  (interactive)
  (let ((shell-buffer (get-buffer "*shell*")))
    (if shell-buffer
	(set-window-buffer nil shell-buffer)
      (shell))))

(defun call-keyword-completion ()
  "Call the command that has keyboard shortcut M-<tab>."
  (interactive)
  (call-interactively (key-binding "M-TAB")))

(defun other-window-q ()
  "Types q in other window. Useful to close popup dialogs."
  (interactive)
  (save-excursion
    (other-window 1)
    (call-interactively (key-binding (kbd "q")))))

;; See http://lists.gnu.org/archive/html/help-gnu-emacs/2006-12/msg00103.html.
(defun rotate-split ()
  (interactive)
  (let ((root (car (window-tree))))
    (if (listp root)
        (let* ((w1 (nth 2 root))
               (w2 (nth 3 root))
               (b1 (window-buffer w1))
               (b2 (window-buffer w2)))
          (cond ((car root)             ; currently vertically split
                 (delete-window w2)
                 (set-window-buffer (split-window-horizontally) b2))
                (t                      ; currently horizontally split
                 (delete-window w1)
                 (set-window-buffer (split-window-vertically) b1))))
      (message "Root window not split"))))

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
	(exchange-point-and-mark))
    (let ((column (current-column))
	  (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
	(forward-line)
	(when (or (< arg 0) (not (eobp)))
	  (transpose-lines arg))
	(forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-move active) or current line
  ARG lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-move active) or current line
  ARG lines up."
  (interactive "*p")
  (move-text-internal (- arg)))
