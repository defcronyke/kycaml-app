package main

import (
	"fmt"
	"os"

	"github.com/defcronyke/kycaml"
)

func main() {
	if len(os.Args) < 3 || len(os.Args) > 4 {
		fmt.Printf("Usage: %v \"<str1>\" \"<str2>\" [longTolerance=t|f]\n", os.Args[0])
		os.Exit(1)
		return
	}

	args := os.Args[1:]

	lTol := false

	if len(args) > 2 && (args[2] == "t" || args[2] == "y" || args[2] == "1") {
		lTol = true
	}

	fmt.Printf("%v\n", kycaml.NewJaroWinkler(args[0], args[1], lTol))
}
