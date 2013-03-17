;; foundation-cms.el --- configuration for emacs Foundation CMS toolkit

(eval-when-compile (require 'cl))

(defgroup foundation-cms nil
  "Settings for Foundation CMS toolkit functions."
  :prefix "fcms-"
  :group 'external)

(defcustom fcms-debug-output-enabled t
  "Controls whether `fcms-debug-message' speaks or is silent."
  :type boolean
  :group 'foundation-cms)

(defcustom fcms-debug-file "~/fcms-debug.log"
  "Target file for `fcms-debug-message' output."
  :type file
  :group 'foundation-cms)

(defcustom fcms-warnings-enabled t
  "Controls whether `fcms-warning-message' speaks or is silent."
  :type boolean
  :group 'foundation-cms)

(defcustom fcms-warnings-file "~/fcms-warnings.log"
  "Target file for `fcms-warning-message' output."
  :type file
  :group 'foundation-cms)


(defun fcms-chomp (str)
  "Remove trailing carriage returns and new lines from STR.

Like the Perl chomp command. If STR isn't a string or doesn't end with newline
characters, return STR. Otherwise, return a new string with the trailing
newline characters removed."
  (if (and (stringp str)
           (string-match "[\r\n]+$" str))
      (replace-match "" t nil str)
    str))

(defun* fcms-debug-message (message &rest interpolations)
  "Format MESSAGE with the arguments in INTERPOLATIONS and output to file.

Use this freely since it's a no-op most of the time. Assumes that you're on a
machine with GNU `date' installed - on a Mac, this usually means `gdate'."
  (when fcms-debug-mode
    (let ((message-string
           (concat (fcms-chomp
                    (shell-command-to-string "gdate +'%a %b %d %R %Y %Z: '"))
                   message "\n")))
      (append-to-file
       (apply #'format message-string interpolations)
       nil fcms-debug-file))))

(defun* fcms-warning-message (message &rest interpolations)
  "Format MESSAGE with the arguments in INTERPOLATIONS and output to file.

Use this sparingly so that warnings stay relevant. Assumes that you're on a
machine with GNU `date' installed - on a Mac, this usually means `gdate'."
  (when fcms-debug-mode
    (let ((message-string
           (concat (fcms-chomp
                    (shell-command-to-string "gdate +'%a %b %d %R %Y %Z: '"))
                   message "\n")))
      (append-to-file
       (apply #'format message-string interpolations)
       nil fcms-warnings-file))))

(provide 'foundation-cms)
