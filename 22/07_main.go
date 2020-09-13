package main

import (
	"fmt"
	"os"

	"github.com/aws/aws-lambda-go/lambda"
	"github.com/slack-go/slack"
)

var incomingWebhookURL = os.Getenv("INCOMING_WEBHOOK_URL")

func handler() error {
	spend, err := describeSpend()
	if err != nil {
		return err
	}

	message := fmt.Sprintf("実績値: %s USD、月末の予測値: %s USD",
		*spend.ActualSpend.Amount, *spend.ForecastedSpend.Amount)

	webhookMessage := &slack.WebhookMessage{Text: message}
	return slack.PostWebhook(incomingWebhookURL, webhookMessage)
}

func main() {
	lambda.Start(handler)
}
