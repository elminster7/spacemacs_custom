;;; pylookup-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "pylookup" "pylookup.el" (0 0 0 0))
;;; Generated autoloads from pylookup.el

(autoload 'pylookup-lookup "pylookup" "\
Lookup SEARCH-TERM in the Python HTML indexes.

\(fn SEARCH-TERM)" t nil)

(autoload 'pylookup-set-search-option "pylookup" "\
Set search option interactively

\(fn OPTION-STRING)" t nil)

(autoload 'pylookup-update "pylookup" "\
Run pylookup-update and create the database at `pylookup-db-file'.

\(fn SRC &optional APPEND)" t nil)

(autoload 'pylookup-update-all "pylookup" "\
Run pylookup-update for all sources and create the database at `pylookup-db-file'." t nil)

(autoload 'pylookup-lookup-at-point "pylookup" "\
Query the for string with help of word read at point and call `pylookup-lookup'" t nil)

(register-definition-prefixes "pylookup" '("pylookup-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pylookup-autoloads.el ends here
