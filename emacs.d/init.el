;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:

;; add load path
(add-to-list 'load-path "~/.emacs.d/elisp")
(let ((default-directory  "~/.emacs.d/elisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'base)
;; (package-initialize t)
(require 'base-theme)
(require 'base-extensions)
(require 'base-functions)
(require 'base-global-keys)

(require 'lang-c)

(require 'lang-python)

;; (require 'lang-ruby)

;; (require 'lang-go)

;; (require 'lang-php)

;; (require 'lang-javascript)

;; (require 'lang-web)

;; (require 'lang-haskell)

;; (require 'lang-elixir)

;; (require 'lang-java)

;; (load-file "~/.emacs.d/elisp/prelude/init.el")
