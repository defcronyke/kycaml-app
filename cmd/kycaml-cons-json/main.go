package main

import (
	"fmt"
	"os"

	"github.com/defcronyke/kycaml"
)

func main() {
	res, err := kycaml.NewJSONSanctionsCA(fmt.Sprintf("%v/../../static/%v", os.Getenv("PWD"), "cons.xml"))
	if err != nil {
		fmt.Printf("error: %v\n", err)
		return
	}

	fmt.Printf("%s\n", res)
}
