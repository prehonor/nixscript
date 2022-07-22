{ pkgs }:
with pkgs; [
  bubblewrap # Unprivileged sandboxing tool
  # getconf      # 这个不需要手动添加了
  aspcud # Solver for package problems in CUDF format using ASP
  procps # Utilities that give information about processes using the /proc filesystem
  inotify-tools # inotify-tools is a C library and a set of command-line programs for Linux providing a simple interface to inotify. These programs can be used to monitor and act upon filesystem events. A more detailed description of the programs is further down the page. The programs are written in C and have no dependencies other than a Linux kernel supporting inotify
  intltool
]
