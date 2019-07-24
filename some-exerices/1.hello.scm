; The first program use scheme
; begin introducing a sequence of subforms. in this case there are to subforms
; to run this program 
; (begin
;     (display "hello world!")
;     (newline)
; )
; (define v "hello world")

; (define sum3
;     (lambda (a b c) 
;      (+ a b c)   
;     )  
; )
;将参数加1的函数。
; (define (addOne a)
;     (+ a 1)
; )
; 将参数减1的函数。
; (define (minusOne a)
;     (- a 1)
; )

; 编写一个将角的单位由度转换为弧度的函数。180度即π弧度。
; π可以通过下面的式子定义： (define pi (* 4 (atan 1.0)))。
; (define pi (* 4 (atan 1.0)))
; (define (angleToRadio a)
;     (/ (* a pi) 180)
; )
; 编写一个用于计算按照一个常量速度（水平分速度）运动的物体，t秒内的位移的函数。
; (define (distance v t)
;     (* v t)
; )

; 编写一个用于计算物体落地前的飞行时间的函数，参数是垂直分速度。
; 忽略空气阻力并取重力加速度g为9.8m/s^2。提示：设落地时瞬时竖直分速度为-Vy，
; 有如下关系。2 * Vy = g * t此处t为落地时的时间。

; (define (time v)
;     (/ (* 2 v) 9.8)
; )
; 返回一个实数绝对值的函数。
; (define (abs a)
;     (if (positive? a) a (* -1 a))
; )
; (define (abs2 a)
;  (* n
;     (if (positive? a) 1 -1)
; )

; 返回一个实数的倒数的函数。如果参数为0，则返回#f。
; (define (reci a)
;     (if (a = 0) #f (/ 1 a))
; )

; (define (inv n)
;   (if (not (zero? n))
;       (/ n)
;       #f))
; 将一个整数转化为ASCII码字符的函数。只有在33~126之间的ASCII码才能转换为可见的字符。
; 使用integer->char可以将整数转化为字符。如果给定的整数不能够转化为字符，那么就返回#f。
; (define (i2a n)
;   (if (<= 33 n 126)
;       (integer->char n)
;       #f))


; 一个接受三个实数作为参数的函数，若参数皆为正数则返回它们的乘积。
; (define (pro3and a b c)
;   (and (positive? a)
;        (positive? b)
;        (positive? c)
;        (* a b c)))

; 一个接受三个实数作为参数的函数，若参数至少一个为负数则返回它们的乘积。
; (define (pro3or a b c)
;     (if 
;         (or (negative? a)
;             (negative? b)
;             (negative? c)
;         )
;         (* a b c)
;     )
; )

; 编写下列函数。

; 成绩（A-D）是由分数决定的。编写一个将分数映射为成绩的函数，映射规则如下：

; A 如果 score ≥ 80
; B 如果 60 ≤ score ≤ 79
; C 如果 40 ≤ score ≤ 59
; D 如果 score < 40

; (define (score a)
;     ((cond ( (>= a 80) 'A)
;         ((<= 60 a 79) "B")
;         ((<= 40 a <= 59) "C")
;         (else "D")
; )

(define (list*2 ls)
  (if (null? ls)
      '()
      (cons (* 2 (car ls)) (list*2 (cdr ls)))))

; 用递归编写下面的函数。
; 用于统计表中元素个数的my-length函数。（length是一个预定义函数）。
; 一个求和表中元素的函数。

(define (my-length ls)
    (if (null? ls)
        0
        (+ 1 (my-length (cdr ls)))))

(define (sum-list ls)
    (if (null? ls)
        0
        (+ (car ls) (sum-list (cdr ls)))))

; 一个分别接受一个表ls和一个对象x的函数，该函数返回从ls中删除x后得到的表。
(define (del x ls)
    (if (equal? (car ls) x)
       (cdr ls)
       (cons (car ls) (del x (cdr ls)))))

(define delete
    (lambda (item list)
        (cond
        ((equal? item (car list)) (cdr list))
        (else (cons (car list) (delete item (cdr list)))))))

(define (remove x ls)
  (if (null? ls)
      '()
      (let ((h (car ls)))
        ((if (eqv? x h)
            (lambda (y) y)
            (lambda (y) (cons h y)))
         (remove x (cdr ls))))))

(define (rm x ls)
         (if (null? ls)
             '()
             (if (eqv? x (car ls))
                 (rm x (cdr ls))
                 (cons (car ls)
                       (rm x (cdr ls))))))

; 一个分别接受一个表ls和一个对象x的函数，该函数返回x在ls中首次出现的位置。
; 索引从0开始。如果x不在ls中，函数返回#f。
(define (indexOf ls x)

)

(define (indexOf-iter ls x n)
    ((cond 
        ((null? ls) #f)
        ((equal? (car ls) x) n)
        (else indexOf-iter (cdr ls) x (+ 1 n)))))
;好像没啥用
; (define (p) (p))
; (define (test x y)
;     (if (= x 0)
;         0
;         y))

; (define (average x y)
;     (/ (+ x y) 2))

; (define (improve guess x)
;     (average guess (/ x guess)))

; (define (good-enough? guess x)
;     (< (abs (- (square guess) x)) 0.001))

; (define (sqrt-iter guess x)
;     (new-if (good-enough? guess x)
;         guess
;         (sqrt-iter (improve guess x)
;                     x))) 
; (define (sqrt x)
;     (sqrt-iter 1.0 x))

; (define (new-if p then-clause else-clause)
;     (cond (p then-clause)
;           (else else-clause)))

; 用尾递归编写下面的函数

; 用于翻转表元素顺序的my-reverse函数。（reverse函数是预定义函数）
; 求和由数构成的表。
; 将一个代表正整数的字符串转化为对应整数。例如，"1232"会被转化为1232。
; 不需要检查不合法的输入。提示，字符到整数的转化是通过将字符#\0……#\9的ASCII减去48，
; 可以使用函数char->integer来获得字符的ASCII码。函数string->list可以将字符串转化为由字符构成的表。

(define (sum list)
    (sum-iter(list 0)))

(define (sum-iter list res)
    (if (null? list))
        res
        (sum-iter (cdr list) (+ res (car list))))

; (define (s2i-iter l res)
;     (if (null? l))
;         res
;         (s2i-iter ((cdr l) (cons res (c2i (car l)))))
; )
; (define (c2i s)
;     ((- (char -> interger (s) 48)))
; )

; (define (s2i s)
;     ((let (l (string-list s)))
;         (s2i-iter l `()))
; )

; 用命令let loop 重写
; 一个分别接受一个表ls和一个对象x的函数，该函数返回从ls中删除x后得到的表。

; (define (remove x ls)
;   (let loop((ls0 ls) (ls1 ()))
;     (if (null? ls0) 
;     (reverse ls1)
;     (loop
;      (cdr ls0)
;           (if (eqv? x (car ls0))
;               ls1
;             (cons (car ls0) ls1))))))

; 一个分别接受一个表ls和一个对象x的函数，该函数返回x在ls中首次出现的位置。索引从0开始。如果x不在ls中，函数返回#f
; (define (letIndex ls x)
;     (let loop ((ls0 ls) (index 0)))
;     (if (null? ls0))
;        (#f)
;        (if(eqv? x (car ls0)))
;             (index)
;             (loop 
;                 (cdr ls)
;                 (+ index 1)))

(define (position x ls)
  (let loop((ls0 ls) (i 0))
    (cond
     ((null? ls0) #f)
     ((eqv? x (car ls0)) i)
     (else (loop (cdr ls0) (1+ i))))))
; 用于翻转表元素顺序的my-reverse函数。（reverse函数是预定义函数
(define (reverse ls)
  (let loop((ls0 ls)(res '()))
        (if(null? ls0))
           res
           (loop (cdr ls0) (cons (car ls0) res))))

; 求和由数构成的表。
(define (sum ls)
    (let loop((ls0 ls) (res 0))
        (if(null? ls0))
          res
          (loop (cdr ls0) (+ res (car ls0)))
    )
)
; 将一个代表正整数的字符串转化为对应整数。例如，"1232"会被转化为1232。不需要检查不合法的输入。
; 提示，字符到整数的转化是通过将字符#\0……#\9的ASCII减去48，可以使用函数char->integer来获得字符的ASCII码。
; 函数string->list可以将字符串转化为由字符构成的表。
(define (sr string)
   (let ((ls (string->list string)))
        (let loop ((ls0 ls) (n 0))
         (if (null? ls0))
            n
            (loop (cdr ls0) (+ (* 10 n) (car ls0)))
            
   )
)

; range函数：返回一个从0到n的表（但不包含n）。
(define (range n)
    (let loop((m 0) (res '()))
        if (= m n)
            (reverse res)
            (loop (+ m 1) (cons m res))
    ))

;用letrec 来重写
; 用于翻转表元素顺序的my-reverse函数。（reverse函数是预定义函数
; 求和由数构成的表。
; sting to int

(define (my-reverse-letrec ls)
  (letrec ((iter (lambda (ls0 ls1)
           (if (null? ls0)
               ls1
               (iter (cdr ls0) (cons (car ls0) ls1))))))
    (iter ls ())))

(define (reverse ls)
    (letrec ((iter (lambda (ls0 res))))
        (if(null? ls0))
            res
            (iter (cdr ls0) (cons (car ls0) res))
    )
    (iter (ls) ())
)
(define (sum ls)
    (letrec ((iter (lambda (ls0 res)))
        (if (null? ls0))
            res
            (iter (cdr ls0) (+ res (car ls0)))
    )
    (iter ls 0)))
)

(define (s2i s)
    (letrec ((iter (lambda (ls0 res)
        (if (null? ls0))
            res
            (iter (cdr ls0) (+ (char->integer(car ls0)) (* 10 res))))))

    iter(string->list ls 0)))

; 用do 来重写
; 用于翻转表元素顺序的my-reverse函数。（reverse函数是预定义函数
; 求和由数构成的表。
; sting to int

(define (reverse ls)
    (do ((ls0 ls (cdr ls) (res '() (cons (car ls0) res))))
        (if (null? ls0))
            res
    )
)

(define (double ls)
    (map (lambda (x) (* 2 x) ls))
)

(define (minus ls1 ls2)
    (map - ls1 ls2)
)

(define (filteringOut ls)
    (keep-matching-items ls even? ))

(define (filteringOut ls)
    (delete-matching-items ls 
        (lambda (x) (< 10 x 100))))

(define (sqrtSum ls)
    (sqrt (reduce + 0 (map (lambda (x) (* x x)  ls)))
)

; (sort ls (lambda (x y) (> sin(x) sin(y))))

(define (len ls)
   (if null? ls)
        0
        (+ 1 len(cdr(ls)))
)

(define (length ls)
   (let loop((ls0 ls) (res 0))
        if (null? ls0)
            res
            (loop(cdr ls0) (+ res 1))
   ))

; (sort ls (lambda (x y) (< (length x) (length y)))))

(define (sqrtSum ls)
    (sqrt (apply + 0 (apply (lambda (x) (* x x) ls)))
)

(define (member-if proc ls)
  (cond
   ((null? ls) #f)
   ((proc (car ls)) ls)
   (else (member-if proc (cdr ls)))))

; (member-if positive? '(0 -1 -2 3 5 -7))
;自己实现keep-matching-items
(define (filteringOut ls)
    (keep-matching-items even? ls))

; (define (filter ls proc)
;     (if (proc car ls)
;         c)
; )
