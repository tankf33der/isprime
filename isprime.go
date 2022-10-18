// go build -o isprime isprime.go
package main

import (
	"bufio"
	"fmt"
	"math/big"
	"os"
)

func main() {
	a := new(big.Int)
	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		a.SetString(scanner.Text(), 10)
		fmt.Println(a)
		if a.ProbablyPrime(8) {
			fmt.Println("T")
		} else {
			fmt.Println("NIL")
		}

	}
}
