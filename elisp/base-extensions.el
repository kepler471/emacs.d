(use-package all-the-icons)

(use-package all-the-icons-dired
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package avy
  :bind
  ("C-c SPC" . avy-goto-char))

;; (require 'buffer-stack)
;; (require 'buffer-stack-suppl)
;; (use-package buffer-stack
;;   :bind
;;   ;; ([mouse-5] . buffer-stack-up)
;;   ;; ([mouse-4] . buffer-stack-down)
;;   ("C-}" . buffer-stack-up)
;;   ("C-{" . buffer-stack-down))

;; (use-package company
;;   :config
;;   (add-hook 'after-init-hook 'global-company-mode))

(use-package company
  :defer 2
  :diminish
  :custom
  (setq  (company-begin-commands '(self-insert-command))
	 (company-idle-delay .1)
	 (company-minimum-prefix-length 2)
	 (company-show-numbers t)
	 (company-tooltip-align-annotations 't)
	 (global-company-mode t)))

(use-package company-box
  :after company
  :diminish
  :hook (company-mode . company-box-mode))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-center-contenst t
	dashboard-items '((recents . 10)
			  (bookmarks . 10))))

(use-package dired-sidebar
  :bind (("C-c n" . dired-sidebar-toggle-with-current-directory))
  :commands (dired-sidebar-toggle-sidebar))

(use-package ediff
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq-default ediff-highlight-all-diffs 'nil)
  (setq ediff-diff-options "-w"))

(use-package exec-path-from-shell
  :config
  ;; Add GOPATH to shell
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-copy-env "GOPATH")
    (exec-path-from-shell-copy-env "PYTHONPATH")
    (exec-path-from-shell-initialize)))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package flycheck)

(use-package counsel
  :bind
  ("M-x" . counsel-M-x)
  ;; ("C-x C-m" . counsel-M-x)
  ;; ("C-x C-f" . counsel-find-file)
  ("C-x c k" . counsel-yank-pop))

(use-package counsel-projectile
  :bind
  ("C-x v" . counsel-projectile)
  ("C-x c p" . counsel-projectile-ag)
  :config
  (counsel-projectile-on))

(use-package ido
  :custom
  (setq ido-enable-flex-matching t
	ido-everywhere t)
  (ido-mode t))

(use-package ivy
  :bind
  ("C-x s" . swiper)
  ("C-x C-r" . ivy-resume)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers nil)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))


(use-package hlinum
  :config
  (hlinum-activate))

(use-package linum
  :config
  (setq linum-format " %3d ")
  (global-linum-mode nil)
  ;; (global-display-line-numbers-mode t)
  )

(use-package magit
  :config

  (setq magit-completing-read-function 'ivy-completing-read)

  :bind
  ;; Magic
  ("C-x g s" . magit-status)
  ("C-x g x" . magit-checkout)
  ("C-x g c" . magit-commit)
  ("C-x g p" . magit-push)
  ("C-x g u" . magit-pull)
  ("C-x g e" . magit-ediff-resolve)
  ("C-x g r" . magit-rebase-interactive))

(use-package magit-popup)

(use-package multiple-cursors
  :bind
  ("C-S-c C-S-c" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C->" . mc/mark-all-like-this)
  ("C-c C-<" . mc/mark-all-dwim ))


;; (use-package neotree
;;   :config
;;   (setq neo-theme 'arrow
;;         neotree-smart-optn t
;;         neo-window-fixed-size nil)
;;   ;; Disable linum for neotree
;;   (add-hook 'neo-after-create-hook 'disable-neotree-hook))

(use-package org
  :config
  (setq org-directory "~/"
        org-default-notes-file (concat org-directory "~/list.org"))
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda))

(use-package org-projectile
  :config
  (org-projectile-per-project)
  (setq org-projectile-per-project-filepath "todo.org"
	org-agenda-files (append org-agenda-files (org-projectile-todo-files))))

(use-package org-bullets
  :config
  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bullets-mode t))))

(use-package page-break-lines)

(use-package pdf-tools
  :init
  (pdf-loader-install))

(use-package polymode)

(use-package projectile
  :config
  (setq projectile-known-projects-file
        (expand-file-name "projectile-bookmarks.eld" temp-dir))

  (setq projectile-completion-system 'ivy)

  (projectile-global-mode))

(use-package recentf
  :config
  (setq recentf-save-file (recentf-expand-file-name "~/.emacs.d/private/cache/recentf"))
  (recentf-mode 1)
  (add-to-list 'recentf-exclude "\\elpa")
  (add-to-list 'recentf-exclude "\\ido.last")
  (add-to-list 'recentf-exclude "\\recentf")
  (add-to-list 'recentf-exclude "\\init.el")
  (add-to-list 'recentf-exclude "\\list.org"))

(use-package smartparens)

(use-package smex)

(use-package undo-tree
  :config
  ;; Remember undo history
  (setq
   undo-tree-auto-save-history nil
   undo-tree-history-directory-alist `(("." . ,(concat temp-dir "/undo/"))))
  (global-undo-tree-mode 1))

(use-package vterm)

(use-package which-key
  :config
  (which-key-mode))

(use-package windmove
  :bind
  ("A-<up>" . windmove-up)
  ("A-<down>" . windmove-down)
  ("A-<left>" . windmove-left)
  ("A-<right>" . windmove-right))

(use-package wgrep)

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package dumb-jump
  :config
    (dumb-jump-mode))

(provide 'base-extensions)
