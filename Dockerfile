FROM debian:buster-slim

 
ARG WORKSPACE=/root 

RUN apt update && apt install software-properties-common git wget vim zsh curl unzip  build-essential cmake clang python3-pip -y
RUN git config --global user.name "John Doe"
RUN git config --global user.email johndoe@example.com

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install nodejs -y

RUN ["apt-get", "install", "-y", "zsh"]
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

WORKDIR $WORKSPACE
COPY .vimrc ${WORKSPACE}/.vimrc 
COPY plug.vim ${WORKSPACE}/.vim/autoload/plug.vim


RUN vim +PlugInstall +qall 

CMD ["zsh"]
