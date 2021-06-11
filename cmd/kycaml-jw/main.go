package main

/* Copyright (C) 2021  Jeremy Carter <jeremy@jeremycarter.ca>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

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
