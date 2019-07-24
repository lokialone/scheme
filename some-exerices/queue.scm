; try to write a queue
(define (make-queue)
    (cons '() '()))
;  入队
(define (enqueue! queue obj)
    (let ((lobj (cons obj '())))
    (if (null? (car queue))
    (begin
        (set-car! queue lobj)
        (set-cdr! queue lobj))
    (begin
        (set-cdr! (cdr queue) lobj)
        ; (set-cdr! (car queue) lobj)
        (set-cdr! queue lobj)))
    (car queue)))
; 出队
(define (dequeue! queue)
    (let ((obj (car (car queue))))
    (set-car! queue (cdr (car queue)))
    obj))

    (define q (make-queue))
    ;Value: q
    
    (enqueue! q 'a)
    (enqueue! q 'b)
    ; (dequeue! q)

; Write a function (title-style) that capitalizes the first character of words.
(define (identity x) x)

(define (title-style parameters)
    (let (ls (string->list parameters)
        (let loop ((ls0 ls) (w #t) (acc '())))
            (if (null? ls0))
                (list->string (reverse acc))
                (let ((c car ls0))
                    (loop (cdr ls0)
                     (if(char-whitespace? c)
                     (cons ((if w char-upcase identity) c) acc))
                    )
                )
    ))
)

    