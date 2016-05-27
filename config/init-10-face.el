;;; init-10-face.el --- Customize the look of emacs

;; Copyright (C) 2015 Gregory J Stein

;; Author: Gregory J Stein <gregory.j.stein@gmail.com>
;; Maintainer: Gregory J Stein <gregory.j.stein@gmail.com>
;; Created: 20 Aug 2015

;; Keywords: configuration, zenburn
;; Homepage: https://github.com/gjstein/emacs.d
;; License: GNU General Public License (see init.el for details)

;;; Commentary:
;; Zenburn theme; default font is set to 'monaco'

;;; Code:

;; Splash Screen to Org-mode
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'markdown-mode)

;; == Load Custom Theme ==

;; Solarized dark theme
(use-package solarized-theme
  :ensure t
  :config (load-theme 'solarized-dark t)
  )


;; I prefer using a smaller font size than the default (and 'Monaco')
;; (if (eq system-type 'darwin)
;;     (custom-set-faces '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "nil" :family "Monaco")))))
;;   (custom-set-faces '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Ubuntu Mono"))))))

;; Set default fill column
(setq-default fill-column 80)

;; quiet, please! No dinging!
;(setq visible-bell t)
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

;; Disable menu bars, etc.
(if window-system (scroll-bar-mode -1))
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Unbinds right 'alt' key from emacs to get squared brackets etc.
(setq ns-right-alternate-modifier nil)


;;---------------------------------------------------------------------------
;make the y or n suffice for a yes or no question
(fset 'yes-or-no-p 'y-or-n-p)


;; show the current line and column numbers in the stats bar as well --------
(line-number-mode 1)
(column-number-mode 1)


(use-package rainbow-delimiters
  :ensure t
  :commands rainbow-delimiters-mode
  :init
  (dolist (x '(LaTeX-mode-hook lisp-mode-hook emacs-lisp-mode-hook))
    (add-hook x 'rainbow-delimiters-mode)))
(show-paren-mode t)








;; No Backup Files
(setq make-backup-files nil)
; disable auto save
(setq auto-save-default nil)

;;; init-10-face.el ends here
