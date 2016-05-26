;;; init-46-coding-R.el --- Coding for R

;; Copyright (C) 2015 Gregory J Stein

;; Author: Arne Schillert  <arne.schillert@imbs.uni-luebeck.de>
;; Maintainer: Arne Schillert  <arne.schillert@imbs.uni-luebeck.de>
;; Created: 10 May 2016

;; Keywords: configuration, ess, R
;; Homepage: https://github.com/imbs-hl/emacs.d
;; License: GNU General Public License (see init.el for details)

;;; Commentary:
;; Runs ESS mode, most importantly for R and Rnw files

;;;; Code:

(use-package ess-site
  :defer t
  :load-path "~/.emacs.d/ess/lisp/"
  :commands R
  :mode ("\\.R\\'" . R-mode)
  )

(use-package ess
  :defer t
  :load-path "~/.emacs.d/ess/lisp/"
  :commands R
  :mode ("\\.R\\'" . R-mode)
  )



(use-package polymode		; ESS with polymode
    :ensure f	                        ; https://github.com/vitoshka/polymode
    :init
    (setq load-path 		; Append the directory to emacs path
      (append '("~/.emacs.d/polymode"
      "~/.emacs.d/polymode/modes") load-path))
      (require 'poly-R)		; Load necessary modes
      (require 'poly-markdown)
      (require 'poly-noweb)
      :config
      (add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode)) ; Markdown files
      (add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode)) ; Sweave files
      (add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode)) ; Sweave files
      (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode)) ; RMarkdown files
      )


(add-hook 'R-mode-hook
          (defun my-R-mode-hook ()
            (company-mode)
            (local-set-key (kbd "TAB") 'company-complete)))

; ;;; R

;; ;; Emacs Speaks Statistics: ess
;; ;;
;; ;; Auto-complete... ??
;; ;; http://www.emacswiki.org/emacs/ESSAuto-complete
;; (use-package ess
;; ;;  :ensure t				; Check and install if necessary
;;   :load-path "~/.emacs.d/ess/lisp/"
;;   :init (require 'ess-site)	                ; Load ESS
;;   :config
;;   (progn
;;     ;; (setq-default ess-dialect "R")   ; Default dialect is R
;;     (setq
;;      inferior-ess-same-window nil	; Run R in inferior window
;;      ess-ask-for-ess-directory nil      ; Use current directory as working directory
;;      inferior-R-args "--quiet --no-save" ; No save on exit
;;      ess-nuke-trailing-whitespace-p t	; Remove trailing spaces
;;      comint-scroll-to-bottom-on-input t	; Always scroll to the end of the R buffer
;;      comint-scroll-to-bottom-on-output t
;;      comint-move-point-for-output t
;;      ess-eval-visibly `nowait		; Does not wait for R
;;      ess-swv-processor (quote knitr)	; Use knitr instead of Sweave as ESS processor
;;      )
;;     (add-hook 'ess-mode-hook		; ESS mode hook
;; 	  (lambda ()
;; 	    (add-hook 'local-write-file-hooks ; Remove trailing white spaces on save
;; 		      (lambda ()
;; 			(ess-nuke-trailing-whitespace)))
;; 	    (turn-off-flyspell)	        ; Turn off flyspell in R chunks
;; 	    (auto-fill-mode -1)	        ; Turn off automatic break lines in R chunks
;; 	    (subword-mode)))	        ; Consider CamelCase as two words
;;     (add-hook 'ess-R-post-run-hook
;; 	      'ess-execute-screen-options) ; Sets R option "width" to the width of the R
;; 					; buffer on startup
;;     (use-package ess-smart-underscore	; ESS smart underscore
;;       :ensure t	                        ; http://www.emacswiki.org/emacs/EssSmartUnderscore
;;       :init (require 'ess-smart-underscore))


;;; init-46-coding-R.el ends here
