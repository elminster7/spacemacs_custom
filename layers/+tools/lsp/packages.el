;;; packages.el --- Language Server Protocol Layer packages file for Spacemacs
;;
;; Copyright (c) 2012-2022 Sylvain Benner & Contributors
;;
;; Author: Fangrui Song <i@maskray.me>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


(defconst lsp-packages
  '(
    lsp-mode
    (lsp-ui :toggle lsp-use-lsp-ui)
    (consult-lsp :requires consult)
    (helm-lsp :requires helm)
    (lsp-ivy :requires ivy)
    (lsp-treemacs :requires treemacs)
    (lsp-origami :requires lsp-mode)
    popwin))

(defun lsp/init-lsp-mode ()
  (use-package lsp-mode
    :defer t
    :init
    (setq lsp-server-install-dir (concat spacemacs-cache-directory "lsp/")
          lsp-session-file (concat lsp-server-install-dir (file-name-nondirectory ".lsp-session-v1"))
          lsp-eslint-library-choices-file (concat lsp-server-install-dir ".lsp-eslint-choices")
          lsp-yaml-schema-store-local-db (concat lsp-server-install-dir "lsp-yaml-schemas.json")
          lsp-vetur-global-snippets-dir (concat spacemacs-start-directory "snippets/vetur"))
    ;; If you find something else should be ignored, you could also set them here
    :config
    (progn
      (if lsp-use-upstream-bindings
          (spacemacs/lsp-bind-upstream-keys)
        (spacemacs/lsp-bind-keys))
      (setq lsp-prefer-capf t)
      (add-hook 'lsp-after-open-hook (lambda ()
                                       "Setup xref jump handler"
                                       (spacemacs//setup-lsp-jump-handler))))))

;;(defun lsp/init-lsp-ui ()
;;  (use-package lsp-ui
;;    :defer t
;;    :config
;;    (progn
;;      (if lsp-remap-xref-keybindings
;;          (progn (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;;                 (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)))
;;
;;      (spacemacs/lsp-define-key
;;       lsp-ui-peek-mode-map
;;       "h" #'lsp-ui-peek--select-prev-file
;;       "j" #'lsp-ui-peek--select-next
;;       "k" #'lsp-ui-peek--select-prev
;;       "l" #'lsp-ui-peek--select-next-file))))

(defun lsp/init-lsp-ui ()
  (use-package lsp-ui
	       :defer t
	       :custom-face
	       (lsp-ui-doc-background ((t (:background nil))))
	       (lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
	       :bind (:map lsp-ui-mode-map
			   ([remap xref-find-definitions] . lsp-ui-peek-find-definitions) ; [M-.]
			   ([remap xref-find-references] . lsp-ui-peek-find-references)   ; [M-?]
			   ("C-c i" . lsp-ui-imenu)
			   ("C-c f" . man-follow)
			   ("C-c r" . lsp-ui-peek-find-references)
			   ("M-." . lsp-ui-peek-find-definitions)
			   ("M-[" . lsp-ui-peek-jump-backward)
			   ("M-]" . lsp-ui-peek-jump-forward)
			   ("M-o" . xref-find-definitions-other-window))

	       :hook ((python-mode c-mode c++-mode) . lsp)
	       :config (lsp-ui-doc-enable t)
         (setq lsp-ui-doc-show-with-cursor t)
	       ;;(lsp-ui-doc-use-childframe t)
	       (lsp-ui-flycheck-enable t)
	       (lsp-ui-flycheck-list-position 'right)
	       (lsp-ui-flycheck-live-reporting t)
	       (lsp-ui-peek-enable t)
	       (lsp-ui-peek-list-width 60)
	       (lsp-ui-peek-peek-height 25)
	       (lsp-ui-doc-header t)
	       (lsp-ui-doc-include-signature t)
	       (lsp-ui-doc-position 'top)
	       (lsp-ui-doc-border (face-foreground 'default))
	       (lsp-ui-sideline-enable t)
	       (lsp-ui-sideline-ignore-duplicate t)
	       (lsp-ui-sideline-show-code-actions t)
	       ;; Use lsp-ui-doc-webkit only in GUI
		     (setq lsp-ui-doc-use-webkit nil)
	       ;;:init (setq lsp-ui-doc-enable t
	;;		   lsp-ui-doc-header t
        ;;        lsp-ui-doc-include-signature t
        ;;        lsp-ui-doc-position 'at-point)
    ;; for "Jimx-/lsp-ui" fork has xwebkit support.
     ;; (if (featurep 'xwidget)
     ;;     (setq lsp-ui-doc-use-webkit t))
    ;; (add-to-list 'lsp-ui-doc-frame-parameters )
    ))


(defun lsp/init-helm-lsp ()
  (use-package helm-lsp :defer t))

(defun lsp/init-lsp-ivy ()
  (use-package lsp-ivy :defer t))

(defun lsp/init-consult-lsp ()
  (use-package consult-lsp
    :defer t
    :after (lsp-mode)
    :config
     (consult-lsp-marginalia-mode 1)))

(defun lsp/init-lsp-treemacs ()
  (use-package lsp-treemacs :defer t))

(defun lsp/init-lsp-origami ()
  (use-package lsp-origami
    :defer t
    :init
    (add-hook 'lsp-after-open-hook #'lsp-origami-try-enable)))

(defun lsp/pre-init-popwin ()
  (spacemacs|use-package-add-hook popwin
    :post-config
    (push '("*lsp-help*" :dedicated t :position bottom :stick t :noselect t :height 0.4)
          popwin:special-display-config)))
