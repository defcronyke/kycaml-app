module github.com/defcronyke/kycaml-app

require (
	github.com/defcronyke/kycaml v0.0.0
	github.com/gorilla/mux v1.8.0
)

replace github.com/defcronyke/kycaml v0.0.0 => ../kycaml

go 1.16
