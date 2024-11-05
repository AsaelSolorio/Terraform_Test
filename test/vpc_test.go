package test

import (
	"log"
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/joho/godotenv"
	"github.com/stretchr/testify/assert"
)

func TestVpcModule(t *testing.T) {
	// Load .env file
	err := godotenv.Load()
	if err != nil {
		log.Fatalf("Error loading .env file")
	}

	// Set AWS credentials from environment variables
	os.Setenv("AWS_ACCESS_KEY", os.Getenv("AWS_ACCESS_KEY"))
	os.Setenv("AWS_SECRET_KEY", os.Getenv("AWS_SECRET_KEY"))

	// Get the current working directory
	baseDir, err := os.Getwd()
	if err != nil {
		t.Fatal(err)
	}

	// Construct the path to the tfvars file relative to the base directory
	varFilesPath := filepath.Join(baseDir, "..", "terraform.tfvars") // Move one directory up

	terraformOptions := &terraform.Options{
		TerraformDir: "../modules/vpc", // Ensure this points to your module directory correctly
		Vars: map[string]interface{}{
			"region":   "us-west-2",
			"vpc_cidr": "10.0.0.0/16",
			"vpc_name": "test_vpc",
			"private_subnets": map[string]int{
				"private_subnet_1": 1,
				"private_subnet_2": 2,
			},
			"public_subnets": map[string]int{
				"public_subnet_1": 1,
			},
		},
		VarFiles: []string{varFilesPath}, // Use the tfvars file
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	vpcId := terraform.Output(t, terraformOptions, "vpc_id")
	assert.NotEmpty(t, vpcId)

	publicSubnetIds := terraform.OutputList(t, terraformOptions, "public_subnet_ids")
	assert.Len(t, publicSubnetIds, 1)

	privateSubnetIds := terraform.OutputList(t, terraformOptions, "private_subnet_ids")
	assert.Len(t, privateSubnetIds, 2)
}
