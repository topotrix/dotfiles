(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")


;; GENERAL OPTIONS


;; Automatically load abbreviations table
;; by default, emacs choose the filename "~/.abbrev_defs", so don't try to change its name
(setq-default abbrev-mode t)
;;(read-abbrev-file "~/.abbrev_defs")
(setq save-abbrevs t)

;; highlight current line
(global-hl-line-mode 0)

;; set indent size
(setq standard-indent 2)

;; line-by-line scrolling
(setq scroll-step 1)

;; turn off tab character
(setq-default indent-tab-mode nil)

;; enable wheel-mouse scrolling
(mouse-wheel-mode t)

;; prevent backup file creation
;;(setq make-backup-files nil)
;; enable backup files
(setq make-backup-files t)

;; enable versioning with default values
(setq version-control t)

;; backup files saving directory
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backup/"))))

;; enable line and column numbering
(line-number-mode 1)
(column-number-mode 1)

;; set fill column
(setq-default fill-column 79)

;; enable auto fill mode
(setq auto-fill-mode 1)

;; make text mode the default mode for new buffers
(setq default-major-mode 'text-mode)

;; use 'y' and 'n' instead of 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; stop the cursor blinking
(blink-cursor-mode -1)

;; remove menu bar and tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; c style
;; take a look at the variable 'c-style-alist' to see a list of style
(setq c-default-style "linux")


;; LOAD FILES

;; load emacs-python-mode
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

;; load emacs-lua-mode
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;; DEFINE FUNCTIONS


;; iBuffer
(autoload 'ibuffer "ibuffer" "List buffers." t)
(setq ibuffer-saved-filter-groups
      (quote (("default"
	       ("Programming"
		(or
		 (mode . c-mode)
		 (mode . c++-mode)
		 (mode . python-mode)
		 (mode . emacs-lisp-mode)
		 (mode . lisp-mode)
		 (mode . sql-mode)
		 (mode . html-mode)
		 (mode . js2-mode)
		 (mode . pascal-mode)
		 (mode . makefile-gmake-mode)
		 (mode . nxml-mode)
		 (mode . yaml-mode)
		 (mode . sh-mode)
		 (mode . rst-mode)
		 (mode . go-mode)
		 (mode . po-mode)
		 ))
	       ("Dired"
		(or
		 (mode . dired-mode)))
	       ("Version Control"
		(or
		 (mode . magit-mode)
		 (name . "^*magit")
		 (mode . ahg-status-mode)))
	       ("Org"
		(or
		 (mode . org-mode)
		 (mode . org-agenda-mode)
		 (mode . diary-mode)
		 (mode . calendar-mode)
		 (name . "^*Fancy Diary")
		 ))
	       ("Emacs"
		(or
		 (name . "^\\*scratch\\*$")
		 (name . "^\\*Messages\\*$")
		 (name . "^\\*telm\\*$")
		 (mode . help-mode)))
	       ))))

(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-switch-to-saved-filter-groups "default")))


;; KEY BINDINGS
(global-set-key (kbd "<f5>") 'find-file)
(global-set-key (kbd "<f6>") 'save-buffer)
(global-set-key (kbd "<f7>") 'save-buffers-kill-emacs)

(global-set-key (kbd "C-x C-b") 'ibuffer)
