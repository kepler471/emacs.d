;;; lang-rust.el --- Rust config with rust-mode, racer, and cargo

;; rust-mode
;; https://github.com/rust-lang/rust-mode

;;; Commentary:

;; Previous Rust setup:
; (add-hook 'rust-mode-hook
;           (lambda () (setq indent-tabs-mode nil)))
; (setq rust-format-on-save t)
; (define-key rust-mode-map (kbd "C-c C-c") 'rust-run)
;; Debug
; rust-dbg-wrap-or-unwrap either wraps or unwraps the current region in dbg!.
; This can be useful for easily adding debug lines to your program.
; This is bound to C-c C-d by default.

;;; Code:

(use-package rust-mode
  :bind ( :map rust-mode-map
         (("C-c C-t" . racer-describe)))
  :config
  (progn
    ;; add flycheck support for rust
    ;; https://github.com/flycheck/flycheck-rust
    (use-package flycheck-rust)

    ;; cargo-mode for all the cargo related operations
    ;; https://github.com/kwrooijen/cargo.el
    (use-package cargo
      :hook (rust-mode . cargo-minor-mode)
      :bind
      ("C-c C-c C-n" . cargo-process-new))

    ;; racer-mode for getting IDE like features for rust-mode
    ;; https://github.com/racer-rust/emacs-racer
    (use-package racer
      :hook (rust-mode . racer-mode)
      :config
      (progn
        ;; set racer rust source path environment variable
        (setq racer-rust-src-path (getenv "RUST_SRC_PATH"))
        (defun my-racer-mode-hook ()
          (set (make-local-variable 'company-backends)
               '((company-capf company-files))))

        ;; enable company and eldoc minor modes in rust-mode
        (add-hook 'racer-mode-hook 'company-mode)
        (add-hook 'racer-mode-hook 'eldoc-mode)))

    (add-hook 'rust-mode-hook 'flycheck-mode)
    (add-hook 'flycheck-mode-hook 'flycheck-rust-setup)

    ;; format rust buffers on save using rustfmt
    (add-hook 'before-save-hook
              (lambda ()
                (when (eq major-mode 'rust-mode)
                  (rust-format-buffer))))))

(provide 'lang-rust)

;;; lang-rust.el ends here
