package main

var filters = map[string][]string{
	"IAM Access Analyzer": []string{"CRITICAL", "HIGH", "MEDIUM"},
	"GuardDuty":           []string{"CRITICAL", "HIGH"},
	"Security Hub":        []string{"CRITICAL"},
}

func filter(findings *[]Finding) *[]Finding {
	result := []Finding{}
	for _, finding := range *findings {
		if severities, ok := filters[finding.ProductName]; ok {
			if contains(severities, finding.SeverityLabel) {
				result = append(result, finding)
			}
		}
	}
	return &result
}

func contains(items []string, str string) bool {
	for _, item := range items {
		if item == str {
			return true
		}
	}
	return false
}
