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
Quando você digitar a senha, não vai aparecer nada que te indique que está digitando. Isso é normal. Quando você confirmar sua senha com [ENTER], o comando irá continuar normalmente.


### Deu pau!

Por vários motivos, *alguma* coisa vai dar errado alguma hora, e esse documento não pode prever todos os possíveis erros. Nessas horas, [Google é seu amigo](www.google.com.br). Copie o erro que apareceu, cole no Google e boa sorte.

Se você conseguir arrumar seu erro, dê um Pull Request e atualize esse documento para ajudar todos!


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

### IDEs de Python

As IDEs mais recomendadas para Python são o **PyCharm** e **Sublime Text**

#### Sublime Text

O **Sublime Text** é um editor de texto muito bom e poderoso, principalmente porque ele pode receber vários plugins para extender suas funcionalidades.

Para isso, visite o site do [Package Control](https://packagecontrol.io/installation) e siga as instruções.

Depois de instalado, com o Sublime aberto digite [CTRL]+[SHIFT]+[P]. Isso irá abrir uma lista com vários comandos e um lugar para digitar comandos. Digite `Install`. Isso irá filtrar a lista e deverá selecionar `Package Control: Install Package`. Digite [ENTER]

Após a lista recarregar, ela deve abrir de novo com vários items. Todos esses são uma extensão do Sublime. Para Python, recomendo instalar `PythonChecker`, `SublimeCodeIntel` e `SublimeTmpl`

##### Configurando o Sublime

O PythonChecker e o CodeIntel não precisam de configurações adicionais, mas o Tmp é uma extensão que tem templates de arquivos de várias linguagems, e a de Python dele não é muito boa na minha opinião. Para alterar, clique em **Preferences>Browse Packages**. Isso irá abrir uma janela dentro da pasta *Packages*. Entre nas pastas **User>SublimeTmpl>templates** e crie um arquivo chamado `python.tmpl`.

Coloque o seguinte dentro dele:

```
# coding: UTF-8
from __future__ import absolute_import

$0
```

Feche e salve.

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

## Git

### Configurando o git e o GitHub
[Guia oficial](https://help.github.com/articles/set-up-git/)

Para configurar o git é simples. No terminal, digite:

1. `git config --global user.name "YOUR NAME"`
1. `git config --global user.email "YOUR EMAIL ADDRESS"`
1. `git config --global core.editor vim`

O SSH é mais chato:

1. Digite no terminal `ssh-keygen -t rsa -C "your_email@example.com"`
1. Nesse ponto, o ssh-keygen vai pedir uma senha. Deixe em branco
1. Digite no terminal `eval "$(ssh-agent -s)"`
1. Digite no terminal `ssh-add ~/.ssh/id_rsa`
1. Digite no terminal `gedit ~/.ssh/id_rsa.pub`. Um editor de texto deve abrir. Copie tudo.
1. [Siga os passos para adicionar a senha na conta do GitHub](https://help.github.com/articles/generating-ssh-keys/#step-3-add-your-ssh-key-to-your-account)
1. A partir daqui o ssh deve estar funcionando.[Teste seguindo o **Step 4** do guia do GitHub](https://help.github.com/articles/generating-ssh-keys/#step-4-test-everything-out)

  
### Trabalhando com o git


O git segue um loop de trabalho:

```

Alterações de código --> git status (1) --> git diff (2) ---
 ^                                                         |
 |                                                         |
 |                                                         v
 git push (5) <--- git commit -m "Mensagem" (4) <--- git add (3)
```

Onde:

(1): Mostra os arquivos alterados

(2): Verifica as alterações

(3): Adiciona todos os arquivos

(4): "Empacota" as alterações e adiciona uma mensagem

(5): Empurra as alterações para o servidor


### Banco de dados (PostgreSQL)

Agora não é bom copiar os comandos. Digite do jeito que estão aparecendo aqui:

1. `sudo -u postgres psql postgres`
1. `\password postgres`
1. `root` (Não vai aparecer na tela, igual o da instalação)
1. `root`
1. `CREATE EXTENSION adminpack;`
1. `\q`
1. `sudo -u postgres createuser --superuser $USER`
1. `sudo -u postgres psql`
1. `\password $USER`
1. `\q`
1. `sudo -u postgres createdb $USER`

Ufa. Por fim, digite `sudo gedit /etc/postgresql/9.3/main/pg_hba.conf` e no editor que abrir, substitua as linhas

```
# Database administrative login by Unix domain socket
local   all             postgres                                peer
```
por
```
# Database administrative login by Unix domain socket
local   all             postgres                                md5
```

Recarregue o postgres usando `sudo service postgres reload`.

Finalmente, rode o pgAdmin3 usando `pgadmin3` e configure uma nova conexão usando o nome e senha de seu usuario. Aproveite e crie um banco de dados chamado `cidadeiluminada`


### Baixando e Instalando a aplicação web

Depois de uma excitante viagem, finalmente podemos instalar a aplicação:

Em uma pasta, digite `git clone git@github.com:HardDiskD/TCMCidadeIluminada.git`. Isso irá criar uma pasta chamada `TCMCidadeIluminada`, com uma pasta `webservice` e outra `android` dentro.

Vamos agora instalar a aplicação em python:

1. `cd TCMCidadeIluminada` (se você ainda não entrou nessa pasta)
1. `sh install-cidadeiluminada.sh`


Se deu tudo certo, o seu terminal vai ter algo do tipo

`Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)`

aparecendo.

Por fim, crie o usuário padrão: `python manage.py criar_usuario admin admin`

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

##Configurações de ambiente

O arquivo `settings.py` guarda várias várias variáveis de configuração de ambiente. Neste arquivo estão guardado todos os valores padrões e de exemplo.

Para configurar o seu ambiente local, crie uma pasta chamada `instance` na pasta onde está o `manage.py`, e dentro dela crie um arquivo chamado `settings_local.py`. A connection string do Postgres deve ser configurada no `settings_local.py`.

**Somente o arquivo `settings_local.py` deve ser alterado, e no arquivo `settings.py` ficam somente os exemplos de chave/valor.**

O `settings_local.py` será lido depois do settings de fora, então para configurar localmente, somente substitua as variáveis em **maiúsculo** para os valores desejados.

**Sobre a conexão do Postgres:** Do modo que foi configurado nesse arquivo, o campo `username` deve ficar vazio. Isso pode ou não dar problemas. Vou perguntar para quem sabe e atualizar isso aqui. Eu *acho* que não tem problema porque essas instruções são só para máquinas de desenvolvimento.
