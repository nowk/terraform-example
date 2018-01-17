![terraform-example][splash]

> A terraform example using [.tf.makefile][tfmakefile]

This is a basic example for using [.tf.makefile][tfmakefile] in a flat single
layer structured terraform project.


## Installation

Copy/Symlink/Submodule .tf.makefile's [.tf.makefile][tfmakefile_makefile] to
this project.


## Setup

    make tf:make

This will copy over the `.tfvars` templates for configuration. 



__Generating the SSH keys__

    make ssh-keygen

These keys will be registed with our droplet and used for SSH access.


__Deploy__

Once that is configured you can go ahead and deploy. *[Digital
Ocean][digitalocean] is our provider here, so you will need an account from
them.*

    make apply


or

    make tf:apply


or

    make terraform-example


*Note, `make apply` and `make terraform-example` will throw a `make` error,
more on that [here][gotcha].*

If everything is configured and deploys correctly you can visit the IP and you
should see something like,

    Hello World!

    I was created through a terraform deployment!


## Extra

__SSH__

To SSH into your droplet

    make ssh


You'll be prompted for a `login`, use `core` since we are using Coreos as our
OS.


__Un-deploying__

Aka. destroy.

    make destroy

or

    make tf:destroy

You will be prompted to confirm, this is a dangerous process, so
[.tf.makefile][tfmakefile] has a confirmation sequence, as well as confirmation
from terraform itself.


## Gotcha

You will notice that upon initially running `make apply` you will get a `make`
error. *This was deliberate to illustrate a particular use case.*

Many terraforms are written for 3rd parties and the final checkout destination
may not always be the exact same name as the repo itself, case in point. *I
built this original in a folder called `terraform-nginx-example`.*

There are two options,

1. Rewrite the targets

        make tf:rename


    This will rewrite the generated targets to match the new checkout folder
    name.


2. Use the standard `tf:...` prefixed commands, ie.

        make tf:apply


---

For a multiple layer (service) terraform project using `.tf.makefile`, can be
found [here][tfmakefile_example_multi].


[splash]: https://s3.amazonaws.com/assets.github.com/splash-terraform-example.svg
[tfmakefile]: https://github.com/nowk/.tf.makefile
[tfmakefile_makefile]: https://github.com/nowk/.tf.makefile/blob/master/.tf.makefile
[digitalocean]: https://digitalocean.com
[gotcha]: #gotcha
[tfmakefile_example_multi]: #TODO

