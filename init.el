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

;; Set auto pair
(setq skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(global-set-key "\"" 'skeleton-pair-insert-maybe)
(global-set-key "'" 'skeleton-pair-insert-maybe)

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
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

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
  ;; (require 'setup-helm-gtags))
  (require 'setup-ggtags))
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
 '(haskell-mode-hook
   (quote
    (turn-on-haskell-indent turn-on-eldoc-mode capitalized-words-mode turn-on-haskell-doc-mode turn-on-haskell-decl-scan imenu-add-menubar-index turn-on-haskell-unicode-input-method)))
 '(package-selected-packages
   (quote
    (elpa-mirror sr-speedbar flycheck ace-window which-key try hideshow-org zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
