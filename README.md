# Jupyter Notebook Docker Container
This jupyter notebook docker container comes pre-installed with PyTorch (CUDA 11.8), and is based on Python 3.9 but it can be changed in the `Dockerfile` (don't use the `alpine` version of the Python base image). It has only been tested on an [UNRAID](https://unraid.net/) system, so you will probably have to make modifications regarding the NVIDIA runtime if you are not using UNRAID.

## Usage
Please replace all user variables in the below command defined by <> with the correct values.

	docker run -d \
		-p 8888:8888/tcp \
		--name=<container name> \
		--runtime=nvidia \
		-v <path for jupyter home>:/data \
		-e JUPYTER_NO_PASS=<TRUE or FALSE> \
		-e NVIDIA_VISIBLE_DEVICES=<Nvidia GPU UUID> \
		-e UMASK=<umask for created files> \
		-e PUID=<uid for user> \
		-e PGID=<gid for user> \
		tinynja/jupyter-notebook

## Notes

If you are building the container yourself, you might need a machine with a lot of RAM due to PyTorch. I had to close all running applications on an 8GB machine otherwise the build process would be `Killed` at the PyTorch install step.

User ID (`PUID`) and Group ID (PGID) can be found by issuing the following command for the user you want to run the container as:

	id <username>

Nvidia GPU UUID (`NVIDIA_VISIBLE_DEVICES`) is given by the [Nvidia-Driver](https://forums.unraid.net/topic/98978-plugin-nvidia-driver/) UNRAID plugin.

`<JUPYTER_NO_PASS>` should obviously only be set to `TRUE` if you are using the container locally, for ease of use.

## TO DO

- Figure out how to use HTTPS in order to safely make the container public