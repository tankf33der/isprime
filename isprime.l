# Generate long random number in 2:N-1
(de longRand (N)
   (max
      2
      (% (in "/dev/urandom" (rd (size N))) N) ) )
(de **Mod (X Y N)
   (let M 1
      (loop
         (when (bit? 1 Y)
            (setq M (% (* M X) N)) )
         (T (=0 (setq Y (>> 1 Y))) M)
         (setq X (% (* X X) N)) ) ) )
(de _Fermat (N F)
   (if F
      (do 8
         (NIL (=1 (**Mod (longRand (dec N)) (dec N) N)))
         T )
      T ) )
(de _MillerRabin (N)
   (let (Q (dec N)  N1 (dec N)  K 0  X)
      (until (bit? 1 Q)
         (setq Q (>> 1 Q)  K (inc K)) )
      (do 8
         (setq X
            (**Mod (longRand N1) Q N) )
         (NIL
            (or
               (=1 X)
               (= X N1)
               (do K
                  (setq X (**Mod X 2 N))
                  (T (= X N1) T) ) ) )
         T ) ) )
# usage:
# N - number to test
# F - should i run Fermat test too? (crypto hard check)
(de isprime (N F)
   (or
      (== N 2)
      (and
         (> N 1)
         (bit? 1 N)
         (_Fermat N F)
         (_MillerRabin N) ) ) )
