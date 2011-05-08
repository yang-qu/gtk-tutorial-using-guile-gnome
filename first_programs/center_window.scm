(use-modules (gnome-2)
             (oop goops)
             (gnome gobject)
             (gnome gtk))

(define (centering-window)
  (let* ((window (make <gtk-window> #:type 'toplevel)))

    (set-title window "Center")
    (set-default-size window 230 150)
    (set-position window 'center)

    (connect window 'destroy (lambda (w) (gtk-main-quit)))
    
    (show-all window)))

(centering-window)
(gtk-main)
