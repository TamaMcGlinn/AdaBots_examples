FROM tmcglinn/ada_gitpod

RUN alr toolchain --select gnat_native && alr toolchain --select gprbuild \
	&& printf 'eval $(alr printenv)\n' > "$HOME/.bashrc.d/600-alr"
	