(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                     ("marmalade" . "http://marmalade-repo.org/packages/")
                     ("melpa" . "http://stable.melpa.org/packages/")))

(defvar my-packages '(better-defaults
                      projectile
                      clojure-mode
                      cider
                      clj-refactor
                      company
		      smartparens))

(package-initialize)

(global-company-mode)

(projectile-global-mode)

(auto-revert-mode)

(require 'clj-refactor)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m")
    (smartparens-strict-mode)
    (sp-use-smartparens-bindings)
    (require 'smartparens-config))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(setq cider-boot-parameters "repl -s watch refresh")
