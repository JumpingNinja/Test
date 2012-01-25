#On obtient l'OS
OS := $(shell uname)
#Dossier pour les fichier objets
OBJ_DIR := obj/
#Dossier pour l'executable
BIN_DIR :=

#par défaut
LINK := -lsfml-system

ifeq ($(OS), Darwin) #Mac OS X
LINK := -framework sfml-system
endif

ifeq ($(OS), Linux) #Linux
LINK := -lsfml-system
endif

#A Faire cas pour Windows

	
git: #Fait un commit, le \ sert à éxecuter d'une fois
	git commit -a -m '[Commit depuis le MakeFile]' ; \
	git push -u origin master
	


all: exec
	@echo "Le système d'exploitation est : "$(OS) 

exec: main.o
	g++ -o exec $(OBJ_DIR)main.o ($LINK)

$(OBJ_DIR)main.o: main.cpp
	g++ -c main.cpp
	
help:
	@clear
	@echo "===============HELP===============\n"
	@echo "\tgit:\tfait un commit (marche si git vous avez les droits de faire des commits, ceci est surtout utilisé lors du développement pour des commits rapides\n"
	@echo "\tall:\tfait l'executable"
