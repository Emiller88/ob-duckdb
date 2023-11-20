;;; ob-duckdb.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 Edmund Miller
;;
;; Author: Edmund Miller <Edmund.A.Miller@gmail.com>
;; Maintainer: Edmund Miller <Edmund.A.Miller@gmail.com>
;; Created: November 20, 2023
;; Modified: November 20, 2023
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/emiller88/ob-duckdb
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:


(defun org-babel-execute:duckdb (body params)
  "Execute a block of Duckdb code with Babel."
  (let* ((cmd (or (cdr (assq :cmd params)) "duckdb"))
         (db (or (cdr (assq :db params)) ""))
         (query body))
    (with-temp-buffer
      (write-region query nil (expand-file-name "temp.sql"))
      (shell-command (concat cmd " \"" db "\" < temp.sql") t)
      (delete-file "temp.sql")
      (buffer-string))))

(defvar org-babel-default-header-args:duckdb '())

(defun org-babel-load-session:duckdb (session params)
  "Create DuckDB session.
If there is not a current inferior-process-buffer in SESSION
then create."
  (error "Sessions are not supported for DuckDB"))

(defun org-babel-prep-session:duckdb (session params)
  "Prepare SESSION according to the header arguments specified in PARAMS."
  (error "Sessions are not (yet) supported for DuckDB"))


(provide 'ob-duckdb)
;;; ob-duckdb.el ends here
