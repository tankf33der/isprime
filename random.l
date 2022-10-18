# Generate long odd random N*8+1 bits
(de longOdd (N)
   (inc (>> -1 (in "/dev/urandom" (rd N)))) )
