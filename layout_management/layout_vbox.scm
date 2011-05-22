(use-modules (gnome-2)
             (oop goops)
             (gnome gobject)
             (gnome gtk))

(define (layout-gtkvbox)
  (let ((window (make <gtk-window> #:type 'toplevel))
        (settings (make <gtk-button> #:label "Settings"))
        (accounts (make <gtk-button> #:label "Accounts"))
        (loans (make <gtk-button> #:label "Loans"))
        (debts (make <gtk-button> #:label "Debts"))
        (vbox (make <gtk-vbox> #:homogeneous #t #:spacing 1))
        )
    
    (set-title window "GtkVBox")
    (set-default-size window 230 250)
    (set-position window 'center)
    (set-border-width window 5)

    (add window vbox)

    (pack-start vbox settings #t #t 0)
    (pack-start vbox accounts #t #t 0)
    (pack-start vbox loans #t #t 0)
    (pack-start vbox debts #t #t 0)

    (connect window 'destroy (lambda (x) (gtk-main-quit)))

    (show-all window)))

(layout-gtkvbox)
(gtk-main)

