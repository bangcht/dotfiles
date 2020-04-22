(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))

(require 'evil)
(evil-mode 1)
(setq org-pretty-entities t
    org-pretty-entities-include-sub-superscripts t)

(ac-config-default)

(add-hook 'python-mode-hook 'jedi:setup)

(require 'pyvenv)

(global-set-key [f5] 'recompile)
(global-set-key [f6] 'compile)

(setq compilation-scroll-output 'first-error)

(add-hook 'prog-mode-hook 'linum-mode)
(setq completion-cycle-threshold 5)

(require 'git-gutter-fringe)
(global-git-gutter-mode +1)

(require 'url)

(defun insert-image-from-url (&optional url)
  (interactive)
  (save-excursion
    (message url)
    (unless url (setq url (url-get-url-at-point)))
    (unless url
	(error "Couldn't find URL."))
    (let ((buffer (url-retrieve-synchronously url)))
	(unwind-protect
	    (let ((data (with-current-buffer buffer
			(goto-char (point-min))
			(search-forward "\n\n")
			(buffer-substring (point) (point-max)))))
		(goto-char (point-max))
		(end-of-line)
	    (insert-image (create-image data 'imagemagick t :max-height 200)))
	(kill-buffer buffer))))
  )

(defun insert-image-from-url-1 (&optional url)
  (interactive)
  (unless url (setq url (url-get-url-at-point)))
  (unless url
    (error "Couldn't find URL."))
  (let ((buffer (url-retrieve-synchronously url)))
    (unwind-protect
         (let ((data (with-current-buffer buffer
                       (goto-char (point-min))
                       (search-forward "\n\n")
                       (buffer-substring (point) (point-max)))))
           (insert-image (create-image data 'imagemagick nil :height 20)))
      (kill-buffer buffer))))

(defun add-new-line-at-end ()
  (interactive)
  (save-excursion
    (goto-char (point-max))
    (end-of-line)
    (insert "\n")
    )
  )

(require 's)

(defun show-images-in-buffer ()
  (interactive)
  (add-new-line-at-end)
  (save-excursion
    (goto-char (point-min))
    (while (< (forward-line) 1)
      (end-of-line)
      (let* ((lb (line-beginning-position))
             (le (line-end-position))
             (text (buffer-substring-no-properties lb le)))

	(mapcar '(lambda(val) (if (s-starts-with? "http" val) (insert-image-from-url (s-replace "%20" " " val)))) (s-match "http\\([-:_A-Za-z0-9/.\%]+\\)jpg" text))
	)
      )
    )
  )



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(evil-escape-mode t)
 '(package-selected-packages
   (quote
    (zenburn-theme markdown-mode org ## s git-gutter jedi-direx pyvenv jedi auto-complete evil-escape evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
