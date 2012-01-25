#On obtient l'OS
OS := $(shell uname)

ifeq ($(OS), Darwin) #Mac OS X
LINK := -framework sfml-system
endif

ifeq ($(OS), Linux) #Linux
LINK := -lsfml-system
endif

#A Faire cas pour Windows


all: exec
	@echo "Le système d'exploitation est : "$(OS) 

exec: main.o
	g++ -o exec main.o ($LINK)

main.o: main.cpp
	g++ -c main.cpp
