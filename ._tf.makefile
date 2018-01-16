# tf:varfiles

TERRAFORM-NGINX-EXAMPLE_VAR_FILES= \
	-var-file=./.provider.tfvars \
	-var-file=./.variables.tfvars

# /tf:varfiles

# tf:targets

terraform-nginx-example:
	@$(MAKE) -s $@/tf:apply!
.PHONY: terraform-nginx-example

# /tf:targets

#eof
