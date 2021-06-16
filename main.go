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

	/** USA Sanctions-based Routes (Default) */

	/** HTTP Route: GET /usa/names
	Get the names of sanctioned entities.
	(USA Sanctions-based) */
	r.HandleFunc("/usa/names", k.NamesHandler)

	/** HTTP Route: GET /usa/names-dm
	Get the names of sanctioned entities, with a
	double-metaphone encoded lookup key.
	(USA Sanctions-based) */
	r.HandleFunc("/usa/names-dm", k.NamesDMHandler)

	/** HTTP Route: GET /usa/names-db
	Get the names of sanctioned entities, with a
	combination of all supported encodings of lookup
	keys. (USA Sanctions-based) */
	r.HandleFunc("/usa/names-db", k.NamesDBHandler)

	/** HTTP Route: GET /usa/sdn
	Get the USA's Specially Designated Nationals
	And Blocked Persons list data, in a custom
	unofficial JSON format.
	Built from the official XML list found here:
	https://home.treasury.gov/policy-issues/financial-sanctions/specially-designated-nationals-list-data-formats-data-schemas
	-> SDN_ADVANCED.XML
	(USA Sanctions-based) */
	r.HandleFunc("/usa/sdn", k.USASdnJSONHandler)

	/** HTTP Route: GET /usa/cons
	Get the USA's Consolidated Advanced Sanctions
	list data, in a custom unofficial JSON format.
	Built from the official XML list found here:
	https://home.treasury.gov/policy-issues/financial-sanctions/consolidated-sanctions-list-non-sdn-lists
	-> CONS_ADVANCED.XML
	(USA Sanctions-based) */
	r.HandleFunc("/usa/cons", k.USAConsJSONHandler)

	/* END: USA Sanctions-based Routes (default) */

	/** Default Routes */

	/** HTTP Route: GET /names
	Get the names of sanctioned entities.
	(USA Sanctions-based) */
	r.HandleFunc("/names", k.NamesHandler)

	/** HTTP Route: GET /names-dm
	Get the names of sanctioned entities, with a
	double-metaphone encoded lookup key.
	(USA Sanctions-based) */
	r.HandleFunc("/names-dm", k.NamesDMHandler)

	/** HTTP Route: GET /names-db
	Get the names of sanctioned entities, with a
	combination of all supported encodings of lookup
	keys. (USA Sanctions-based) */
	r.HandleFunc("/names-db", k.NamesDBHandler)

	/** HTTP Route: GET /sdn
	Get the USA's Specially Designated Nationals
	And Blocked Persons list data, in a custom
	unofficial JSON format.
	Built from the official XML list found here:
	https://home.treasury.gov/policy-issues/financial-sanctions/specially-designated-nationals-list-data-formats-data-schemas
	-> SDN_ADVANCED.XML
	(USA Sanctions-based) */
	r.HandleFunc("/sdn", k.USASdnJSONHandler)

	/** HTTP Route: GET /cons
	Get the USA's Consolidated Advanced Sanctions
	list data, in a custom unofficial JSON format.
	Built from the official XML list found here:
	https://home.treasury.gov/policy-issues/financial-sanctions/consolidated-sanctions-list-non-sdn-lists
	-> CONS_ADVANCED.XML
	(USA Sanctions-based) */
	r.HandleFunc("/cons", k.USAConsJSONHandler)

	/* END: Default Routes */

	/** Static File Routes */

	/** HTTP Route: GET /usa/
	Static file server which serves the contents of
	the directory: `static/` */
	r.PathPrefix("/usa/").Handler(http.StripPrefix("/usa/", http.FileServer(http.Dir(staticDir))))

	/** HTTP Route: GET /
	Static file server which serves the contents of
	the directory: `static/` */
	r.PathPrefix("/").Handler(http.StripPrefix("/", http.FileServer(http.Dir(staticDir))))

	/* END: Static File Routes */

	/** Attach the HTTP router/mux middleware to the
	HTTP server. */
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
