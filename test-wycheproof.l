(load "@lib/json.l")
(load "isprime.l")
(mapc
   '((L)
      (let
         (N (hex (cdr (assoc "value" L)))
            R (cdr (assoc "result" L))
            I (isprime N) )
         (prin ".")
         (flush)
         (cond
            ((and (= R "invalid") (not I)))
            ((and (= R "valid") I))
            (T (quit "Boom!")) ) ) )
   (cddr (cadadr (assoc "testGroups" (in "primality_test.json" (readJson))))) )
(prinl)
(msg 'ok)
(bye)

