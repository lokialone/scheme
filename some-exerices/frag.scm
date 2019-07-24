(define (read-file file-name)
  (let ((p (open-input-file file-name)))
    (let loop((ls1 '()) (c (read-char p)))
      (if (eof-object? c)
      (begin
        (close-input-port p)
        (list->string (reverse ls1)))
      (loop (cons c ls1) (read-char p))))))

(define (s-read file-name)
    (with-input-from-file file-name
        (lambda ()
          (let loop ((ls1 '()) (s (read)))
        (if (eof-object? s)
            (reverse ls1)
            (loop (cons s ls1) (read)))))))

(define (read-lines file-name)
    (with-input-from-file file-name
        (lambda ()
            (let loop ((ls1 '()) ((ls2 '()) (s read-char )))
                ((if eof-object?) ls1)
                    ((if (equal? #\Linefeed c) 
                       (loop ((cons ls1 c) ('()) (s read-char) ))
                       (loop ((ls1) (cons ls2 c) (s read-char)))))))))


; 自己实现 filter 高阶函数

; (define (filter proc ls)
;     (let loop ((ls1 '() (res '()))
;         (cond
;           (if (null? ls) res)
;           (if (proc (car ls))
;             (loop (cdr ls) (cons (car ls) res)))
;           (else
;             (loop (cdr ls) res))
;           )
;     ))
; )

(define (my-map fun . lss)
  (letrec ((iter (lambda (fun lss)
               (if (null? lss)
               '()
               (cons (fun (car lss))
                 (iter fun (cdr lss))))))
       (map-rec (lambda (fun lss)
              (if (memq '() lss)
              '()
              (cons (apply fun (iter car lss))
                (map-rec fun (iter cdr lss)))))))
    (map-rec fun lss)))
(my-map + '(1 2 3) '(10 20 30) '(100 200 300))
;⇒ (111 222 333)

; 练习2
; 编写函数(my-copy-file)实现文件的拷贝。
; 练习3
; 编写函数(print-line)，该函数具有任意多的字符作为参数，并将它们输出至标准输出。输出的字符应该用新行分隔。

(define (my-copy-file read-file write-file)
    (let ((w open-output-file write-file) (r open-input-file read-file))
        (let loop((c (read-char r))
            (if eof-object? c)
              (begin
                (close-input-port r)
                (close-output-port w))
              (begin
                (write-char c w)
                (loop (read-char r)))
        ))
)
;自己实现一个map

(define (map procedure list1 list2)
    (let loop((ls0 list1)))
)

(define (print-line . lss)
  (if pair? lss)
      (begin 
        (display (car lss))
         (newline )
         (print-line (cdr lss))
      )
)
  

; 练习 1
; 修改make-bank-account函数，使得如果取款超过余额则报错。提示：
; 如果你的代码体中有多条 S-表达式，那么可以使用 begin 语句让它们成组。
(define (make-bank-account balance)
  (lambda (n)
      (let((m  (+ balance n ))))
          (if (negative? m))
             ('error)
             (begin
                (set! balance m)
                ( balance )
             )))

(define (make-queue)
    (cons '() '()))
           
(define (enqueue! queue obj)
  (let ((lobj (cons obj '())))
    (if (null? (car queue))
    (begin
      (set-car! queue lobj)
      (set-cdr! queue lobj))
    (begin
      (set-cdr! (cdr queue) lobj)
      (set-cdr! queue lobj)))
    (car queue)))

(define (dequeue! queue)
  (let ((obj (car (car queue))))
    (set-car! queue (cdr (car queue)))
    obj))
(define q (make-queue))
;Value: q

(enqueue! q 'a)
;Value 12: (a)


; ;Value 12: (a b)

; (enqueue! q 'c)
; ;Value 12: (a b c)

; (dequeue! q)
; ;Value: a
; ; q
; ;Value 13: ((b c) c)