from bryandollery/terraform-packer-aws-alpine
copy . /src/
USER root
entrypoint ["/bin/bash", "-c"]
