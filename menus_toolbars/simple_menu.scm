(use-modules (gnome-2)
             (oop goops)
             (gnome gobject)
             (gnome gtk))

(define (simple-menu)
  (let ((window (make <gtk-window> #:type 'toplevel))
        (vbox (make <gtk-vbox> #:homogeneous #f #:spacing 0))
        (menubar (make <gtk-menu-bar>))
        (filemenu (make <gtk-menu>))
        (file (make <gtk-menu-item> #:label "File"))
        (quit (make <gtk-menu-item> #:label "Quit")))

    (set-title window "menu")
    (set-default-size window 240 200)
    (set-position window 'center)

    (add window vbox)
    
    (set-submenu file filemenu)
    (append filemenu quit)
    (append menubar file)
    (pack-start vbox menubar #f #f 3)

    (connect window 'destroy (lambda (w) (gtk-main-quit)))
    (connect quit 'activate (lambda (w) (gtk-main-quit)))
    
    (show-all window)))

(simple-menu)
(gtk-main)
