package main

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

	r := mux.NewRouter()

	// This will serve files under http://localhost:8000/static/<filename>
	dir := "./static/xml"
	r.PathPrefix("/static/xml/").HandlerFunc(kycaml.SetHeader("Content-Type", "application/xml", http.StripPrefix("/static/xml/", http.FileServer(http.Dir(dir)))))
	// r.PathPrefix("/static/").Handler(http.StripPrefix("/static/", http.FileServer(http.Dir(dir))))

	r.HandleFunc("/", kycaml.IndexHandler)
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
