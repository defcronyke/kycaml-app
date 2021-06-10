package main

import (
	"encoding/json"
	"fmt"
	"os"

	"github.com/defcronyke/kycaml"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Printf("Usage: %v <input_string>\n", os.Args[0])
		os.Exit(1)
		return
	}

	args := os.Args[1:]

	res := kycaml.NewDoubleMetaphone(args...)

	resBytes, err := json.Marshal(res)
	if err != nil {
		fmt.Printf("error marshaling json from res: %v", err)
		os.Exit(3)
		return
	}

	fmt.Printf("%s\n", resBytes)
}
