{ python,version }:
{ 
	mypy = python.withPackages(ps: with ps; [ pip urllib3 pytorch-bin torchvision-bin pyside2 ]); 
	mypy_v = version;
}
