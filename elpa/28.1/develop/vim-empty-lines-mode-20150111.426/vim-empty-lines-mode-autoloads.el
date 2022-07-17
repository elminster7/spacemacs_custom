;;; vim-empty-lines-mode-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "vim-empty-lines-mode" "vim-empty-lines-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vim-empty-lines-mode.el

(autoload 'vim-empty-lines-mode "vim-empty-lines-mode" "\
Display `vim-empty-lines-indicator' on visible lines after the end of the buffer.

This is a minor mode.  If called interactively, toggle the
`Vim-Empty-Lines mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `vim-empty-lines-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

This differs from `indicate-empty-lines' in the way that it deals
with trailing newlines.

\(fn &optional ARG)" t nil)

(put 'global-vim-empty-lines-mode 'globalized-minor-mode t)

(defvar global-vim-empty-lines-mode nil "\
Non-nil if Global Vim-Empty-Lines mode is enabled.
See the `global-vim-empty-lines-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-vim-empty-lines-mode'.")

(custom-autoload 'global-vim-empty-lines-mode "vim-empty-lines-mode" nil)

(autoload 'global-vim-empty-lines-mode "vim-empty-lines-mode" "\
Toggle Vim-Empty-Lines mode in all buffers.
With prefix ARG, enable Global Vim-Empty-Lines mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Vim-Empty-Lines mode is enabled in all buffers where `(lambda nil (unless (or
\(minibufferp) (string-match-p \\*Echo Area [0-9]+\\* (buffer-name)))
\(vim-empty-lines-mode 1)))' would do it.

See `vim-empty-lines-mode' for more information on Vim-Empty-Lines mode.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "vim-empty-lines-mode" '("vim-empty-lines-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vim-empty-lines-mode-autoloads.el ends here
