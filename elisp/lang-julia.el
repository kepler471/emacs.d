;;; package --- julia configs
;;; Commentary:
;;; Contains my julia configs

;; key 	action
;; C-c C-a 	activate if there is a Project.toml in parent directories
;; C-u C-c C-a 	activate home project
;; C-c C-b 	send whole buffer to REPL (using include)
;; C-u C-c C-b 	send whole buffer to REPL (directly)
;; C-c C-c 	send region (when applicable) or line to REPL
;; C-c C-d 	invoke @doc on symbol
;; C-c C-e 	invoke @edit on region (when applicable) or line
;; C-c C-l 	list methods of a function
;; C-c C-m 	expand macro
;; C-c C-p 	change directory to that of the buffer
;; C-c C-s 	prompt for buffer name suffix
;; C-c C-t 	send whole buffer to REPL (using Revise.includet)
;; C-c C-v 	prompt for Julia executable
;; C-c C-z 	raise the REPL or create a new one
;; C-RET 	send line to REPL (without bracketed paste)

;; Some hints on interacting with term

;; Note some keybindings for term:

;;     C-x C-j switches to line mode, where you can kill/yank, move around the buffer, use standard Emacs keybindings,
;;     C-c C-k switches back to char mode,
;;     for scrolling, use S-<prior> and S-<next>.

;; For vterm, C-c C-t toggles line mode

;;; Code:

;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/ess")

;; allow julia to be loaded through call to julia-mode or
;; ess-inferior process
;; follow-ups: etags?
(use-package julia-mode
   :defer t
   :commands julia-mode
   :mode ("\\.jl$" . julia-mode)
   :init
   (progn
      (autoload 'julia-mode "julia-mode" nil t)
      (setq inferior-julia-program-name "/opt/homebrew/bin/julia")
      )
   :config
   (progn
      (add-to-list 'julia-mode-hook 'cg/modify-current-syntax-table)
      (setq inferior-julia-program-name "/opt/homebrew/bin/julia")
      (add-to-list 'julia-mode-hook 'cg/command-line-keybindings)
      ;; (add-to-list 'inferior-ess-mode-hook 'cg/command-line-keybindings)
      )
   )

;; (use-package ess-julia.el
;;    :defer t
;;    :commands julia
;;    :init                                ; run before actual loading
;;    (progn
;;       (autoload 'julia "ess-julia.el" nil t)
;;       (setq inferior-julia-program-name "/opt/homebrew/bin/julia")
;;       )
;;    :config
;;    (progn
;;       (require 'ess-site)
;;       (setq inferior-julia-program-name "/opt/homebrew/bin/julia")
;;       (setq ess-tracebug-prefix "\M-c")   ; define debug-mode starting key
;;       (setq ess-use-tracebug t)           ; tracebug is called for R
;;                                         ; AND JULIA!!
;;       (setq ess-tracebug-inject-source-p t)
;;       (add-to-list 'julia-mode-hook 'cg/command-line-keybindings)
;;       ;; (add-to-list 'inferior-ess-mode-hook 'cg/command-line-keybindings)
;;       )
;;    )
;; in order to add ess-process afterward, apply julia-mode again on
;; open buffers - probably ess-julia.el has to be loaded again also:
;; M-x load-file ess-julia.el

;;;;;;;;;;;
;;; OLD ;;;
;;;;;;;;;;;
;; (require 'julia-mode)
;; (require 'flycheck-julia)
;; ;; (flycheck-julia-setup)
;; ;; (add-to-list 'flycheck-global-modes 'julia-mode)
;; (require 'julia-repl)
;; (add-hook 'julia-mode-hook 'julia-repl-mode)
;;;;;;;;;;;
;;; OLD ;;;
;;;;;;;;;;;

(provide 'lang-julia)
