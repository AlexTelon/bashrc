(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

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
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
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


(global-set-key (kbd "C-c o") 'ff-find-other-file) ;; dont know why I have two..
(global-set-key (kbd "M-o") 'ff-find-other-file)

(global-set-key (kbd "C-.") 'other-window) ;; yummy

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

