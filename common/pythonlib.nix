{ python, version }: {
  mypy = python.withPackages (ps:
    with ps; [
      pip
      urllib3
      # pytorch-bin
      # torchvision-bin
      pyside2
      dbus-python
      pygobject3
      gst-python
      jedi-language-server
      setuptools 
      wheel
    ]);
  mypy_v = version;
}
