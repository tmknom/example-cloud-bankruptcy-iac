package main

import (
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/securityhub"
)

func handler() error {
	sess, err := session.NewSession()
	if err != nil {
		return fmt.Errorf("failed NewSession: %s", err)
	}

	input := &securityhub.EnableSecurityHubInput{}
	_, err = securityhub.New(sess).EnableSecurityHub(input)
	if err != nil {
		return fmt.Errorf("failed EnableSecurityHub: %s", err)
	}
	return nil
}

func main() {
	lambda.Start(handler)
}
