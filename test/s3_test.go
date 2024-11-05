package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestS3Module(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../modules/s3_bucket",
		Vars: map[string]interface{}{
			"bucket_name": "my-s3-bucket-terraform-asg",
			"environment": "dev",
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	bucketName := terraform.Output(t, terraformOptions, "bucket_name")
	assert.Equal(t, "my-s3-bucket-terraform-asg", bucketName)
}
