{pkgs}:
with pkgs;
[
	bubblewrap     # Unprivileged sandboxing tool
	# getconf      # 这个不需要手动添加了
	aspcud # Solver for package problems in CUDF format using ASP
]