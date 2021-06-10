package main

import (
	"fmt"
	"os"

	"github.com/defcronyke/kycaml"
)

func main() {
	if len(os.Args) != 3 {
		fmt.Printf("Usage: %v \"<str1>\" \"<str2>\"\n", os.Args[0])
		os.Exit(1)
		return
	}

	args := os.Args[1:]

	fmt.Printf("%v\n", kycaml.NewSmithWaterman(args[0], args[1]))
}
