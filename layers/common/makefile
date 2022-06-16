init:
	rm -rf .terraform
	terraform get -update
	terraform providers lock
	terraform init \
		-backend=true \
		-backend-config="bucket=${namespace}-tfstate" \
		-backend-config="key=common.tfstate" \
		-backend-config="region=us-east-1" \
		-backend-config="encrypt=true" \
		-backend-config="dynamodb_table=${namespace}-tfstate-lock"
	terraform fmt

plan: init
	terraform plan -var="namespace=${namespace}"

apply: init
	terraform apply -var="namespace=${namespace}"