(use-modules (gnome-2)
             (oop goops)
             (gnome gobject)
             (gnome gtk))

(define (layout-gtkfixed)
  (let ((window (make <gtk-window> #:type 'toplevel))
        (fixed (make <gtk-fixed>))
        (button1 (make <gtk-button> #:label "Button1"))
        (button2 (make <gtk-button> #:label "Button2"))
        (button3 (make <gtk-button> #:label "Button3"))
        )

    (add window fixed)
    
    (set-title window "GtkFixed")
    (set-default-size window 290 200)
    (set-position window 'center)

    (put fixed button1 150 50)
    (set-size-request button1 80 35)

    (put fixed button2 15 15)
    (set-size-request button2 80 35)

    (put fixed button3 100 100)
    (set-size-request button3 80 35)

    (connect window 'destroy (lambda (x) (gtk-main-quit)))

    (show-all window)))

(layout-gtkfixed)
(gtk-main)

