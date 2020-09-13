package main

import (
	"fmt"

	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/budgets"
	"github.com/aws/aws-sdk-go/service/sts"
)

func describeSpend() (*budgets.CalculatedSpend, error) {
	sess, err := session.NewSession()
	if err != nil {
		return nil, fmt.Errorf("failed NewSession: %s", err)
	}

	identityInput := &sts.GetCallerIdentityInput{}
	callerIdentity, err := sts.New(sess).GetCallerIdentity(identityInput)
	if err != nil {
		return nil, fmt.Errorf("failed GetCallerIdentity: %s", err)
	}
	accountId := callerIdentity.Account

	input := &budgets.DescribeBudgetsInput{AccountId: accountId}
	output, err := budgets.New(sess).DescribeBudgets(input)
	if err != nil {
		return nil, fmt.Errorf("failed DescribeBudgets: %s", err)
	}

	for _, budget := range output.Budgets {
		if *budget.BudgetType == "COST" && *budget.TimeUnit == "MONTHLY" {
			return budget.CalculatedSpend, nil
		}
	}
	return nil, fmt.Errorf("not found budget: %s", output.Budgets)
}
