;;; init-20-nav-interface.el --- Customize emacs interface (mostly Helm)

;; Copyright (C) 2015 Gregory J Stein

;; Author: Gregory J Stein <gregory.j.stein@gmail.com>
;; Maintainer: Gregory J Stein <gregory.j.stein@gmail.com>
;; Created: 20 Aug 2015

;; Keywords: configuration, helm
;; Homepage: https://github.com/gjstein/emacs.d
;; License: GNU General Public License (see init.el for details)

;;; Commentary:
;; Mostly configures helm-mode, which is great for getting around
;; For more on Helm, see:
;;     http://tuhdo.github.io/helm-intro.html
;;     https://github.com/emacs-helm/helm/wiki

;;; Code:


; Use shift to move between windows
(use-package windmove
  :config (windmove-default-keybindings 'shift))


;; == Helm Mode ==
(use-package helm
  :ensure t
  :diminish helm-mode
  :init

  ;; Changes the helm prefix key
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  ;; Supress warning
  (setq ad-redefinition-action 'accept)

  :config

  (require 'helm-config) ; Necessary for helm-mode

  ;; Key bindings
  (bind-key "<tab>" 'helm-execute-persistent-action helm-map)
  (bind-key "C-i" 'helm-execute-persistent-action helm-map)
  (bind-key "C-z" 'helm-select-action helm-map) ; list actions using C-z

  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))

  (setq helm-split-window-in-side-p           t
	helm-move-to-line-cycle-in-source     t
	helm-ff-search-library-in-sexp        t
	helm-scroll-amount                    8
	helm-M-x-fuzzy-match                  t
	helm-ff-file-name-history-use-recentf t)


  (if (string-equal system-type "darwin")
      ;; This requires the 'ggrep' command to be installed for OSX
      (setq helm-grep-default-command
	    "ggrep --color=always -d skip %e -n%cH -e %p %f"
	    helm-grep-default-recurse-command
	    "ggrep --color=always -d recurse %e -n%cH -e %p %f"))
  (if (string-equal system-type "gnu/linux")
      (setq helm-grep-default-command
	    "grep --color=always -d skip %e -n%cH -e %p %f"
	    helm-grep-default-recurse-command
	    "grep --color=always -d recurse %e -n%cH -e %p %f"))

  (helm-mode 1)

  :bind (;("C-x b" . helm-mini)
	 ("C-x C-f" . helm-find-files)
	 ("M-x" . helm-M-x)
	 )
  )


;; == Recent files ==


;; List of recent files with C-X C-r
(use-package recentf
  :config
  (recentf-mode t)
  (setq recentf-max-menu-items 25)
  :init
  (global-set-key "\C-x\ \C-r" 'recentf-open-files)
  )



  (use-package ido
    :init (progn (ido-mode 1)
                 (ido-everywhere 1))
    :config
    (progn
      (setq ido-case-fold t)
      (setq ido-everywhere t)
      (setq ido-enable-prefix nil)
      (setq ido-enable-flex-matching t)
      (setq ido-create-new-buffer 'always)
      (setq ido-max-prospects 10)
      (setq ido-use-faces nil)
      (setq ido-file-extensions-order '(".rb" ".el" ".coffee" ".js"))
      (add-to-list 'ido-ignore-files "\\.DS_Store")
      (add-to-list 'ido-ignore-files "appspec.yml")))



  (use-package auto-complete
    :ensure t
    ;:diminish auto-complete-mode
    :config
    (progn
;      (add-to-list 'ac-dictionary-directories (emacs-d "elpa/auto-complete-20131128.233/dict"))
      (setq ac-use-fuzzy t
        ac-disable-inline t
        ac-use-menu-map t
        ac-auto-show-menu t
        ac-auto-start t
        ac-ignore-case t
        ac-candidate-menu-min 0)
      ))


;; Accessing  remote files with tramp 
(use-package tramp
  :ensure t
  :init
  (progn
    ;; Tramp saves backups to the local directory, for speed.
    (setq tramp-auto-save-directory "\"/tmp\"")
    (setq tramp-default-method "ssh")
	
    ;; Disable vc for tramp files
    (setq vc-ignore-dir-regexp
          (format "\\(%s\\)\\|\\(%s\\)"
                  vc-ignore-dir-regexp
                  tramp-file-name-regexp))
    )
  )



;;; init-20-nav-interface.el ends here
