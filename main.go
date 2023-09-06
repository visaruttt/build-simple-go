package main

import (
	"fmt"
	"net/http"
	"time"
)

func greet(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Helloworld! %s", time.Now())
}
func main() {
	fmt.Println("helloworld")
	http.HandleFunc("/", greet)
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		fmt.Errorf("error while starting a server %s", err.Error())
	}
}
