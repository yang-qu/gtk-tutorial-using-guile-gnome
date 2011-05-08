;;; A simple gtk window
;;; guile -s simple.scm
(use-modules (gnome-2)
             (oop goops)
             (gnome gobject)
             (gnome gtk))

(define (simple-window)
  (let ((window (make <gtk-window> #:type 'toplevel)))
    (show-all window)))

(simple-window)
(gtk-main)
