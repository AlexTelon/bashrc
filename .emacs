(load-theme 'tsdh-dark)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(require 'package)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(set-face-attribute 'mode-line nil
		    :box '(:width 0))

(column-number-mode)

(ido-mode)

(show-paren-mode)

(global-hl-line-mode)

;; (winner-mode t)

;; (windmove-default-keybindings)

(global-set-key (kbd "M-x") 'smex)

(nlinum-mode)

(global-undo-tree-mode)
(global-set-key (kbd "M-/") 'undo-tree-visualize)

(global-set-key (kbd "C->") 'ace-jump-mode)

;;mc-extras
;; (define-key rectangle-mark-mode-map (kbd "C-. C-,") 'mc/rect-rectangle-to-multiple-cursors)

(global-set-key (kbd "C-}") 'mc/mark-next-like-this)
(global-set-key (kbd "C-{") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-{") 'mc/mark-all-like-this)

(global-set-key (kbd "C-=") 'er/expand-region)


(add-hook 'c-mode-common-hook
          (lambda ()
            (if (derived-mode-p 'c-mode 'c++-mode)
                (cppcm-reload-all)
              )))

;; maybe change gud-gdb to realgud thing?
(global-set-key (kbd "C-c C-g")
                '(lambda ()(interactive) (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; (require 'auto-complete-config)
;; (require 'auto-complete-clang)
;; (ac-common-setup)
;; (add-to-list 'ac-sources 'ac-clang)

;; (global-flycheck-mode)
;; (require 'rtags)
;; (cmake-ide-setup)

(rtags-start-process-unless-running)
(add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)
(global-set-key (kbd "M-.") 'rtags-find-symbol-at-point)
(global-set-key (kbd "M-.") 'rtags-find-symbol-at-point)


;;realgud debugger
;;(load-library realgud)

;; (global-set-key (

(put 'downcase-region 'disabled nil)

(global-set-key (kbd "RET") 'newline-and-indent) ;; filips lovechild ;)
(global-set-key (kbd "C-z") 'undo) ;; this so that i dont minimize it by mistake I think

(setq-default indent-tabs-mode nil
	                    tab-width 2)

;; python things
(setq python-remove-cwd-from-path nil)
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(python-python-command "python3")
 '(python-shell-interpreter "python3")
 '(show-paren-mode t))


;; other things
(add-to-list 'load-path "~/.emacs.d/plugins")
(load "dash.el")
(load "with-editor.el")

;; switching to company-mode instead
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;; (ac-config-default)


;(iswitchb-mode 1)

(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(require 'cmake-mode)
(add-to-list 'auto-mode-alist '("BUILD\\'" . python-mode)) ;hack, better than nothing


(add-to-list 'load-path "~/.emacs.d/plugins/magit/lisp")
(require 'magit)
(with-eval-after-load 'info
		      (info-initialize)
		      (add-to-list 'Info-directory-list
				   "~/.emacs.d/plugins/magit/Documentation/"))


(global-set-key (kbd "M-o") 'ff-find-other-file)
(global-set-key (kbd "C-,") 'other-window) ;; yummy

(setq ff-special-constructs 'nil)
(add-to-list 'auto-mode-alist '("\\.h" . c++-mode))


(add-hook 'c-mode-common-hook 
	    (lambda()
	          (setq ff-other-file-alist my-cpp-other-file-alist)))

(global-set-key (kbd "M-p") 'my-compile)

(defun my-compile ()
  (interactive "*")
  (compile "~/tools/mymake/mymake main -a filipBlog.txt" t))

(defvar my-cpp-other-file-alist
  '(("\\.cpp\\'" (".h"))
    ("\\.h\\'" (".cpp" ".c"))))


(defun my-c-mode-common-hook ()
 ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
 (c-set-offset 'substatement-open 0)
 ;; other customizations can go here

 (setq c++-tab-always-indent t)
 (setq c-basic-offset 4)                  ;; Default is 2
 (setq c-indent-level 4)                  ;; Default is 2

 (setq c++-basic-offset 4)                  ;; Default is 2
 (setq c++-indent-level 4)                  ;; Default is 2


 (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 (setq tab-width 4)
 (setq indent-tabs-mode t)  ; use spaces only if nil
 )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Latex things

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
;(setq TeX-PDF-mode t)


(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)

;; So that RefTeX finds my bibliography
(setq reftex-default-bibliography '("~/exjobb/TDDD89/TDDD89-HT2015-B3-2/main.bib"))


;; Spell checker things
(cond
 ((executable-find "aspell")
  (setq ispell-program-name "aspell")
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")))
 ((executable-find "hunspell")
  (setq ispell-program-name "hunspell")
  (setq ispell-extra-args '("-d en_US")))
 )

(global-set-key (kbd "M-q") 'fill-paragraph)


;; spelling things
(global-set-key (kbd "C-c w") 'ispell-word)
(add-hook 'latex-mode-hook   'flyspell-mode) ;; Do I really need both? 
(add-hook 'LaTeX-mode-hook   'flyspell-mode) ;; This one works on ida at least.

;;(global-set-key (kbd "C-s-<f9>") 'flyspell-mode) ADD THIS :)
;;(global-set-key (kbd "C-<f9>") 'flyspell-check-previous-highlighted-word)
;;(defun flyspell-check-next-highlighted-word ()
;;  "Custom function to spell check next highlighted word"
;;  (interactive)
;;  (flyspell-goto-next-error)
;;  (ispell-word)
;;  )
;;(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)
;; should add flyspell-prog-mode
