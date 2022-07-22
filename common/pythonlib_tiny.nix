{ python, version }: {
  mypy = python.withPackages (ps:
    with ps; [
      pip
      urllib3
      pyside2
      dbus-python
      pygobject3
      jedi-language-server
    ]);
  mypy_v = version;
}
