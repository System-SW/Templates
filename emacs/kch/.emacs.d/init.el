
;;; Code:
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;use package settings
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(org-babel-load-file (expand-file-name "~/.emacs.d/package.org"))

;; org mode setting

(defun org-check-cell ()
  (interactive)
  (let ((cell (org-table-get-field)))
    (if (string-match "[[:graph:]]" cell)
        (org-table-blank-field)
      (insert "O")
      (org-table-align))))

(define-key org-mode-map (kbd "C-c a") 'org-check-cell)

;; editer setting

(setq init-load-p nil)
(add-hook 'after-make-frame-functions (lambda (frame)
                                        (if init-load-p
                                            (message "init.el already loaded")
                                          (progn
                                            (load-file "~/.emacs.d/init.el")
                                            (setq init-load-p t))
                                          )))

(defun disable-minor-mode (mode major-mod-list)
  "Disable minor MODE when 'major-mode' in MAJOR-MOD-LIST."
  (if (member major-mode major-mod-list)
      (funcall mode 0)))

;;line numbering
(global-display-line-numbers-mode 1)
(add-hook 'after-change-major-mode-hook
          (lambda () (disable-minor-mode
                      'display-line-numbers-mode '(org-mode
                                                   treemacs-mode
                                                   shell-mode
                                                   gud-mode
                                                   term-mode
                                                   tetris-mode
                                                   snake-mode
                                                   eww-mode
                                                   magit-mode
                                                   eshell-mode
                                                   doc-view-mode
                                                   latex-mode))))

;; create ctags
(defun etags-create-with-current-path ()
  "Create etags with PATH."
  (interactive)
  (let (path
        (command "ctags -R -e %s"))
    (if (equal major-mode 'dired-mode)
        (setq path dired-directory)
      (setq path (file-name-directory buffer-file-name)))
    (shell-command (format command path))))

(defun my-frame-tweaks (&optional frame)
  "My personal frame tweaks."
  (unless frame
    (setq frame (selected-frame)))
  (when frame
    (with-selected-frame frame
      (progn
        ;; background
        (set-background-color "#000000")
        ;; buffer margins
        (set-face-attribute 'fringe nil :background "#000000"))
      )))

(my-frame-tweaks (selected-frame))
(add-hook 'after-make-frame-functions #'my-frame-tweaks t)

;; useless gui hide
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;;auto bracket
(electric-pair-mode 1)
(setq electric-pair-inhibit-predicate
      (lambda (c)
        (if (char-equal c ?\<) t
          (electric-pair-default-inhibit c))))

(add-hook 'minibuffer-setup-hook (lambda () (electric-pair-mode 0)))
(add-hook 'minibuffer-exit-hook (lambda () (electric-pair-mode 1)))


(show-paren-mode 1)

;; c indent setting
(add-hook 'c-mode-hook (lambda ()
                         (c-set-style "gnu")))

;; indent space only 
(setq-default indent-tabs-mode nil)

;; line highlight
(global-hl-line-mode t)
(set-face-background 'hl-line "#02300e")

;; hangul font setting
(set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

;; font size
(set-face-attribute 'default nil :height 140)

;; hangul input method setting
(set-input-method 'korean-hangul)
(toggle-input-method)
(global-set-key (kbd "S-SPC") 'toggle-input-method)


(global-set-key (kbd "<left>") 'previous-multiframe-window)
(global-set-key (kbd "<right>") 'next-multiframe-window)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(c-indent-comment-alist
   '((anchored-comment column . 0)
     (end-block space . 0)
     (cpp-end-block space . 2)))
 '(conda-anaconda-home "/home/madplayer/Programs/anaconda3/")
 '(custom-safe-themes
   '("2dff5f0b44a9e6c8644b2159414af72261e38686072e063aa66ee98a2faecf0e" default "dracula"))
 '(dracula-height-doc-title 1.3)
 '(ede-project-directories nil)
 '(electric-pair-mode t)
 '(fci-rule-color "#383838")
 '(initial-buffer-choice 'eshell)
 '(package-selected-packages
   '(edit-indirect counsel conda lsp-ivy projectile swiper undo-tree dracula-theme emms avy ivy markdown-preview-mode ox-reveal htmlize xcscope flycheck try use-package yasnippet iedit magit evil))
 '(pdf-view-midnight-colors '("#FDF4C1" . "#282828"))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(python-indent-def-block-scale 4)
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-prompt ((t (:foreground "green" :weight bold))))
 '(line-number ((t (:background "#000000" :foreground "#565761" :slant italic))))
 '(org-block ((t (:foreground "dim gray"))))
 '(org-code ((t nil))))
(put 'narrow-to-region 'disabled nil)
