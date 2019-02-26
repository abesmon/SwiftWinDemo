mkdir build 

swiftc -emit-module -emit-library -parse-as-library lib\Greeter.swift -module-name Greeter -o build\Greeter.dll -v

swiftc main.swift -I build -L build -lGreeter -o build\LibExample.exe -v 