(add-to-list 'load-path "~/.emacs.d/lisp")
(setq custom-file "~/.emacs.d/lisp")

(menu-bar-mode -1)
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(scroll-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
;;(setq inhibit-startup-screen t)
;;(setq initial-buffer-choice t)
(setq-default truncate-lines t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq confirm-kill-processes nil)

(ido-mode 1)
(electric-pair-mode 1)

;;(add-to-list 'default-frame-alist '(font . "Spleen-17"))
(add-to-list 'default-frame-alist '(font . "ProFontIIxNerdFontMono-15"))
;;(add-to-list 'default-frame-alist '(font . "IosevkaComfy-17"))

(require 'package)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")
	("org" . "https://orgmode.org/elpa/")))


(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)

  :config
  (evil-mode 1))

(use-package vterm
  :ensure t)
(setq vterm-shell "/bin/bash")

(with-eval-after-load 'evil
  (evil-set-initial-state 'vterm-mode 'emacs))

(use-package nano-theme
  :ensure t
  :config 
;;  (load-theme 'nano t)
  )

(use-package yabaki-theme
  :ensure t
  :config
  (load-theme 'yabaki t)
  )

(use-package base16-theme
  :ensure t
  :config
;;  (load-theme 'base16-mountain t)
  )

(use-package creamsody-theme
  :ensure t
  :config
  ;;  (load-theme 'creamsody-darker t)
  )

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))
