all: scan.c main.c
	cc -o scanner -g main.c scan.c

clean:
	rm -rf scanner
