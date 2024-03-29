;; C-IDE based on https://github.com/tuhdo/emacs-c-ide-demo
;; Available C style:
;; "gnu": The default style for GNU projects
;; "k&r": What Kernighan and Ritchie, the authors of C used in their book
;; "bsd": What BSD developers use, aka "Allman style" after Eric Allman.
;; "whitesmith": Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; "stroustrup": What Stroustrup, the author of C++ used in his book
;; "ellemtel": Popular C++ coding standards as defined by "Programming in C++, Rules and Recommendations," Erik Nyquist and Mats Henricson, Ellemtel
;; "linux": What the Linux developers use for kernel development
;; "python": What Python developers use for extension modules
;; "java": The default style for java-mode (see below)
;; "user": When you want to define your own style
(setq c-default-style "gnu") ;; set style to "linux"
(setq gdb-many-windows t ;; use gdb-many-windows by default
	  gdb-show-main t)

(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)
(semantic-mode 1)

(require 'ede)
  ;; Enable EDE only in C/C++
  ;; (global-ede-mode)

(require 'setup-helm-gtags)

;; company-c-headers
(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)

(defun alexott/cedet-hook ()
  (local-set-key (kbd "C-c C-j") 'semantic-ia-fast-jump)
  (local-set-key (kbd "C-c C-s") 'semantic-ia-show-summary))

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

(require 'srefactor)
(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(define-key c-mode-map (kbd "M-RET")  'srefactor-refactor-at-point)

(provide 'lang-c)
