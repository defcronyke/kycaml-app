package main

/** kycaml-app */

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

	host_default := "127.0.0.1"
	port_default := "3000"

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

	r.HandleFunc("/usa/cons", kycaml.USAConsJSONHandler)
	r.HandleFunc("/cons", kycaml.USAConsJSONHandler)

	r.PathPrefix("/").Handler(http.StripPrefix("/", http.FileServer(http.Dir(staticDir))))
	http.Handle("/", r)

	srv := &http.Server{
		Handler:      r,
		Addr:         addr,
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	log.Printf("KycAml server listening at: http://%v\n", addr)

	err := srv.ListenAndServe()

	if err != nil {
		log.Printf("error: %v", err)
	}
}
