
# tf:targets

plan:
	@$(MAKE) -s terraform-nginx-example/tf:$@;
.PHONY: plan

apply:
	@$(MAKE) -s terraform-nginx-example/tf:$@;
.PHONY: apply

apply!:
	@$(MAKE) -s terraform-nginx-example/tf:$@;
.PHONY: apply!

destroy:
	@$(MAKE) -s terraform-nginx-example/tf:$@;
.PHONY: destroy

# /tf:targets

include ._tf.makefile
include .tf.makefile

#eof

