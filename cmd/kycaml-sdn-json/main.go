package main

import (
	"fmt"
	"os"

	"github.com/defcronyke/kycaml"
)

func main() {
	res, err := kycaml.NewJSONSanctionsSA(fmt.Sprintf("%v/../../static/%v", os.Getenv("PWD"), "sdn.xml"))
	if err != nil {
		fmt.Printf("error: %v\n", err)
		return
	}

	fmt.Printf("%s\n", res)
}
