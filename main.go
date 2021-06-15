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
	"log"
	"net/http"
	"os"
	"time"

	"github.com/gorilla/mux"

	"github.com/defcronyke/kycaml"
)

func main() {
	k := kycaml.New()

	log.Printf("%v", k.InitMsg())

	host_default := "0.0.0.0"
	port_default := "8080"

	host := os.Getenv("HOST")
	if host == "" {
		host = host_default
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = port_default
	}

	addr := fmt.Sprintf("%v:%v", host, port)

	staticDir := "./static"

	r := mux.NewRouter()

	r.HandleFunc("/usa/names", k.NamesHandler)
	r.HandleFunc("/usa/sdn", k.USASdnJSONHandler)
	r.HandleFunc("/usa/cons", k.USAConsJSONHandler)
	r.HandleFunc("/usa/score", k.ScoreHandler)

	r.HandleFunc("/names", k.NamesHandler)
	r.HandleFunc("/sdn", k.USASdnJSONHandler)
	r.HandleFunc("/cons", k.USAConsJSONHandler)
	r.HandleFunc("/score", k.ScoreHandler)

	r.PathPrefix("/usa/").Handler(http.StripPrefix("/usa/", http.FileServer(http.Dir(staticDir))))
	r.PathPrefix("/").Handler(http.StripPrefix("/", http.FileServer(http.Dir(staticDir))))

	http.Handle("/", r)

	srv := &http.Server{
		Handler:      r,
		Addr:         addr,
		WriteTimeout: 300 * time.Second,
		ReadTimeout:  300 * time.Second,
	}

	log.Printf("KycAml server listening at: http://%v\n", addr)

	err := srv.ListenAndServe()

	if err != nil {
		log.Printf("error: %v", err)
	}
}
