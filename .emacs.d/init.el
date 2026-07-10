(add-to-list 'load-path "~/.emacs.d/lisp")
(setq custom-file "~/.emacs.d/lisp")

(add-to-list 'custom-theme-load-path
             "~/.emacs.d/lisp/mindre-theme")

(setq mindre-use-more-bold nil
      mindre-use-faded-lisp-parens t)

(load-theme 'mindre t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq inhibit-startup-screen t)
(setq initial-buffer-choice t)

(setq make-backup-files nil)
(setq auto-save-default nil)

(ido-mode 1)
(electric-pair-mode 1)

(add-to-list 'default-frame-alist '(font . "Spleen-17"))

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

(use-package hima-theme
  :ensure t
  :config 
  ;;(load-theme 'hima t)
  )

(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))
