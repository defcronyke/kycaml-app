package main

import (
	"fmt"
	"os"

	"github.com/defcronyke/kycaml"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Printf("Usage: %v <str1>\n", os.Args[0])
		os.Exit(1)
		return
	}

	args := os.Args[1:]

	res, err := kycaml.NewNYSIIS(args...)
	if err != nil {
		fmt.Printf("error: %v", err)
		os.Exit(2)
		return
	}

	fmt.Printf("%v\n", res)
}
