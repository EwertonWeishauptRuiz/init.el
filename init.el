;;Load Packages

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;;Load or install necessary packages
(load "~/.emacs.d/python/init-packages-python")
;; Basic Emacs Configuration
;;-----------------------:|:---------------------------
;; Start Maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Remove Tool-bar, Menu bar and Scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; enable line numbers globally
(global-linum-mode t)

;; Highlight current line
(global-hl-line-mode +1)

;; Do not show initial Message
(setq inhibit-startup-message t)

;;Paranthesis highlighting
(show-paren-mode t)
(setq show-paren-style 'expression)

;; Custom Shortcuts and packages
;;-----------------------:|:---------------------------

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;;LoadTheme
(global-set-key (kbd "C-x l") 'load-theme)

;; Enable edit multiple Lines 
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)



;; Delete blank spaces and leave just one
(global-set-key (kbd "C-x <deletechar>") 'just-one-space)

;; Widnow Management
;;-----------------------:|:---------------------------
;; Resize Windows with Ctrl+Shift+ArrowKeys
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Setup split Windows 
(defun split-window-3()
 "Splite window into 3 equal windows"
 (interactive)
 (if (= 1 (length (window-list)))
     (progn (split-window-horizontally)
	    (split-window-horizontally)
	    (balance-windows)
	    )
   )
)
(global-set-key (kbd "C-c 3") 'split-window-3)

;;Load desired hooks
(load "~/.emacs.d/python/init-packages-python")
(load-theme 'tango-dark)
