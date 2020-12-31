;;; tab-bar-lost-commands.el --- The "lost commands" of the tab bar -*- lexical-binding: t; -*-

;; Copyright (C) 2020-2021 Fritz Grabo

;; Author: Fritz Grabo <me@fritzgrabo.com>
;; URL: https://github.com/fritzgrabo/tab-bar-lost-commands
;; Version: 0.1
;; Package-Requires: ((emacs "27.1") (tab-bar-utils "0.1"))
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; If not, see http://www.gnu.org/licenses.

;;; Commentary:

;; The "lost commands" of the tab bar.

;; That is, simple and convenient commands that help with common tab bar
;; use-cases regarding the creation, selection and movement of tabs.

;;; Code:

(require 'tab-bar-utils)

(defun tab-bar-lc-switch-to-first-tab ()
  "Switch to the first tab."
  (interactive)
  (tab-bar-select-tab 1))

(defun tab-bar-lc-switch-to-last-tab ()
  "Switch to the last tab."
  (interactive)
  (tab-bar-select-tab (length (funcall tab-bar-tabs-function))))

(defun tab-bar-lc-move-tab-first ()
  "Move the current tab to the first position."
  (interactive)
  (tab-bar-move-tab-to 1))

(defun tab-bar-lc-move-tab-backward ()
  "Move the current tab backward by one."
  (interactive)
  (tab-bar-move-tab -1))

(defun tab-bar-lc-move-tab-forward ()
  "Move the current tab forward by one."
  (interactive)
  (tab-bar-move-tab 1))

(defun tab-bar-lc-move-tab-last ()
  "Move the current tab to the last position."
  (interactive)
  (tab-bar-move-tab-to (length (funcall tab-bar-tabs-function))))

(defun tab-bar-lc-switch-to-or-create-tab ()
  "Like `tab-bar-switch-to-tab`, but allow for the creation of a new, named tab on the fly."
  (interactive)
  (let* ((tab-names (tab-bar-utils-tab-names))
         (tab-name (completing-read "Switch to tab: " tab-names)))
    (if (member tab-name tab-names)
        (tab-bar-select-tab-by-name tab-name)
      (tab-bar-new-tab)
      (tab-bar-rename-tab tab-name))))

(provide 'tab-bar-lost-commands)
;;; tab-bar-lost-commands.el ends here