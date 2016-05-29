;;; init-40-coding-gen.el --- Code for general programming

;; Copyright (C) 2015 Gregory J Stein

;; Author: Gregory J Stein <gregory.j.stein@gmail.com>
;; Maintainer: Gregory J Stein <gregory.j.stein@gmail.com>
;; Created: 20 Aug 2015

;; Keywords: configuration, company, magit, git, flycheck
;; Homepage: https://github.com/gjstein/emacs.d
;; License: GNU General Public License (see init.el for details)

;;; Commentary:
;; General tools for programming across languages. This consists of:
;;   Company :: used for code completion
;;   Projectile :: used for searching projects
;;   Magit :: used for interfacing with git/github
;;   Flycheck :: code syntax/convention checking

;;; Code:

;; === Code Completion ===

;; == company-mode ==
(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (use-package company-irony :ensure t :defer t)
  (setq company-idle-delay              nil
	company-minimum-prefix-length   2
	company-show-numbers            t
	company-tooltip-limit           20
	company-dabbrev-downcase        nil
  )
; ;; from https://stat.ethz.ch/pipermail/ess-help/2015-September/010684.html
;   (define-key company-active-map [tab] 'company-complete-selection)
;   (define-key company-active-map (kbd "TAB") 'company-complete-selection)
;   (define-key company-active-map [return] nil)
;   (define-key company-active-map (kbd "RET") nil)
;   (define-key company-active-map (kbd "M-n") nil)
;   (define-key company-active-map (kbd "M-p") nil)
;   (define-key company-active-map (kbd "M-h") 'company-show-doc-buffer)
;   (define-key company-active-map (kbd "M-,") 'company-select-next)
;   (define-key company-active-map (kbd "M-k") 'company-select-previous)

  :bind
  ("C-;" . company-complete-common)
  ("TAB" . company-complete-common)
  )


;; === Tools ===

;; == Projectile ==
(use-package projectile
  :ensure t
  :defer t
  :init
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  (use-package helm-projectile
    :ensure t
    :init
    (helm-projectile-on)
    )
  )

;; == magit ==
(use-package magit
  :ensure t
  :defer t
  :bind ("C-x g" . magit-status)
  :init
  (setq magit-diff-options (quote ("--word-diff")))
  (setq magit-diff-refine-hunk 'all)
  )

;; == flycheck ==
(use-package flycheck
  :ensure t
  :defer t
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)
  ;; check OS type
  (if (string-equal system-type "gnu/linux")
      (progn
	(custom-set-variables
	 '(flycheck-c/c++-clang-executable "clang-3.5")
	 )))
  (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-gcc))

  )

;;; init-40-coding-gen.el ends here
