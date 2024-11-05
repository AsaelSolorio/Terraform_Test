package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestEc2Module(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../modules/ec2_instance",
		Vars: map[string]interface{}{
			"ami":           "ami-0e83be366243f524a", // Replace with a valid AMI ID
			"instance_type": "t2.micro",
			"instance_name": "test_instance",
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	instanceId := terraform.Output(t, terraformOptions, "instance_id")
	assert.NotEmpty(t, instanceId)
}
