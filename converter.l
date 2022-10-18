# input infix factordb-prp
# output formula calculated prime number
(load "infix.l")
(de number ()
   (format
      (make
         (link (char))
         (while (num? (format (peek)))
            (link (char)) ) ) ) )
(in (opt)
   (until (eof)
      (let
         (Lst
            (make
               (until (eol)
                  (if (num? (format (peek)))
                     (link (number))
                     (link (char)) ) )
               (line) )
            N (calc Lst) )
         (println N) ) ) )
(msg 'ok)
(bye)
