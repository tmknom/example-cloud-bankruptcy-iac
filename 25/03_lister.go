package main

import (
	"fmt"

	"github.com/aws/aws-sdk-go/service/iam"
)

func list(svc *iam.IAM) ([]*iam.AccessKeyMetadata, error) {
	listUsersInput := &iam.ListUsersInput{}
	listUsersOutput, err := svc.ListUsers(listUsersInput)
	if err != nil {
		return nil, fmt.Errorf("failed ListUsers: %s", err)
	}

	accessKeys := []*iam.AccessKeyMetadata{}

	for _, user := range listUsersOutput.Users {
		input := &iam.ListAccessKeysInput{UserName: user.UserName}
		output, err := svc.ListAccessKeys(input)
		if err != nil {
			return nil, fmt.Errorf("failed ListAccessKeys: %s", err)
		}
		accessKeys = append(accessKeys, output.AccessKeyMetadata...)
	}

	return accessKeys, nil
}
