;;; base-theme.el --- A selection of nice themes

;;; Commentary:
;;
;; Is there a nicer way to do this?

;;; Code:

(defun set-spacemacs ()
  (interactive)
  (use-package spacemacs-theme
    :defer t
    :init
    (load-theme 'spacemacs-dark t)))

(defun set-nord ()
  (interactive)
  (use-package nord-theme
    :defer t
    :init
    (load-theme 'nord t)))

(defun set-material ()
  (interactive)
  (use-package material-theme
    :defer t
    :init
    (load-theme 'material t)))

(defun set-solarized ()
  (interactive)
  (use-package solarized-theme
    :defer t
    :init
    (load-theme 'solarized-light t)))

(set-nord)

(provide 'base-theme)

;;; base-theme.el ends here
