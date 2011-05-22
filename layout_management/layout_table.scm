(use-modules (gnome-2)
             (oop goops)
             (gnome gobject)
             (gnome gtk))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (layout-gtktable)
  (let ((window (make <gtk-window> #:type 'toplevel))
        (table (make <gtk-table> #:n-rows 4 #:n-columns 4 #:homogeneous #t))
        (values (list "7" "8" "9" "/"
                      "4" "5" "6" "*"
                      "1" "2" "3" "-"
                      "0" "." "=" "+"))
        )
    
    (set-title window "GtkTable")
    (set-default-size window 250 180)
    (set-position window 'center)
    (set-border-width window 5)

    (set-row-spacings table 2)
    (set-col-spacings table 2)

    (let ((n 0))
        (for-each (lambda (i)
                    (for-each (lambda (j)
                                (let ((button (make <gtk-button> #:label (list-ref values n))))
                                  (attach-defaults table button j (+ j 1) i (+ i 1)))
                                (set! n (+ n 1)))
                              (enumerate-interval 0 3)))
                  (enumerate-interval 0 3)))

    (add window table)

    (connect window 'destroy (lambda (x) (gtk-main-quit)))

    (show-all window)))

(layout-gtktable)
(gtk-main)

