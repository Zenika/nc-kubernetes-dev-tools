package main

import (
	"fmt"
	"net/http"

	"github.com/spf13/viper"
)

func main() {
	viper.SetConfigName("default")
	viper.AddConfigPath("/config")
	viper.ReadInConfig()

	viper.SetConfigName("config")
	viper.AddConfigPath("/config")
	viper.MergeInConfig()

	port := viper.GetString("Port")
	name := viper.GetString("Name")

	fmt.Printf("Read Port: %s - Name: \"%s\" from configuration\n", port, name)

	http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, %s!", name)
	})
	fmt.Printf("Starting server on %s", port)
	http.ListenAndServe(fmt.Sprintf(":%s", port), nil)
}
