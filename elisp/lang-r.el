;;; lang-r.el --- R config

;;; Commentary:
;;

;;; Code:

(use-package ess
  :config
  (setq exec-path (append exec-path '("/opt/homebrew/Cellar/r/4.0.5/bin"))
	ess-directory "~/Learn/ESS/"
	ess-ask-about-transfile t
	ess-ask-for-ess-directory t
	display-buffer-alist
        '(("*R Dired"
           (display-buffer-reuse-window display-buffer-in-side-window)
           (side . right)
           (slot . -1)
           (window-width . 0.33)
           (reusable-frames . nil))
          ("*R"
           (display-buffer-reuse-window display-buffer-at-bottom)
           (window-width . 0.5)
           (reusable-frames . nil))
          ("*Help"
           (display-buffer-reuse-window display-buffer-in-side-window)
           (side . right)
           (slot . 1)
           (window-width . 0.33)
           (reusable-frames . nil)))
	;; display-buffer-alist
	;; '(("*R"
	   ;; nil
	   ;; (dedicated . t)))
	))

(use-package poly-R)

(defun cg/R-assign ()
   "Insert assignment sign of R language"
   (interactive)
   (insert " <- ")
   )

;; (ess-toggle-underscore nil) ; http://stackoverflow.com/questions/2531372/how-to-stop-emacs-from-replacing-underbar-with-in-ess-mode
;; (setq ess-fancy-comments nil) ; http://stackoverflow.com/questions/780796/emacs-ess-mode-tabbing-for-comment-region
					; Make ESS use RStudio's indenting style
;; (add-hook 'ess-mode-hook (lambda() (ess-set-style 'RStudio)))
					; Make ESS use more horizontal screen
					; http://stackoverflow.com/questions/12520543/how-do-i-get-my-r-buffer-in-emacs-to-occupy-more-horizontal-space
;; (add-hook 'ess-R-post-run-hook 'ess-execute-screen-options)
;; (define-key inferior-ess-mode-map "\C-cw" 'ess-execute-screen-options))

;;    :defer t
;;    :commands R
;;    :mode ("\\.[Rr]$" . R-mode)
;;    :config
;;    (progn
;;       (unbind-key "_" ess-mode-map)
;;       (unbind-key "_" inferior-ess-mode-map)
;;       (bind-key "C-M--" 'cg/R-assign ess-mode-map)
;;       (bind-key "C-M--" 'cg/R-assign inferior-ess-mode-map)
;;       (setq ess-tracebug-prefix "\M-c")   ; define debug-mode starting key
;;       (setq ess-use-tracebug t)           ; tracebug is called for R
;;                                         ; AND JULIA!!
;;       (setq ess-tracebug-inject-source-p t)
;;       ;; (require 'ess-r-args)
;;       ;; (require 'ess-R-object-tooltip)
;;       (define-key ess-mode-map (kbd "C-c 1") 'r-show-head)
;;       (define-key ess-mode-map (kbd "C-c 2") 'r-show-str)

(provide 'lang-r)

;;; lang-r.el ends here
