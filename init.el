;; init.el --- Emacs configuration

;; Themes
;; color-theme-sanityinc-tomorrow
;; zenburn-theme
;; Tango

;; INSTALL PACKAGES
;; --------------------------------------

;; MELPA
(require 'package)
(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    material-theme
    flycheck
    multiple-cursors
    iedit
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; BASIC CUSTOMIZATION
;; --------------------------------------

;; Start Maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Remove Tool-bar, Menu bar and Scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1) 

;; Do not show initial Message
(setq inhibit-startup-message t)

;; enable line numbers globally
(global-linum-mode t) 

;; Load a dark theme
(load-theme 'material t)

;; Highlight current line
(global-hl-line-mode +1)

;; Use lines for identation - highlight-indent-guides must be
;; installed within package manager
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-character ?\|)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

''LoadTheme
(global-set-key (kbd "C-x l") 'load-theme)

;; Open iEdit if mode is not enabled
(global-set-key (kbd "C-;") 'iedit-mode)
(global-set-key (kbd "C-x r") 'iedit-replace-occurrences)


;; Preview Live MarkDown
(global-set-key (kbd "C-x RET C-d") 'flymd-flyit)

;; Enable edit multiple Lines 
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; Go to error PEP8
(global-set-key (kbd "C-,") 'flycheck-previous-error)
(global-set-key (kbd "C-.") 'flycheck-next-error)
(global-set-key (kbd "C-/") 'flycheck-list-errors)


;; Resize Windows with Ctrl+Shift+ArrowKeys
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Delete blank spaces and leave just one
(global-set-key (kbd "C-x <deletechar>") 'just-one-space)

;;Paranthesis highlighting
(show-paren-mode t)
(setq show-paren-style 'expression)

;; PDB Shortcut
(defun pdb-set-trace ()
  "Import pdb and set breaking point"
  (interactive)
  (insert "import pdb; pdb.set_trace()"))
(global-set-key (kbd "C-x C-p") 'pdb-set-trace)

;; Set Up split
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

(package-initialize)

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
;; (elpy-use-ipython)			

(require 'multiple-cursors)

(setq iedit-current-symbol-default t
            iedit-only-at-symbol-boundaries t
	    iedit-toggle-key-default (kbd "C-;"))

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8
;; (require 'py-autopep8)

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "f66abed5139c808607639e5a5a3b5b50b9db91febeae06f11484a15a92bde442" "bbb521edff9940ba05aeeb49f9b247e95e1cb03bd78de18122f13500bda6514f" "8e51e44e5b079b2862335fcc5ff0f1e761dc595c7ccdb8398094fb8e088b2d50" "ef403aa0588ca64e05269a7a5df03a5259a00303ef6dfbd2519a9b81e4bce95c" "0e8bac1e87493f6954faf5a62e1356ec9365bd5c33398af3e83cfdf662ad955f" "3cd4f09a44fe31e6dd65af9eb1f10dc00d5c2f1db31a427713a1784d7db7fdfc" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "d057f0430ba54f813a5d60c1d18f28cf97d271fd35a36be478e20924ea9451bd" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "ba913d12adb68e9dadf1f43e6afa8e46c4822bb96a289d5bf1204344064f041e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(package-selected-packages
   (quote
    (snazzy-theme nyx-theme moe-theme monokai-theme multiple-cursors markdown-mode flymd doom-themes dracula-theme alect-themes zenburn-theme py-autopep8 material-theme magit iedit highlight-indent-guides gruvbox-theme flycheck elpy ein dumb-jump color-theme-sanityinc-tomorrow better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'snazzy)
