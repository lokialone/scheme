; write some self define macro

; Write a macro in that several expressions are evaluated
; when the predicate is false. (it is the opposite of the when.)

(define-syntax when
    (syntax-rules ()
      ((_ pred b1 ...)
       (if pred (begin b1 ...)))))

(define-syntax not-when
    (syntax-rules ()
    ((_ pred b1 ...)
    (if (not pred) (begin b1 ...)))))

(define-syntax while
    (syntax-rules ()
        ((_ pred b1 ...)
        (let loop () (when pred b1 ... (loop))))))

(define-syntax for
    (syntax-rules ()
        ((_ (i from to) b1 ...)
        (let loop((i from))
            (when (< i to)
        b1 ...
        (loop (1+ i)))))))

(define-syntax incf
    (syntax-rules ()
        ((_ x) (begin (set! x (+ x 1)) x))
        ((_ x i) (begin (set! x (+ x i)) x))))

(define-syntax decf
    (syntax-rules ()
    ((_ x) (begin (set! x (- x 1) x))
    ((_ x i)(begin (set! x (+ x i)) x))))

(define-syntax my-and
    (syntax-rules ()
        ((_) #t)
        ((_ e) e)
        ((_ e1 e2 ...)
        (if e1
        (my-and e2 ...)
        #f))))
      
(define-syntax my-or
    (syntax-rules ()
        ((_) #f)
        ((_ e) e)
        ((_ e1 e2 ...)
        (let ((t e1))
            (if t t (my-or e2 ...))))))

; Define let* by yourself.
(define-syntax my-let*
    (syntax-rules ()
      ((_ ((p v)) b ...)
       (let ((p v)) b ...))
      ((_ ((p1 v1) (p2 v2) ...) b ...)
       (let ((p1 v1))
         (my-let* ((p2 v2) ...)
          b ...)))))
