;;

;; (load-file "~/.emacs.d/mathematica.el")
(load-file "~/.emacs.d/gitsum.el")
(load-file "~/.emacs.d/google-c-style.el")

;; ;; Bluespec

;; (setq load-path (append (list (concat (getenv "BLUESPECDIR") "/../util/emacs")) load-path))
;; ;; User customization for BSV mode
;; (setq bsv-indent-level             4
;;       bsv-indent-level-module      4
;;       bsv-indent-level-declaration 4
;;       bsv-indent-level-behavioral  4
;;       bsv-indent-level-directive   1
;;       bsv-case-indent              2
;;       bsv-auto-newline             nil
;;       bsv-auto-indent-on-newline   t
;;       bsv-tab-always-indent        t
;;       bsv-auto-endcomments         t
;;       bsv-minimum-comment-distance 40
;;       bsv-indent-begin-after-if    t
;;       bsv-auto-lineup              'declarations
;;       bsv-highlight-p1800-keywords nil
;;       bsv-linter		   "my_lint_shell_command")
;; (load "bsv-mode") (add-hook 'bsv-mode-hook `font-lock-fontify-buffer)
;; (add-to-list 'auto-mode-alist '("\\.bsv\\'" . bsv-mode))

(setq inhibit-startup-message t)

;; Buffer behavior

(setq-default display-buffer-reuse-frames t)
(setq-default split-width-threshold 200)
(setq-default split-height-threshold nil)

;; Formatting

(setq-default indent-tabs-mode nil)
(setq-default c-default-style "bsd")
(setq-default c-basic-offset 4)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Recompile

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "C-c C-r") 'recompile)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)
