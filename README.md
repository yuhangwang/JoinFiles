## JoinFiles
This is an executable package for joining files (`cat` command equivalent).

### Usage
```
stack build
stack path --local-install-root # see where the binary file is
cp .stack-work\install\26812796\JoinFiles\bin\JoinFiles.exe .
.\JoinFiles.exe out.dat i1.dat i2.dat ...
``` 
note: you need to replace `26812796` with the actual path
matching your own build.