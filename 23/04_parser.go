package main

import (
	"encoding/json"
	"fmt"
)

type Detail struct {
	Findings []Finding `json:"findings"`
}

type Finding struct {
	Description   string `json:"Description"`
	Severity      `json:"Severity"`
	ProductFields `json:"ProductFields"`
	Remediation   `json:"Remediation"`
}

type Severity struct {
	SeverityLabel string `json:"Label"`
}

type ProductFields struct {
	ProductName string `json:"aws/securityhub/ProductName"`
}

type Remediation struct {
	Recommendation `json:"Recommendation"`
}

type Recommendation struct {
	Text string `json:"Text"`
	Url  string `json:"Url"`
}

func parse(raw json.RawMessage) (*[]Finding, error) {
	detail := &Detail{}
	err := json.Unmarshal(raw, &detail)
	if err != nil || len(detail.Findings) == 0 {
		return nil, fmt.Errorf("failed unmarshal: %s", err)
	}
	return &detail.Findings, nil
}
