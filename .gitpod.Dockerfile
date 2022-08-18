FROM tmcglinn/ada_gitpod

RUN alr toolchain --select gnat_native && alr toolchain --select gprbuild
	
RUN printf 'cd "$GITPOD_REPO_ROOT" && eval $(alr printenv)\n' > $HOME/.bashrc.d/600-alr
