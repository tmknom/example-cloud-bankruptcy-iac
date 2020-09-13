package main

import (
	"fmt"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func handler(event events.CloudWatchEvent) {
	fmt.Printf("event: %s", event)
}

func main() {
	lambda.Start(handler)
}
