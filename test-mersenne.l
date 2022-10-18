(load "isprime.l")
(println
   (isprime
      (format
         (make
            (in '(bzcat M9941.txt.bz2)
               (while (link (line T))) ) ) ) ) )
(msg 'ok)
(bye)
