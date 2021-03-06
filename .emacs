;;

(load-file "~/.emacs.d/mathematica.el")
(load-file "~/.emacs.d/gitsum.el")
(load-file "~/.emacs.d/google-c-style.el")
;; (require 'magit)

(setq load-path (cons (expand-file-name "~/share/emacs/site-lisp/") load-path))
(require 'vc-git)
(when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
(require 'git)
(autoload 'git-blame-mode "git-blame"
          "Minor mode for incremental blame for Git." t)

;; Scala Mode

(let ((path (expand-file-name "~/.emacs.d/scala")))
  (setq load-path (cons path load-path))
  (load "scala-mode-auto.el"))

(defun scala-turnoff-indent-tabs-mode ()
  (setq indent-tabs-mode nil))

(add-hook 'scala-mode-hook 'scala-turnoff-indent-tabs-mode)

;; Auto generated?

(autoload 'run-tea "~/bin/tea"
          "Run an inferior T process."
          t)

(autoload 'run-asim "~/bin/asim"
          "Run an inferior T/ASIM process."
          t)

(setq auto-mode-alist
      (append
       (list '("\\.t$" . scheme-mode))
       auto-mode-alist))

(setq inhibit-startup-message t)
(setq display-time-and-date t)
(display-time)

;; Buffer behavior

(setq-default display-buffer-reuse-frames t)
(setq-default split-width-threshold 200)
(setq-default split-height-threshold nil)

;; Formatting

(setq-default indent-tabs-mode nil)
;; (setq-default c-default-style "bsd")
(setq-default c-basic-offset 4)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Go

(add-to-list 'load-path "~/tools/go/misc/emacs" t)
(require 'go-mode-load)

;; Recompile

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "C-c C-r") 'recompile)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)