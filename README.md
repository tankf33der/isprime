Wikipedia article for Miller-Rabin primality [test](https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test#Variants_for_finding_factors) has a pseudocode:
```
Input #1: n > 3, an odd integer to be tested for primality
Input #2: k, the number of rounds of testing to perform
Output: “composite” if n is found to be composite, “probably prime” otherwise

write n as 2^r*d + 1 with d odd (by factoring out powers of 2 from n − 1)
WitnessLoop: repeat k times:
   pick a random integer a in the range [2, n − 2]
   x ← a^d mod n
   if x = 1 or x = n − 1 then
      continue WitnessLoop
   repeat r − 1 times:
      x ← x^2 mod n
      if x = n − 1 then
         continue WitnessLoop
   return “composite”
return “probably prime”
```
Purpose of this repo is to test my implementation.

Have fun.
