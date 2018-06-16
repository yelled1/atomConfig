;; init.el --- Emacs configuration
;; https://realpython.com/blog/python/emacs-the-best-python-editor/
;; INSTALL PACKAGES
;; -------------------------------------- '("melpa" . "http://melpa.milkbox.net/packages/") t)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; Check if we're on Emacs 24.4 or newer, if so, use the pinned package feature
(when (boundp 'package-pinned-packages)
  (setq package-pinned-packages
                '((better-defaults    . "melpa")
		  (dirtree            . "melpa")
		  (t-stableramp       . "melpa")
		  (tabbar             . "melpa")
		  (expand-region      . "melpa")
		  (key-chord          . "melpa")
		  (ensime             . "melpa-stable")
		  (ein                . "melpa")
		  (elpy               . "melpa")
          (evil               . "melpa")
          (evil-leader        . "melpa")
          (evil-numbers       . "melpa")
          (julia-shell       . "melpa")
          (julia-mode        . "melpa")
		  (flycheck           . "melpa")
		  (material-theme     . "melpa")
		  (py-autopep8        . "melpa"))))
				
;;(elpy               . "https://jorgenschaefer.github.io/packages/")
;;(package-initialize t)
(setq use-package-always-ensure)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    dirtree
    tramp
    expand-region
    key-chord
    ensime
    ein
    elpy  
    evil
    evil-leader
    evil-numbers
    julia-shell
    julia-mode
    flycheck
    material-theme
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------
(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
;;(load-theme 'color-theme-desert t)
(global-linum-mode t) ;; enable line numbers globally
(tool-bar-mode 0) 
(menu-bar-mode 1)
(scroll-bar-mode 1)
;;(fset `yes-or-no-p `y-or-n-p)

;; PYTHON CONFIGURATION
;; --------------------------------------
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
(elpy-enable)
;;(elpy-use-ipython)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; use flycheck not flymake with elpy 
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Global variables
;; http://ensime.github.io/editors/emacs/learning/
;; --------------------------------------
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

(set-face-attribute 'default nil :height 105) ;; Font size
;;(set-language-environment "Korean")
;;(set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

(electric-indent-mode 0) ;; modes
(global-unset-key (kbd "C-z")) ;; global keybindings

;; Global variables
;;# From http://www.47deg.com/blog/scala-development-with-emacs
;; --------------------------------------
;;We have "sbt" and "scala" in /usr/local/bin so add this path to the PATH
;;(setq exec-path (append exec-path '("/usr/local/bin")))
;;(setq exec-path (append exec-path '("/usr/local/sbin")))
;;(setenv "PATH" (shell-command-to-string "/bin/bash -c 'echo -n $PATH'"))

(require 'ensime)
;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;  (setq prettify-symbols-alist scala-prettify-symbols-alist)
;  (prettify-symbols-mode)
(autoload 'dirtree "dirtree" "Add directory to tree view" t)
(setq ensime-startup-notification nil)
(eval-after-load 'ensime 
     '(define-key ensime-mode-map (kbd "<C-return>") 'ensime-inf-eval-region))
;; ensime-inf-run-scala ; starts scala repl

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'tramp) ; Adds Remote file edit
(setq tramp-default-method "scp")

;;(require 'hl-line+) ; Load this file (it will load `hl-line.el')
;; mark-thing (line?))) // thing-cmds.el

;; key chords
;(require 'key-chord)
;(setq key-chord-one-key-delay 0.2) ; default 0.2
;(key-chord-define-global ".." 'er/expand-region)
;key-chord-define-global ",," 'mark-lines-current-line
;(key-chord-mode +1)

(global-set-key (kbd "<C-tab>") 'elpy-company-backend)

;; ini.el ended here: BELOW are NEW!
;;`C-h k is describe Emacs keybiding 
;; EviL
(package-initialize)
(evil-mode 1)

;; Julia Stuf
;(add-to-list 'load-path "path-to-julia-shell-mode")
;(require 'julia-shell
;(defun my-julia-mode-hooks ()
;  (require 'julia-shell-mode))
;(add-hook 'julia-mode-hook 'my-jua-mode-hooks)
;(define-key julia-mode-map (kbd "<C-return>") 'julia-shell-run-region-or-line)
;(define-key julia-mode-map (kbd "C-c C-s") 'julia-shell-save-and-go)

(add-to-list 'load-path "path-to-julia-mode")
(require 'julia-mode)

(global-set-key (kbd "C-`") 'other-window)
