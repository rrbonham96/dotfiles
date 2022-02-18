;; General configuration
(setq inhibit-startup-message t)

(scroll-bar-mode -1)    ; Disable visual scroll bar
(tool-bar-mode -1)      ; Disable toolbar
(tooltip-mode -1)       ; Disable tooltips
(set-fringe-mode 10)    ; Breathing room

(global-display-line-numbers-mode 1)

;; Visual bell
(setq visual-bell t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Font

;; Theme
(load-theme 'wombat)

;; Package bug workaround
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; package sources
(require 'package)

(setq package-archives '(("elpa". "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Packages
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config (ivy-mode 1))

(use-package evil
  :config (evil-mode 1))

(use-package go-mode)

;; Customiziation
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-mode t)
 '(package-selected-packages (quote (swiper counsel go-mode evil evil-mode use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
