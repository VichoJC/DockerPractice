package main
import (
	"bytes"
	"fmt"
	"log"
	"math/rand"
	"net/http"
	"time"
)

const serverURL = "http://servidor:5000/formulario"

func generateRandomUsername() string {
	// Genera un nombre de usuario aleatorio
	return fmt.Sprintf("user%d", rand.Intn(1000)+1)
}

func sendRequest() {
	username := generateRandomUsername()
	log.Printf("Registering User: %s", username)

	// Codifica los datos del formulario
	data := []byte(fmt.Sprintf("nombre=%s", username))
	// Envía una solicitud POST al servidor Flask
	resp, err := http.Post(serverURL, "application/x-www-form-urlencoded", bytes.NewBuffer(data))
	if err != nil {
		log.Fatalf("Error registering user: %s", err)
	}
	defer resp.Body.Close()

	log.Printf("SUCCESSFULLY REGISTERED User: %s", username)
}

func main() {
	rand.Seed(time.Now().UnixNano()) // Inicializa el generador de números aleatorios

	for {
		sendRequest()
		// Duerme un tiempo aleatorio entre 1 y 5 segundos
		sleepTime := time.Duration(rand.Intn(4)+1) * time.Second
		time.Sleep(sleepTime)
	}
}
