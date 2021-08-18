(use-package geiser)
(use-package geiser-chez
  :config
  (setq geiser-chez-binary "chez"))

(add-to-list 'auto-mode-alist
             '("\\.sls\\'" . scheme-mode)
             '("\\.sc\\'" . scheme-mode))

(provide 'lang-chez)
