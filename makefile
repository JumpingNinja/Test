#On obtient l'OS
OS := $(shell uname)

ifeq ($(OS), Darwin) #Mac OS X
LINK := -framework sfml-system
endif

ifeq ($(OS), Linux) #Linux
LINK := -lsfml-system
endif

#A Faire cas pour Windows
#$GIT_COMMIT = "'" GIT_COMMIT" [Commit depuis le MakeFile]'"; \
	#echo "git commit -m" $$GIT_COMMIT";"; \
	#git commit -m "'"$$GIT_COMMIT" [Commit depuis le MakeFile]'"; \
	#git push -u origin master;
	#@echo "Donner une description pour le commit (mettre entre guillemets simples => ' : "; \
	#read GIT_COMMIT ; \
	
git: #Fait un commit, le \ sert à éxecuter d'une fois
	git commit -a -m '[Commit depuis le MakeFile]' ; \
	git push -u origin master
	


all: exec
	@echo "Le système d'exploitation est : "$(OS) 

exec: main.o
	g++ -o exec main.o ($LINK)

main.o: main.cpp
	g++ -c main.cpp
