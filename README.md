# Instalação no Ubuntu

Este documento é um conjunto de instruções para instalar um ambiente de desenvolvimento para Python com o PostgreSQL como banco de dados, e Android. Recomendo seguir a seção de instalação dos programas na ordem do documento.

Vou assumir aqui que a sua instalação do Ubuntu é completamente nova. Esse guia foi escrito para o Ubuntu 14.04 LTS.

### Abrindo o terminal

A maior parte da instalação será feita pelo terminal do Linux, que é onde você digita comandos diretamente para o Ubuntu e ele executa da melhor maneira que ele conseguir.

Para abrir o terminal, aperte a tecla `[SUPER]` (Na maioria dos teclados, é a mesma tecla com o símbolo do Windows), digite `terminal` e aperte `[ENTER]`. Uma janela escura é aberta com a seguinte linha:
```
seu_nome@seu_computador:~$
```

Separando em partes:

* `seu_nome` é o nome de usuário que você configurou na instalação.
* `@` significa que `seu_nome` está logado em `seu_computador`
* `seu_computador` é o nome do computador que você configurou na instalação.
* `:` separa as partes.
* `~` mostra a pasta que você está agora. `~` significa que você está na pasta `/home/seu_usuário`
* `$` significa que tudo o que vem depois é um comando digitado.


### Comandos no terminal

Os comandos que você tem que digitar vão vir com esse nomenclatura:

```
$ comando_a_ser_executado
```

Lembrando que o símbolo `$` já está no terminal, então só precisa copiar a partir dele.

**Dica:** Para colar comandos no terminal, copie o comando e cole com `[CTRL]+[SHIFT]+[V]`

### Comandos `sudo`

Vários comandos irão começar com o comando `sudo`, que seria para executar como administrador.

Quando você confirma um comando desses, irá aparecer um comando desses:
```
[sudo] password for seu_nome:  
```
Quando você digitar a senha, não vai aparecer nada que te indique que está digitando. Isso é normal. Quando você confirmar sua senha com `[ENTER]`, o comando irá continuar normalmente.


### Deu pau!

Por vários motivos, *alguma* coisa vai dar errado alguma hora, e esse documento não pode prever todos os possíveis erros. Nessas horas, [Google é seu amigo](http://www.google.com.br). Copie o erro que apareceu, cole no Google e boa sorte.

Se você conseguir arrumar seu erro, por favor, dê um Pull Request e atualize esse documento para ajudar todos!


## Chrome

Sugiro instalar o Chromium como o browser para desenvolvimento web.

```
$ sudo apt-get install chromium-browser
```

## Python

Vamos começar com o mais simples.

Digite no terminal

```
$ sudo apt-get install python-dev
$ sudo apt-get install python-pip
```

Isso irá instalar o python de desenvolvimento e o gerenciador de pacotes do python.

Para testar digite no terminal

```
$ python --version
```

O comando deve retornar algo do tipo
```
Python 2.7.x
```

Onde `x` é um número qualquer.

Depois de testar, vamos atualizar o pip:
```
$ sudo pip install --upgrade pip
```

### IDEs de Python

As IDEs mais recomendadas para Python são o **PyCharm** e **Sublime Text**

#### Sublime Text

O **Sublime Text** é um editor de texto muito bom e poderoso, principalmente porque ele pode receber vários plugins para extender suas funcionalidades.

Para isso, visite o site do [Package Control](https://packagecontrol.io/installation) e siga as instruções.

Depois de instalado, com o Sublime aberto digite `[CTRL]+[SHIFT]+[P]`. Isso irá abrir uma lista com vários comandos e um lugar para digitar comandos. Digite `Install`. Isso irá filtrar a lista e deverá selecionar `Package Control: Install Package`. Digite `[ENTER]`

Após a lista recarregar, ela deve abrir de novo com vários items. Todos esses são uma extensão do Sublime. Para Python, recomendo instalar `PythonChecker`, `SublimeCodeIntel` e `SublimeTmpl`

##### Configurando o Sublime

O PythonChecker e o CodeIntel não precisam de configurações adicionais, mas o Tmp é uma extensão que tem templates de arquivos de várias linguagems, e a de Python dele não é muito boa na minha opinião. Para alterar, clique em **Preferences>Browse Packages**. Isso irá abrir uma janela dentro da pasta *Packages*. Entre nas pastas **User>SublimeTmpl>templates** e crie um arquivo chamado `python.tmpl`.

Coloque o seguinte dentro dele:

```
# coding: UTF-8
from __future__ import absolute_import

$0
```

Salve e feche.

Para configurar o Sublime em si, clique em **Preferences>Settings-User** e cole o seguinte arquivo:

```
{
	"caret_style": "phase",
	"detect_indentation": false,
	"dictionary": "",
	"draw_minimap_border": true,
	"draw_white_space": "all",
	"enable_tab_scrolling": false,
	"enable_telemetry": "disabled",
	"ensure_newline_at_eof_on_save": true,
	"fold_buttons": false,
	"folder_exclude_patterns":
	[
		".svn",
		".git",
		".hg",
		"CVS",
		"gen",
		"venv",
		".idea"
	],
	"font_size": 10,
	"highlight_line": true,
	"ignored_packages":
	[
		"Markdown",
		"Vintage"
	],
	"indent_guide_options":
	[
		"draw_normal",
		"draw_active"
	],
	"margin": 0,
	"python_interpreter_path": "/usr/bin/python",
	"rulers":
	[
		79
	],
	"shift_tab_unindent": true,
	"show_full_path": false,
	"show_tab_close_buttons": false,
	"spell_check": false,
	"spellcheck": false,
	"tab_size": 4,
	"translate_tabs_to_spaces": true,
	"trim_automatic_white_space": true,
	"trim_trailing_white_space_on_save": true,
	"use_tab_stops": true,
	"word_wrap": false
}
```
Para mais informações em o que cada opção faz, clique em **Preferences>Settings-Default**.


#### PyCharm
[Baixe aqui](https://download.jetbrains.com/python/pycharm-community-4.0.4.tar.gz) e descompacte para qualquer lugar.

Para rodar, entre na pasta do PyCharm dentro de onde você extraiu e digite:
```
$ cd bin
$ sh pycharm.sh 
```

### Virtualenv

O **Virtualenv** é uma ferramenta para configurar ambientes virtuais de programação em python, assim separando cada projeto seu em ambientes e evitando conflitos nas bibliotecas.

O virtualenv já está instalado, mas vamos instalar o **Virtualenvwrapper**, que faz o gerenciamento dos virtualenvs ficar mais fácil. Digite:

```
$ sudo pip install virtualenvwrapper
$ mkdir ~/.virtualenvs
$ printf 'export WORKON_HOME=$HOME/.virtualenvs\nsource /usr/local/bin/virtualenvwrapper.sh\n' >> ~/.bashrc
$ source ~/.bashrc
```

Vamos testar criando um virtualenv:
```
$ mkvirtualenv teste
```

Se tudo deu certo, o seu prompt deve ficar como:
```
(teste)seu_nome@seu_computador:~$
```
Onde `teste` é o nome do virtualenv.

Quando você fechar o seu console, para voltar para o ambiente virtual, digite
```
workon nome_do_ambiente
```

## Git

O **git** é um sistema de versão de controle, fundamental para se trabalhar em equipe.

Para instalar, digite 

```
$ sudo apt-get install git
$ sudo apt-get install vim
```

### Configurando o git e o GitHub
Entre em [GitHub](http://www.github.com) e faça uma conta.

Se você quiser seguir o guia oficial em inglès, clique [aqui](https://help.github.com/articles/set-up-git/).

No terminal, digite:

```
$ git config --global user.name "seu_email"
$ git config --global user.email "seu_email"
$ git config --global core.editor vim
```
Onde o `seu_email` é o email com que você se cadastrou no GitHub.

Normalmente, quando você fizer qualquer operação no GitHUb, você tem que digitar seu email e sua senha. Para não precisar fazer isso, vamos configurar o SSH:

1. `$ ssh-keygen -t rsa -C "seu_email"`
1. Agora, o ssh-keygen vai pedir várias coisas. Deixe todas em branco.
1. `$ eval "$(ssh-agent -s)"`
1. `$ ssh-add ~/.ssh/id_rsa`
1. `$ gedit ~/.ssh/id_rsa.pub`. Um editor de texto deve abrir. Copie tudo.
1. [Siga os passos para adicionar a senha na conta do GitHub](https://help.github.com/articles/generating-ssh-keys/#step-3-add-your-ssh-key-to-your-account)
1. A partir daqui o ssh deve estar funcionando. [Teste seguindo o *Step 4* do guia do GitHub](https://help.github.com/articles/generating-ssh-keys/#step-4-test-everything-out)

### O Vim
O Vim é um editor de texto que abre direto no terminal, e é o que acabamos de configurar para usar o git. No começo, ele é bem diferente de usar, mas como vamos usar poucos comandos, ele não é tão difícil assim.

Vamos fazer um mini-curso de vim. Abra o vim digitando 
```
$ vim
```

O vim tem basicamente dois modos: O modo de **Comando** e **Inserção**. Ele abre no modo de comando. Aperte `[INSERT]` para ir para o modo de inserção (Deve estar escrito `-- INSERT --` no canto inferior esquerdo da tela) e digite qualquer coisa.

Para salvar o que escrevemos, aperte `[ESC]` (O `-- INSERT --` tem que sumir da tela). Para salvar um arquivo com o nome `teste`, digite `:w teste`. Para sair, digite `:q`.

O vim pode ser bem espartano, mas ele, por padrão, faz tudo o que ele pode fazer para que você não perca dados. Por exemplo, ele não te deixa sair até que você salve suas alterações, ou ele não deixa você sobreescrever arquivos que não estejam abertos. Para forçar ele a fazer essas coisas, coloque um `!` depois do comando, por exemplo, `:q!` sai sem salvar o arquivo, e `:w!` sobrescreve arquivos.

Para abrir arquivos do disco com o vim, digite
```
$ vim nome_do_arquivo
```

### Trabalhando com o git
O git segue um loop de trabalho:

```
 Inicie aqui
 |
 V
 git pull (1)
 |
 V
 Alterações de código --> git status (2) --> git diff (3) ---
 ^                                                          |
 |                                                          |
 |                                                          V
 git push (6) <--- git commit -m "Mensagem" (5) <--- git add (4)
```

Onde:

1. Atualiza a sua cópia local
2. Mostra os arquivos alterados
3. Verifica as alterações
4. Adiciona todos os arquivos
5. "Empacota" as alterações e adiciona uma mensagem
6. Empurra as alterações para o servidor


### Banco de dados (PostgreSQL)

Para instalar o PostgreSQL digite:

```
$ sudo apt-get install postgresql
$ sudo apt-get install postgresql-contrib
$ sudo apt-get install pgadmin3
$ sudo apt-get install postgresql-server-dev-9.3
```

Agora não é bom copiar os comandos. Digite do jeito que estão aparecendo aqui:

1. `$ sudo -u postgres psql postgres`
1. `# \password postgres`
1. `# root` (Não vai aparecer na tela, igual o da instalação)
1. `# root`
1. `# CREATE EXTENSION adminpack;`
1. `# \q`
1. `$ sudo -u postgres createuser --superuser $USER`
1. `$ sudo -u postgres psql`
1. `# \password $USER`
1. `# \q`
1. `$ sudo -u postgres createdb $USER`

Ufa. Por fim, digite
```
$ sudo gedit /etc/postgresql/9.3/main/pg_hba.conf
```

e no editor que abrir, substitua as linhas

```
# Database administrative login by Unix domain socket
local   all             postgres                                peer
```
por
```
# Database administrative login by Unix domain socket
local   all             postgres                                md5
```

Recarregue o postgres usando 
```
$ sudo service postgres reload
```

Finalmente, rode o pgAdmin3 usando 
```
$ pgadmin3
```
e configure uma nova conexão usando o nome e senha de seu usuario do Ubuntu.

## Android

Primeiro vamos instalar o Java da Oracle:

```
$ sudo add-apt-repository ppa:webupd8team/java
$ sudo apt-get update
$ sudo apt-get install oracle-java8-installer
```

Como o Android é uma plataforma de 32 bits, precisamos instalar bibliotecas que nos permitam compilar para essa plataforma. Rode:

```
$ sudo apt-get install lib32z1 
$ sudo apt-get install lib32ncurses5-dev 
$ sudo apt-get install lib32stdc++6
```

Como o Android Studio não tem um bom suporte para instalação pela linha de comando, o melhor recurso é [este](http://developer.android.com/training/index.html) link, que também já segue em um tutorial básico de aplicação.

Depois de instalado o Android Studio, convém criar um comando de atalho:

**Substitua `<caminho_para_a_pasta>` com o caminho para a pasta onde está a pasta do Android Studio**

```
$ printf "cd <caminho_para_a_pasta>/android-studio/bin\nsh studio.sh" >> android_studio
$ chmod +x android_studio
$ sudo mv android_studio /bin/
```
