(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Tweaks
(add-to-list 'load-path "~/.emacs.d/custom")
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
;; (global-set-key (kbd "<f5>") 'revert-buffer)
;; Show line number in the mode line.
(line-number-mode 1)
;; Show column number in the mode line.
(column-number-mode 1)

;; Font size
(set-face-attribute 'default nil :height 150)
(set-default-font "Monospace-12")
(global-set-key (kbd "<C-mouse-4>") 'text-scale-decrease)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-increase)

;; Encoding
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)

;; Set auto pair
(setq skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(global-set-key "\"" 'skeleton-pair-insert-maybe)
(global-set-key "'" 'skeleton-pair-insert-maybe)

;; Automatically remove trailing whitespace when file is saved.
(add-hook 'before-save-hook 'whitespace-cleanup)

(require 'use-package)
(setq use-package-always-ensure t)

;; Which key help
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Hideshow
(use-package hideshow-org
  :ensure t
  :config
  (add-hook 'c-mode-common-hook 'hs-minor-mode))

;; Column marker
(use-package column-marker
  :ensure t
  :config
  (add-hook 'c-mode-common-hook (lambda () (interactive) (column-marker-1 80)))
  (add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 79)))
  )

;; Auto-complete
(use-package auto-complete-config
  :ensure t
  :config
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
  (ac-config-default))

;; Flycheck
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

;; Speedbar in the same frame
(require 'sr-speedbar)

;; Customized setup
(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (sr-speedbar flycheck ace-window which-key try hideshow-org zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
