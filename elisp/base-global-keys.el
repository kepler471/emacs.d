;;; base-global-keys.el --- User's globally defined keybindings

;; Add your keys here, as such

;(global-set-key (kbd "[SHORTCUT]") '[FUNCTION])

(bind-key "C-c e" #'open-init-file)

(global-set-key (kbd "C-c C-d") `duplicate-line)

(global-set-key (kbd "<M-up>")   'move-line-up)
(global-set-key (kbd "M-[")   'move-line-up)
(global-set-key (kbd "<M-down>") 'move-line-down)
(global-set-key (kbd "M-]") 'move-line-down)

(bind-key "C-{" #'buffer-stack-down)
(bind-key "C-}" #'buffer-stack-up)

(global-set-key (kbd "<S-return>") 'elpy-open-and-indent-line-below)

(bind-key "C-c P" #'copy-file-name-to-clipboard)

;; (global-set-key (kbd "C-x p") 'goto-previous-window)
;; (global-set-key (kbd "<C-tab>") 'goto-last-window)
;; (global-set-key (kbd "C-#") (lambda()
			      ;; (interactive)
			      ;; (ido-switch-buffer)))
			      ;(tab))) ;; how to use a keysequence here, to press enter or tab? use the first suggestion by ido?


(provide 'base-global-keys)
