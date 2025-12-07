FROM docker.io/library/debian:13

ENV pip_packages="ansible"

# python3-apt is a requirement for ansible apt module
RUN apt -y update \
    && apt -y install python3 python3-pip python3-apt systemd \
    && apt clean

# Remove useless Python environment warning flag.
RUN rm -f /usr/lib/python3.13/EXTERNALLY-MANAGED

# Install Ansible via Pip.
RUN pip3 install $pip_packages

# Run the command
CMD ["/bin/bash"]
