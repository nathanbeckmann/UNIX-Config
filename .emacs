;;

(load-file "~/.emacs.d/mathematica.el")
(load-file "~/.emacs.d/gitsum.el")
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

;; Formatting

(setq-default indent-tabs-mode nil)
(setq-default c-default-style "bsd")
(setq-default c-basic-offset 4)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Go

(add-to-list 'load-path "~/tools/go/misc/emacs" t)
(require 'go-mode-load)
