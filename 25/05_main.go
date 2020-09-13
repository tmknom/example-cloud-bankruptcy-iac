package main

import (
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/iam"
)

func handler() error {
	sess, err := session.NewSession()
	if err != nil {
		return fmt.Errorf("failed NewSession: %s", err)
	}
	svc := iam.New(sess)

	accessKeys, err := list(svc)
	if err != nil {
		return fmt.Errorf("failed list: %s", err)
	}

	for _, accessKey := range accessKeys {
		err := inactivate(svc, accessKey)
		if err != nil {
			return fmt.Errorf("failed inactivate: %s", err)
		}
	}
	return nil
}

func main() {
	lambda.Start(handler)
}
