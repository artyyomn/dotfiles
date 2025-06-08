(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq-default indent-tabs-mode t)
(set-fringe-mode 0)  ; Remove the fringe (the gray area on the sides)
(setq make-backup-files nil) ; doesnt makes backup files
(setq create-lockfiles nil)

(setq display-line-numbers-type 'relative)
(setq inhibit-startup-message t)

(column-number-mode)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(menu-bar-mode -1)
(load-theme 'modus-vivendi-tritanopia t)
(global-font-lock-mode 1)
;; (set-face-attribute 'default nil :family "JetBrainsMono NF" :height 120)

(set-face-attribute 'default nil :font "Cascadia Code-12")


(dolist (mode '(shell-mode
                eshell-mode
                term-mode
                vterm-mode
                dired-mode
				org-mode))
  (add-hook (intern (format "%s-hook" mode))
			(lambda () (display-line-numbers-mode 0))))

(setq scroll-conservatively            101
      mouse-wheel-follow-mouse         't
      mouse-wheel-progressive-speed    nil
      ;; Scroll 1 line at a time, instead of default 5
      ;; Hold shift to scroll faster and meta to scroll very fast
      mouse-wheel-scroll-amount        '(1 ((shift) . 3) ((meta) . 6)))

;; (Native) smooooooth scrolling
(setq pixel-scroll-precision-mode t)
;; (defun electric-pair ()
;;   (interactive)
;;   (if (eolp) (let (parens-require-spaces) (insert-pair))
;;     (self-insert-command 1)))
(electric-pair-mode 1)

(global-set-key (kbd "C-c c") 'compile)


;; Package setup
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if not present
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :diminish
  :config
  (ivy-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons evil evil-collection go-mode gruber-darker-theme
				   gruvbox-theme ivy lsp-mode lua-mode neotree
				   olivetti org-bullets rust-mode tree-sitter
				   visual-fill-column vterm yasnippet)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(line-number ((t (:foreground "White"))))
;;  '(line-number-current-line ((t (:foreground "White" :background "Black")))))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(require 'yasnippet)
(yas-global-mode)

(use-package org
  :config
  (setq org-ellipsis " ▾"))

(use-package org-bullets
  :ensure t
  :after org
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

