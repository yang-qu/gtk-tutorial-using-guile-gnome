(use-modules (gnome-2)
             (oop goops)
             (gnome gobject)
             (gnome gtk))

(define (toolbar-demo)
  (let ((window (make <gtk-window> #:type 'toplevel))
        (vbox (make <gtk-vbox> #:homogeneous #f #:spacing 0))
        (toolbar (make <gtk-toolbar>))
        (new (make <gtk-tool-button> #:stock-id (gtk-stock-id 'new)))
        (open (make <gtk-tool-button> #:stock-id (gtk-stock-id 'open)))
        (save (make <gtk-tool-button> #:stock-id (gtk-stock-id 'save)))
        (sep (make <gtk-separator-tool-item>))
        (exit (make <gtk-tool-button> #:stock-id (gtk-stock-id 'quit)))
        )
    
    (set-title window "toolbar")
    (set-default-size window 250 200)
    (set-position window 'center)

    (add window vbox)

    (set-style toolbar 'icons)
    (set-border-width toolbar 2)

    (insert toolbar new -1)
    (insert toolbar open -1)
    (insert toolbar save -1)
    (insert toolbar sep -1)
    (insert toolbar exit -1)

    (pack-start vbox toolbar #f #f 5)

    (connect exit 'clicked (lambda (w) (gtk-main-quit)))
    (connect window 'destroy (lambda (w) (gtk-main-quit)))
    
    (show-all window)))

(toolbar-demo)
(gtk-main)
