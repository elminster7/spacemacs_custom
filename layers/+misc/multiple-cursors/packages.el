;; -*- lexical-binding: t -*-
;;
;;; packages.el --- Spacemacs Multiple Cursors Layer packages File
;;
;; Copyright (c) 2012-2022 Sylvain Benner & Contributors
;;
;; Author: Codruț Constantin Gușoi <codrut.gusoi@gmail.com>
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

(defconst multiple-cursors-packages
  '(
    ;;(evil-mc :toggle (eq multiple-cursors-backend 'evil-mc))
    ;;(multiple-cursors :toggle (eq multiple-cursors-backend 'mc))))
    multiple-cursors))

(defun multiple-cursors/init-evil-mc ()
  (use-package evil-mc
    :init
    (progn
      (which-key-add-keymap-based-replacements evil-motion-state-map
        "gr"  "evil-mc")
      (add-hook 'prog-mode-hook 'turn-on-evil-mc-mode)
      (add-hook 'text-mode-hook 'turn-on-evil-mc-mode))
    :config
    (progn
      (add-hook 'magit-mode-hook 'turn-off-evil-mc-mode)
      (setq-default evil-mc-one-cursor-show-mode-line-text nil)
      (when (or (spacemacs/system-is-mac) (spacemacs/system-is-mswindows))
        (setq evil-mc-enable-bar-cursor nil))

      ;; evil-mc is not compatible with the paste transient state
      (evil-define-key 'normal evil-mc-key-map
        "p" #'spacemacs/evil-mc-paste-after
        "P" #'spacemacs/evil-mc-paste-before)

      (evil-define-key '(normal insert) evil-mc-key-map
        (kbd "C-M-j") #'evil-mc-make-cursor-move-next-line
        (kbd "C-M-k") #'evil-mc-make-cursor-move-prev-line))))

(defun multiple-cursors/init-multiple-cursors ()
  (use-package multiple-cursors
    :defer t
    :bind (("C-c l" . mc/edit-lines)
           ("C-c i" . mc/mark-all-words-like-this))))
