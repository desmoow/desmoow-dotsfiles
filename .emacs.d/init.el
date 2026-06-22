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

(global-set-key (kbd "M-m") #'find-file)
(global-set-key (kbd "M-s") #'save-buffer)

(add-to-list 'default-frame-alist '(font . "IosevkaTerm-20"))
(custom-set-variables
 '(custom-enabled-themes '(kaolin-bubblegum))
 '(custom-safe-themes
   '("f7a004e3a1f920d79a02988fd20a9af9f5cedb1491918e1ef247bf7481cbe93b"
  default))
 '(package-selected-packages '(doric-themes gotham-theme kaolin-themes moe-theme)))
(custom-set-faces )

(require 'package)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")
	("org" . "https://orgmode.org/elpa/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
