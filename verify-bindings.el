;; Verify each keybinding actually resolves to the expected command in Emacs 29.3.
;; Prints KEY -> COMMAND so the guide can only contain real, live bindings.
(require 'seq)
(let ((pairs '(
        ;; motion
        ("C-f" ) ("C-b" ) ("C-n" ) ("C-p" ) ("C-a" ) ("C-e" )
        ("M-f" ) ("M-b" ) ("M-a" ) ("M-e" ) ("M-<" ) ("M->" )
        ("C-v" ) ("M-v" ) ("C-l" ) ("M-g g")("M-m")
        ;; editing / kill
        ("C-d" ) ("M-d" ) ("C-k" ) ("M-k" ) ("C-w" ) ("M-w" ) ("C-y" ) ("M-y" )
        ("C-SPC") ("C-x C-x") ("C-/" ) ("C-_" ) ("C-x u")
        ("M-t") ("C-t") ("C-x C-t")
        ("M-u") ("M-l") ("M-c")
        ;; files / buffers
        ("C-x C-f") ("C-x C-s") ("C-x s") ("C-x C-w") ("C-x C-v")
        ("C-x b") ("C-x C-b") ("C-x k") ("C-x C-c") ("C-z")
        ;; windows
        ("C-x 0") ("C-x 1") ("C-x 2") ("C-x 3") ("C-x o")
        ;; search
        ("C-s") ("C-r") ("C-M-s") ("M-%")
        ;; help
        ("C-h k") ("C-h f") ("C-h a") ("C-h m") ("C-h t") ("C-h b")
        ;; misc
        ("C-g") ("M-x") ("C-q") ("C-x (") ("C-x )") ("C-x e")
        ("M-;") ("C-x r k") ("C-x r y") ("C-x h")
        )))
  (dolist (p pairs)
    (let* ((k (car p))
           (cmd (ignore-errors (key-binding (kbd k)))))
      (princ (format "%-10s -> %s\n" k (if cmd cmd "UNBOUND"))))))
