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
(use-package sr-speedbar
  :ensure t)

;; Python
(use-package elpy
  :ensure t
  :config
  (elpy-enable))

;; Java & scala
(use-package jdee
  :ensure t)
(use-package scala-mode
  :ensure t)

;; Flex & bison
(use-package bison-mode
  :ensure t)

;; Customized setup
(require 'setup-general)
(require 'setup-ivy-counsel)
(require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'column-marker)

;; Column marker
(add-hook 'c-mode-common-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 79)))

(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d/desktop"))
(setq desktop-dirname "~/.emacs.d/desktop")

(defconst my-c-style
	'((c-tab-always-indent     . t)
      (c-basic-offset          . 2)
      (c-hanging-braces-alist  . ((substatement-open after)
	                              (brace-list-open)))
	  (c-hanging-colons-alist  . ((member-init-intro before)
	                              (inher-intro)
                                  (case-label after)
                                  (label after)
                                  (access-label after)))
      (c-cleanup-list          .  (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
      (c-offsets-alist         . ((arglist-close . c-lineup-arglist)
                                  (substatement-open . 0)
                                  (case-label        . 3)
                                  (inline-open       . 0)
                                  (block-open        . 0)
                                  (arglist-intro     . +)
                                  (knr-argdecl-intro . -)
                                  (innamespace     . [0])))
      ;;that's just optional (allow to see what you indent)
	  (c-echo-syntactic-information-p . t))
    "My C Programming Style")

;; Option used to correct identation for curl-brakets
(defun my-c-mode-common-hook ()
  "Customized C hook.
Customizations for all of c and related modes."
  (c-add-style "PERSONAL" my-c-style t)
  ;; other customizations can go here
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
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

(provide 'init)
