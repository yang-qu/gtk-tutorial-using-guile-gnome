(use-modules (gnome-2)
             (oop goops)
             (gnome gobject)
             (gnome gtk))

(define (inc-dec)
  (let ((window (make <gtk-window> #:type 'toplevel))
         (frame (make <gtk-fixed>))
         (plus (make <gtk-button> #:label "+"))
         (minus (make <gtk-button> #:label "-"))
         (label (make <gtk-label> #:label "0"))
         (count 1))

    (add window frame)

    (set-size-request plus 80 35)
    (put frame plus 50 20)
    
    (set-size-request minus 80 35)
    (put frame minus 50 80)

    (put frame label 190 58)

    (set-title window "+-")
    (set-default-size window 230 150)
    (set-position window 'center)

    (connect window 'destroy (lambda (w) (gtk-main-quit)))
    (connect plus 'clicked (lambda (x)
                             (set! count (+ count 1))
                             (set-text label (number->string count))))
    (connect minus 'clicked (lambda (x)
                              (set! count (- count 1))
                              (set-text label (number->string count))))
    
    (show-all window)))

(inc-dec)
(gtk-main)
