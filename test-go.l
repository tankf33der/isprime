(seed (in "/dev/urandom" (rd 8)))
(load "isprime.l")
(load "random.l")
(de test1 (S N1)
   (let (N (read)  X (eval (list S N1)))
      (unless (= N X)
         (prinl "^J" N ": (" S " " N1 ") -> " X)
         (bye) ) ) )
(pipe
   (out '("./isprime")
      (do 10000
         (setq N (longOdd (rand 1 64)))
         (prinl N)
         (at (0 . 1000) (wait 50)) ) )
   (do 10
      (do 1000
         (setq N (read))
         (test1 'isprime N) )
      (prin ".")
      (flush) )
   (prinl) )
(msg 'OK)
(bye)
