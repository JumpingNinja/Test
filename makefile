#On obtient l'OS
OS := $(shell uname)
#Dossier pour les fichier objets
OBJ_DIR := obj/
#Dossier pour l'executable
BIN_DIR :=

#par défaut. L'ordre est important graphics dépend de window qui dépend de system
#Je changerai ça quand je fasse la compilation sous windows à cause du linkage static qui nécessite un #define SFML_STATIC et un -s à la fin des option de link.
LINK := -lsfml-audio -lsfml-graphics -lsfml-window -lsfml-system

ifeq ($(OS), Darwin) #Mac OS X Ici l'ordre est inverse mais je ne suis pas certain si c'est important car en changeant l'ordre tout compile et se lance bien
LINK := -framework sfml-system -framework sfml-window -framework sfml-graphics -framework sfml-audio
endif

ifeq ($(OS), Linux) #Linux
LINK := -lsfml-audio -lsfml-graphics -lsfml-window -lsfml-system
endif

#A Faire cas pour Windows

	


all: exec
	@echo "Le système d'exploitation est : "$(OS)
	@echo "Supression des fichiers objets (*.o)"
	rm *.o

exec: main.o
	g++ -o exec main.o $(LINK)

main.o: main.cpp
	g++ -c main.cpp
	
help:
	@clear
	@echo "===============HELP===============\n"
	@echo "\tgit:\tfait un commit (marche si git vous avez les droits de faire des commits, ceci est surtout utilisé lors du développement pour des commits rapides\n"
	@echo "\tall:\tfait l'executable"
	
	
	
git: #Fait un commit, le \ sert à éxecuter d'une fois
	git commit -a -m '[Commit depuis le MakeFile]' ; \
	git push -u origin master
