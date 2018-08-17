
(require 'setup-helm)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; (package-initialize)
(require 'company)
(setq company-minimum-prefix-length 3)
(add-hook 'after-init-hook 'global-company-mode)

(require 'ediff)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq-default ediff-highlight-all-diffs 'nil)
(setq ediff-diff-options "-w")

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "PYTHONPATH")
  (exec-path-from-shell-initialize))

(require 'expand-region)
(define-key global-map (kbd "C-=") 'er/expand-region)

(require 'magit)
  ;; Magic
(define-key global-map (kbd "C-x g s") 'magit-status)
(define-key global-map (kbd "C-x g x") 'magit-checkout)
(define-key global-map (kbd "C-x g c") 'magit-commit)
(define-key global-map (kbd "C-x g p") 'magit-push)
(define-key global-map (kbd "C-x g u") 'magit-pull)
(define-key global-map (kbd "C-x g e") 'magit-ediff-resolve)
(define-key global-map (kbd "C-x g r") 'magit-rebase-interactive)

(require 'magit-popup)

(require 'multiple-cursors)
(define-key global-map (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; (define-key global-map (kbd "C->" . mc/mark-next-)l'e-this)
;; (define-key global-map (kbd "C-<" . mc/mark-previous-)l'e-this)
;;   ("C-c C->" . mc/mark-all-like-this))

(require 'neotree)
(setq neo-theme 'arrow
      neotree-smart-optn t
      neo-window-fixed-size nil)

(require 'org)
(setq org-directory "~/workspace/document"
      org-default-notes-file (concat org-directory "/todo.org"))

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

(require 'org-projectile)

(require 'org-bullets)
(setq org-hide-leading-stars t)
(add-hook 'org-mode-hook
          (lambda ()
            (org-bullets-mode t)))

(require 'page-break-lines)

(require 'projectile)
(setq projectile-known-projects-file
      (expand-file-name "projectile-bookmarks.eld" temp-dir))

(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'recentf)
(setq recentf-save-file (recentf-expand-file-name "~/.emacs.d/private/cache/recentf"))
(recentf-mode 1)

(require 'smartparens)
(require 'smartparens-config)
(show-smartparens-global-mode 1)
(smartparens-global-mode 1)
(sp-with-modes '(c-mode c++-mode java-mode)
			   (sp-local-pair "{" nil :post-handlers '(("    ||\n[i]" "RET")))
			   (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
														 ("* ||\n[i]" "RET"))))

(require 'smex)

(require 'undo-tree)
(setq
 undo-tree-auto-save-history nil
 undo-tree-history-directory-alist `(("." . ,(concat temp-dir "/undo/"))))
(global-undo-tree-mode 1)

(require 'which-key)
(which-key-mode)

(require 'wgrep)

(require 'yasnippet)
(yas-global-mode 1)

;; Package zygospore
(require 'zygospore)
(define-key global-map (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

  ; automatically indent when press RET
(define-key global-map (kbd "RET") 'newline-and-indent)

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

(windmove-default-keybindings)

;; show red column number when it exceeds 70
(require 'modeline-posn)
(column-number-mode 1)

(require 'flycheck)
(global-flycheck-mode)

(require 'pdf-tools)
;; :init (pdf-tools-install)
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))

(require 'setup-editing)

(provide 'base-extensions)
