all: hello.com hello.exe hello32.exe

hello.com: hello.pas
	ppcross8086 -o$@ -WmTiny -Wtcom $<

hello.exe: hello.pas
	ppcross8086 -o$@ -WmTiny -Wtexe $<

hello32.exe: hello.pas
	ppcross386 -o$@ -Tgo32v2 $<

clean:
	rm -rf *.com *.exe *.a *.o
