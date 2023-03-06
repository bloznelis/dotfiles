;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Lukas Bloznelis"
      user-mail-address "lukas@bluelabs.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
 (setq doom-font (font-spec :family "JetBrainsMono" :size 14 :weight 'light)
       doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 13)
       doom-unicode-font (font-spec :family "Symbola")
       doom-big-font (font-spec :family "JetBrainsMono" :size 24))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'lukas-solarized-light)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Modeline configuration
;; (setq doom-modeline-buffer-file-name-style 'file-name)

;; Treemacs icons
(setq doom-themes-treemacs-theme "doom-colors")

;; Lukas' settings
(setq scroll-margin 8)
(setq scroll-conservatively 1000) ;; Scroll one line at the time

' runnables
(keychain-refresh-environment)

(setq require-final-newline t)

(modify-syntax-entry ?_ "w") ;; select entire foo_bar_baz instead of just bar

;; Lukas' extensions
(defun duplicate-line ()
  "Duplicate current line"
  (interactive)
  (kill-whole-line)
  (yank)
  (yank))

;; (add-hook 'company-mode-hook
;; (lambda ()
;;   (add-hook 'evil-normal-state-entry-hook
;;       (lambda ()
;;               (company-abort)))))

;;;;;;;;;;;;;;
;;   LSP
;;;;;;;;;;;;;
(map! "C-q" #'lsp-ui-doc-toggle)
(map! "C-b" #'+lookup/definition) ;; does not work?

(require 'expand-region)
(map! "C-x C-w" #'er/expand-region)
(map! :leader
      "v" #'er/expand-region)


(setq clojure-toplevel-inside-comment-form t)

(map! :leader
      :desc "Eval to comment"
      "m e ;" #'cider-eval-defun-to-comment)

(map! "C-t" #'+vterm/toggle) ;; does not work??

;; Wrap
(map! :leader
      "(" #'sp-wrap-round)

(map! :leader
      "[" #'sp-wrap-square)

(map! :leader
      "{" #'sp-wrap-square)

(map! :leader
      "e d" #'cider-eval-defun-at-point)

(map! :leader
      "e b" #'cider-eval-buffer)

(map! :leader
      "e ;" #'cider-eval-defun-to-comment)

;; Github forge
(setq auth-sources '("~/.authinfo.gpg"))

;; YAML mode for templated yaml files
(add-to-list 'auto-mode-alist '("\\.yaml.gotmpl\\'" . yaml-mode))
