with import <nixpkgs> {};
with python3.pkgs;

buildPythonPackage rec {
  name = "mypackage";
  src = /home/prehonor/PycharmProjects/spyder-5.3.2;

  propagatedBuildInputs = [
    atomicwrites
    chardet
    cloudpickle
    cookiecutter
    diff-match-patch
    flake8
    intervaltree
    jedi
    jellyfish
    keyring
    matplotlib
    mccabe
    nbconvert
    numpy
    numpydoc
    psutil
    pygments
    pylint
    pyls-spyder
    pyopengl
    pyqtwebengine
    python-lsp-black
    python-lsp-server
    pyxdg
    pyzmq
    pycodestyle
    qdarkstyle
    qstylizer
    qtawesome
    qtconsole
    qtpy
    rope
    Rtree
    scipy
    spyder-kernels
    textdistance
    three-merge
    watchdog
    pip
  ];

  # There is no test for spyder
  doCheck = false;
}