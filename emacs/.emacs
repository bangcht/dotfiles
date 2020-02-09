(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'evil)
(evil-mode 1)

(ac-config-default)

(add-hook 'python-mode-hook 'jedi:setup)

(require 'pyvenv)

(global-set-key [f5] 'compile)

(setq compilation-scroll-output 'first-error)

(add-hook 'prog-mode-hook 'linum-mode)
(setq completion-cycle-threshold 5)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(evil-escape-mode t)
 '(package-selected-packages (quote (pyvenv jedi auto-complete evil-escape evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
