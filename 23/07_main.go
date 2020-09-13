package main

import (
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func handler(event events.CloudWatchEvent) error {
	findings, err := parse(event.Detail)
	if err != nil {
		return err
	}

	for _, finding := range *findings {
		err := finding.postWebhook()
		if err != nil {
			return err
		}
	}
	return nil
}

func main() {
	lambda.Start(handler)
}
