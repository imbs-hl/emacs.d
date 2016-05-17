;;; init-46-coding-R.el --- Coding for R

;; Copyright (C) 2015 Gregory J Stein

;; Author: Gregory J Stein <gregory.j.stein@gmail.com>
;; Maintainer: Gregory J Stein <gregory.j.stein@gmail.com>
;; Created: 20 Aug 2015

;; Keywords: configuration, matlab
;; Homepage: https://github.com/gjstein/emacs.d
;; License: GNU General Public License (see init.el for details)

;;; Commentary:
;; Runs matlab mode, which applies to both matlab documents and the matlab shell

;;;; Code:

(use-package ess-site
  :defer t
  :load-path "~/.emacs.d/ess/lisp/"
  :commands R
  :mode ("\\.R\\'" . R-mode)
  )

;;; init-46-coding-R.el ends here
