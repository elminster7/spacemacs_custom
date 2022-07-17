;;; sphinx-doc-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "sphinx-doc" "sphinx-doc.el" (0 0 0 0))
;;; Generated autoloads from sphinx-doc.el

(autoload 'sphinx-doc-mode "sphinx-doc" "\
Sphinx friendly docstring generation for Python code.

This is a minor mode.  If called interactively, toggle the
`Sphinx-Doc mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `sphinx-doc-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "sphinx-doc" '("sphinx-doc"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; sphinx-doc-autoloads.el ends here
