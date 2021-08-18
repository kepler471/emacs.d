;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "elisp"))
;; (add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'base)
(require 'base-theme)
(require 'base-extensions)
(require 'base-functions)
(require 'base-global-keys)

(require 'buffer-stack)
;; (require 'buffer-stack-suppl)
(require 'font-lock+)

(require 'lang-r)
(require 'lang-python)
(require 'lang-go)
(require 'lang-rust)
(require 'lang-racket)
(require 'lang-c)
(require 'lang-julia)
(require 'lang-chez)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ess-ask-about-transfile nil)
 '(package-selected-packages
   '(racer cargo flycheck-rust geiser-chez geiser ess-site buffer-stack company-c-headers ggtags racket-mode lsp-ui py-autopep8 pip-requirements dumb-jump wgrep undo-tree smex smartparens org-bullets org-projectile magit-popup hlinum counsel-projectile counsel expand-region dashboard avy spacemacs-theme which-key vterm use-package solarized-theme rust-mode pyenv-mode projectile pdf-tools paredit nord-theme neotree multiple-cursors material-theme magit julia-repl julia-mode go-mode fsharp-mode flycheck-julia exec-path-from-shell elpy ein eglot dotnet dired-sidebar dimmer company-lsp company-box blacken better-defaults all-the-icons-dired)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
