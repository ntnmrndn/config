;;;;;;;;;;;;;;;;;;;;;;;;
;; Load / Mode        ;;
;;;;;;;;;;;;;;;;;;;;;;;;

 ;; (setq auto-mode-alist (append '
 ;; auto-mode-alist))

 ;; If you are doing Rhino scripts, add:
 ;; (setq auto-mode-alist (append '

;;(gnuserv-start)

(setq auto-mode-alist
      (append
       '(
;;	 ("\\.php$" . php-mode)
         ("\\Podfile$" . ruby-mode)
         ("\\.podspec$" . ruby-mode)
  ;;       ("\\.php5$" . php-mode)
         ("\\.qrc$" . xml-mode)
         ("\\.h$" . c++-mode)
	 ("\\.c$" . c-mode)
;;	 ("\\.\\(frm\\|bas\\|cls\\)$" . visual-basic-mode)
;;	 ("\\.\\(frm\\|bas\\|cls\\|rvb\\)$" .
;;                                visual-basic-mode)
	 ("\\.m$" . objc-mode)
	;; ("\\.cob$" . cobol-mode)
	 ("\\.tpl$" . html-mode)
	 ("\\.html$" . html-mode)
	 ("CMakeLists.txt" . cmake-mode)
         ("\\.cmake" . cmake-mode)
;;	 ("\\.lua$" . lua-mode)
	 ("\\.cwp$" . bnf-mode)
	 ("\\.cws$" . bnf-mode)
;;	 ("\\.bat$" . bat-mode)
	 ("\\.csv$" . csv-mode)
	 ("\\.yml$" . yaml-mode)
	 ("Makefile" . makefile-mode)
	 )
       auto-mode-alist))
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

(load "yaml-mode.elc")
(load "pink-bliss.elc")
(load "csv-mode.elc")
;;(load "visual-basic-mode.elc")
;;(load "yasnippet.elc")
;;(load "php-mode.elc")
;;(load "lua-mode.elc")
;; (load "color-theme.el")
 (load "auto-complete.elc")
(load "php-l.elc")
(load "backup-mode.elc")
;;(load "bat-mode.elc")
(load "gud.elc")
(load "tnetacle.elc")
(load "cmake-mode.elc")

;;rinari
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/rinari"))
;; (require 'rinari)
;;(load "cobol-mode.elc")
(add-hook 'lua-mode-hook 'turn-on-font-lock)
(add-hook 'ruby-mode-hook
           '(lambda ()
              (add-hook 'after-save-hook (lambda ()
                                           (shell-command (concat "ruby -c " (buffer-file-name)))))
              )
)

(defun ruby-l(&optional b e)
  (interactive)
  (save-excursion
    (goto-char 1)
    (push-mark)
    (mark-whole-buffer)
    (shell-command-on-region b e "ruby -c")))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (global-set-key (kbd "C-x C-l") 'ruby-l)))

(add-hook 'fortran-mode-hook (lambda () (linum-mode 1)))

;;(defun c-plus-plus-search-documentation ()
;;  "Search PHP documentation for the word at point."
;;  (interactive)
;;  (browse-url (concat "http://www.cplusplus.com/query/search.cgi?q=" (current-word t))))
;;(global-set-key "^[[h" 'beginning-of-line)
;;(global-set-key "M-[ F" 'beginning-of-line)
(global-set-key [home]		'beginning-of-line)
(global-set-key [select]	'end-of-line)
(global-set-key [end]	'end-of-line)
;(global-set-key [kp-enter]	'newline-and-indent)



(custom-set-faces
 '(default ((t ( :foreground "white" :background "black" :weight bold ))))
 '(cursor ((t (:background "#FFFFFF"))))
 '(mouse ((t (:foreground "white" :background "black"))))
 '(highlight ((t (:background "grey2" :weight normal))))
 '(font-lock-builtin-face ((t (:foreground "cyan"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "red"))))
 '(font-lock-comment-face ((t (:foreground "red" ))))
 '(font-lock-constant-face ((t (:foreground "magenta"))))
 '(font-lock-function-name-face ((t (:foreground "blue"))))
 '(font-lock-keyword-face ((t (:foreground "cyan" ))))
 '(font-lock-negation-char-face ((t (:foreground "blue"))))
 '(font-lock-preprocessor-face ((t (:foreground "magenta" :slant italic))))
 '(font-lock-string-face ((t (:foreground "green"))))
 '(font-lock-type-face ((t (:foreground "green"))))
 '(font-lock-variable-name-face ((default (:foreground "yellow"))))
 '(font-lock-warning-face ((t (:foreground "red"))))
 '(ido-subdir ((t (:foreground "green"))))
 '(ido-first-match ((t (:foreground "green"))))
 '(show-paren-match ((t (:background "blue" :foreground "white"))))
 '(show-paren-mismatch ((t (:background "green" :foreground "white"))))
 '(minibuffer-prompt ((t (:foreground "#0089EE"))))
)



;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;;(load-file "/home/marand_a/.emacs.d/common/cedet.el")

;;(require 'semantic-ia)
;;(require 'semantic-gcc)


;;(semantic-add-system-include "~/exp/include/boost_1_37" 'c++-mode)
;; Enable EDE (Project Management) features
;;(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;;(ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
;;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;;(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;;  (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languges only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)





(define-generic-mode 'bnf-mode '("#") nil '(("^<.*?>" . 'font-lock-variable-name-face) ("<.*?>" . 'font-lock-keyword-face) ("::=" . 'font-lock-warning-face) ("\|" . 'font-lock-warning-face) ) '("\\.bnf\\.pybnf\\'") nil "Major mode for BNF highlighting.")




(defun c-plus-plus-search-documentation ()
  "Search c++ documentation for the word at point."
  (interactive)
  (browse-url (concat (concat "http://www.google.fr/search?hl=fr&source=hp&q=site:cplusplus.com+" (current-word t)) "&btnI=J'ai+de+la+chance&aq=f&aqi=&aql=&oq=&gs_rfai=")))



(defun java-search-documentation ()
  "Search java documentation for the word at point."
  (interactive)
  (browse-url (concat (concat "http://www.google.fr/search?hl=fr&source=hp&q=site:oracle.com+" (current-word t)) "&btnI=J'ai+de+la+chance&aq=f&aqi=&aql=&oq=&gs_rfai=")))


(defun vba-search-documentation ()
  "Search vba documentation for the word at point."
  (interactive)
  (browse-url (concat (concat "http://www.google.fr/search?hl=fr&source=hp&q=site:msdn.microsoft.com/en-us/+" (current-word t)) "+Excel+VBA+Language+Reference&btnI=J'ai+de+la+chance&aq=f&aqi=&aql=&oq=&gs_rfai=")))

(defun google ()
  "Search c++ documentation for the word at point."
  (interactive)
  (browse-url (concat "http://www.google.fr/search?sourceid=chrome&ie=UTF-8&q=" (current-word t))))



(defun qt-search-documentation ()
  "Search c++ documentation for the word at point."
 (interactive)
  (browse-url (concat (concat "http://www.google.fr/search?hl=fr&source=hp&q=site:qt-project.org/doc/qt-4.8/+" (current-word t)) "&btnI=J'ai+de+la+chance&aq=f&aqi=&aql=&oq=&gs_rfai=")))



;; (define-key visual-basic-mode-map
;;   "\C-c\C-f"
;;   'vba-search-documentation)

;; (define-key java-mode-map
;;   "\C-c\C-f"
;;   'java-search-documentation)

;; (define-key c++-mode-map
;;   "\C-c\C-q"
;;   'qt-search-documentation)
;; (define-key c++-mode-map
;;   "\C-c\C-f"
;;   'c-plus-plus-search-documentation)


;;(setq yas/root-directory "~/.emacs.d/snippets")


;; (yas/load-directory yas/root-directory)
;; (yas/global-mode)

;; (add-hook 'c++-mode-hook 'yas/global-mode)




;;;;;;;;;;
;; Func ;;
;;;;;;;;;;

;; Noms de buffer uniques mais utiles (en lieu et place de "Makefile<2>"):
;;(if (require-faible 'uniquify)
;;    (custom-set-variables '(uniquify-buffer-name-style
;;                            'post-forward-angle-brackets)))

(defun cc-all ()
(interactive)
  (mark-whole-buffer)
(copy-region-as-kill(region-beginning) (region-end))
)

(defun do_insert_time ()
  (interactive)
  (insert-string (current-time-string)))

(defconst xemacs (string-match "XEmacs" emacs-version)
  "non-nil iff XEmacs, nil otherwise")

(defun c-switch-hh-cc ()		;; Usefull for edition
  (interactive)
  (let ((other
         (let ((file (buffer-file-name)))
           (if (string-match "\\.hh$" file)
               (replace-regexp-in-string "\\.hh$" ".cc" file)
             (replace-regexp-in-string "\\.cc$" ".hh" file)))))
    (find-file other)))

(defun insert-shell-shebang ()		;; Shell auto insertion
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (insert "#!/bin/sh\n\n")))

(defun insert-header-guard ()		;; Auto insertion in header file
  (interactive)
  (save-excursion
    (when (buffer-file-name)
          (goto-char (point-min))
        (let*
            ((name (file-name-nondirectory buffer-file-name))
             (macro (replace-regexp-in-string
                     "\\." "_"
                     (replace-regexp-in-string
                      "-" "_"
                      (upcase name)))))
          (insert "#ifndef " macro "_\n")
          (insert "# define " macro "_\n\n")
          (goto-char (point-max))
          (insert "\n#endif /* !" macro "_ */\n")))
    ))



;;;;;;;;;;;;;
;; Options ;;
;;;;;;;;;;;;;



(setq make-backup-files t
      inhibit-startup-message t			;; no startup message in xemacs
      frame-title-format "%b"			;; window title = buffer title
      normal-erase-is-backspace-mode 1
      ring-bell-function 'ignore		;; turn the alarm totally off
;;      browse-url-browser-function 'browse-url-generic
;;      browse-url-generic-program "/Documents and Settings/All Users/Start Menu/Programs/Mozilla Firefox/Mozilla Firefox"
)



     (define-key ac-complete-mode-map "\t" 'ac-complete)
     (define-key ac-complete-mode-map "\r" nil)


;;(when (display-graphic-p)			;; when use xemacs
  ;;(progn
   ;; (scroll-bar-mode nil)			;; no scroll bar
;;    (tool-bar-mode nil)				;; no tool bar
 ;;   (menu-bar-mode nil)				;; no menu bar
   ;; (mouse-wheel-mode t)))			;; enable mouse wheel

(setq sgml-mode-hook				;; Normal SGML mod
      '(lambda () "Defauts pour le mode SGML."
	 (auto-fill-mode)
	 (setq fill-column 80)))

(column-number-mode t)

;; Delete trailing whitespaces on save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
;;;;;;;;;;;;;;;;;
;; Auto Insert ;;
;;;;;;;;;;;;;;;;;

(add-hook 'find-file-hooks
	  (lambda ()
	    (when (and (memq major-mode '(c-mode c++-mode)) (equal (point-min) (point-max)) (string-match ".*\\.hh?" (buffer-file-name)))
	      (insert-header-guard)
	      (goto-line 14)
	      (newline)
	      (goto-line 14)
	      )))

(defun refresh-file ()
  (interactive)
  (revert-buffer t t t)
  (load-file "~/.emacs")
)


(defun maximize()
(interactive)
(w32-send-sys-command 61488)
)

(defun text-browse-local-host ()
  (interactive)
  (browse-url-emacs "http://127.0.0.1")
)
;;;;;;;;;;;;;;;
;; Variables ;;
;;;;;;;;;;;;;;;

;; (custom-set-faces
;;  '(highlight ((t (:weight bold))))
;; )

(custom-set-variables
 '(csv-separators ";")
 '(show-paren-mode t)			;; Match Parentheses
 '(transient-mark-mode t)
 '(global-hl-line-mode t)
 '(global-font-lock-mode t) ;; t ADSDASDALDFA"KDFAK:SD"AK:DK:ASDK:ASDKA"S
 '(menu-bar-mode nil)
 '(iswitchb-mode t)
 '(indent-tabs-mode nil)			;; Indent tab mod
)

;;(setq explicit-shell-file-name "zsh.exe")

(setq user-full-name "antoine marandon"
)
;;;;;;;;;;;;;;;;;;;;;;
;; Keyboard	    ;;
;;;;;;;;;;;;;;;;;;;;;;

(global-set-key [M-up] 'enlarge-window)				;; Resize windows in emacs with keyboard
(global-set-key [M-down] 'shrink-window)			;;
(global-set-key [M-right] 'enlarge-window-horizontally)		;;
(global-set-key [M-left] 'shrink-window-horizontally)		;;
(global-set-key (kbd "M-a") 'maximize)
(global-set-key [(control c) (control r)] 'query-replace)
(global-set-key [(control x) (control g)] 'goto-line)
(global-set-key [(control c) (control k)] 'text-browse-local-host)
(global-set-key [(control x) (control d)] 'find-file)
(global-set-key [(control c) (control h)] 'std-file-header)
(global-set-key [(control c) (control c)] 'comment-region)
(global-set-key [(control c) (=)] 'macro-math-eval-region)
(global-set-key [(control c) (~)] 'macro-math-eval-and-round-region)
(global-set-key [f5] 'refresh-file)
(global-set-key [f11] 'csv-backward-field)
(global-set-key [f12] 'csv-forward-field)
(global-set-key [S-right] 'other-window)
(global-set-key [S-down] 'other-window)
(global-set-key [S-left] 'previous-multiframe-window)
(global-set-key [S-up] 'previous-multiframe-window)
(global-set-key [f8] 'kill-this-buffer)
(global-set-key [(control c) (control a)] 'cc-all)
(global-set-key [(control x) (g)] 'switch-to-buffer)
(global-set-key [(control x) (r)] 'query-replace)
(global-set-key [(control c) (control g)] 'google)



;;;;;;;;;;;;;;;;;;
;; Other things ;;
;;;;;;;;;;;;;;;;;;

;; (require 'cc-mode)
;; (add-to-list 'c-style-alist
;;              '("epitech"
;;                (c-basic-offset . 2)
;;                (c-comment-only-line-offset . 0)
;;                (c-hanging-braces-alist     . ((substatement-open before after)))
;;                (c-argdecl-indent 0)
;;                (c-offsets-alist . ((topmost-intro        . 0)
;;                                    (substatement         . +)
;;                                    (substatement-open    . +)
;;                                    (case-label           . +)
;;                                    (access-label         . -)
;;                                    (inclass              . ++)
;;                                    (inline-open          . 0)))))

;; (setq c-default-style "epitech")
;; Redpist conf essai.
(autoload 'macro-math-eval-and-round-region "macro-math" t nil)
(autoload 'macro-math-eval-region "macro-math" t nil)



;;(setq explicit-shell-file-name "c:\Program Files\zsh.exe")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.





 '(after-save-hook (quote (executable-make-buffer-file-executable-if-script-p)))
 '(ido-auto-merge-work-directories-length -1)
 '(ido-confirm-unique-completion t)
 '(ido-create-new-buffer (quote always))
 '(ido-everywhere t)
 '(ido-ignore-buffers (quote ("\\`\\*breakpoints of.*\\*\\'" "\\`\\*stack frames of.*\\*\\'" "\\`\\*gud\\*\\'" "\\`\\*locals of.*\\*\\'" "\\` ")))
 '(ido-mode (quote both) nil (ido))
 '(require-final-newline t))

(normal-erase-is-backspace-mode 1)


;; TEEESST

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(defun to-bottom () (interactive)
  (goto-char (point-max))
  (recenter -1))
(defun set-key-to-bottom () (interactive)
  (local-set-key "\C-l" 'to-bottom)
  )
(add-hook 'shell-mode-hook 'set-key-to-bottom)



;;(jde-debugger "/Program\ Files/Java/jdk1.6.0_24/bin/jdb.exe"
;;(jde-debugger "jdb")


;; (global-auto-compete-mode t)

;;(setq-default gdb-many-windows t)

;; EOF
;; Set foregroung
(set-foreground-color "white")
;; Set emacs background colour
(set-background-color "black")
(menu-bar-mode 0)
