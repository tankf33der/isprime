# Calculate value(s) based on stack top Operand
# Modifies both V and O
(de 1op ()
   (case (cdar O)
      ("\^"
         (let N (++ V)
            (push 'V (** (++ V) N)) ) )
      (T
         (let N (++ V)
            (push 'V ((intern @) (++ V) N)) ) ) )
   (++ O) )
(de consOp (Op)
   (case Op
      (("+" "-") (cons 1 Op))
      (("*" "/" "%") (cons 2 Op))
      (("\^") (cons 3 Op)) ) )
(de calc (Lst)
   (let (O NIL  V NIL)
      (for I Lst
         (cond
            ((num? I) (push 'V I))
            ((= "(" I) (push 'O (cons 0 T)))
            ((= ")" I)
               (while (gt0 (caar O)) (1op))
               (++ O) )
            (T
               (let CurrOp (consOp I)
                  (while (and O (>= (caar O) (car CurrOp)))
                     (1op) )
                  (push 'O CurrOp) ) ) ) )
      (while O (1op))
      ~(assert (not O))
      ~(assert (not (cadr V)))
      (car V) ) )
