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

	resDM := kycaml.NewDoubleMetaphone(args...)

	res, err := kycaml.DoubleMetaphoneToString(resDM)
	if err != nil {
		fmt.Printf("error converting double metaphone to string: %v", err)
		os.Exit(3)
		return
	}

	resBytes, err := json.Marshal(res)
	if err != nil {
		fmt.Printf("error marshaling json from res: %v", err)
		os.Exit(4)
		return
	}

	fmt.Printf("%s\n", resBytes)
}
