init:
	rm -rf .terraform
	terraform get -update
	terraform providers lock
	terraform init \
		-backend=true \
		-backend-config="bucket=studiog-tfstate" \
		-backend-config="key=remote.tfstate" \
		-backend-config="region=us-east-1" \
		-backend-config="encrypt=true" \
		-backend-config="dynamodb_table=studiog-tfstate-lock"
	terraform fmt

plan: init
	terraform plan

apply: init
	terraform apply