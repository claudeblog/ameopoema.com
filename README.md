# Meu Blog com mdBook  

Bem-vindo ao repositório do **ameopoema.com** – um blog estático gerado a partir de arquivos Markdown utilizando o **mdBook**.  

O projeto é totalmente automatizado: com um único comando você instala dependências, gera o site, cria o feed RSS, configura um domínio personalizado e publica no GitHub Pages (branch `gh-pages`).  

---  

## 📌 Sobre o projeto  

- Gerador de site estático com **mdBook**.  
- Publicação direta no branch `gh-pages` do GitHub (sem necessidade de GitHub Actions).  
- Inclusão de feed RSS com informações dos posts (título, data, descrição e duração de áudios, quando houver).  
- Suporte a domínio personalizado configurado via `.env`.  
- Scripts auxiliares para:  
  - Renomear arquivos `.md` com base no título.  
  - Atualizar automaticamente o `SUMMARY.md`.  
  - Corrigir datas em blocos de citação.  
  - Corrigir quebras de linha.  
  - Gerar uma versão `blog.html` contendo todos os posts em sequência.  
- Personalização de tema, título, autor, idioma e descrição do feed através do arquivo `.env`.  

---  

## 🧩 Pré-requisitos  

- Sistema operacional baseado em Debian/Ubuntu ou Fedora (com `apt` ou `dnf`).  
- Acesso à internet para baixar dependências.  
- Git instalado (caso não esteja, será instalado automaticamente).  
- Um repositório no GitHub com o branch `gh-pages` configurado como fonte do GitHub Pages.  

---  

# 🚀 Instalação  

## 1. Clone o repositório  

```bash  
git clone https://github.com/claudeblog/ameopoema.com.git  
cd ameopoema.com  
```  

## 2. Crie o arquivo `.env`  

Crie um arquivo chamado `.env` com o conteúdo abaixo e ajuste as variáveis conforme seu projeto:  

```bash  
# Configurações de domínio  
SITE_URL="https://ameopoema.com"  
DOMAIN="ameopoema.com"  

# Configurações do livro (mdBook)  
BOOK_TITLE="Ameopoema.com"  
BOOK_AUTHORS="Claude"  
BOOK_LANGUAGE="pt-br"  

# Configurações de saída HTML  
OUTPUT_HTML_DEFAULT_THEME="light"  
OUTPUT_HTML_PREFERRED_DARK_THEME="light"  

# Configurações do feed RSS  
FEED_TITLE="Ame o Poema"  
FEED_DESCRIPTION="Poesias do Nuvem, Poemas, Palíndromos e Haicais, talvez um podcast em algum momento"  
```  

> **Importante:** todas as variáveis são obrigatórias. O `install.sh` não será executado sem esse arquivo.  

## 3. Execute o instalador  

```bash  
chmod +x install.sh  
./install.sh  
```  

O instalador realiza automaticamente:  

- Leitura do `.env`.  
- Geração do `book.toml`.  
- Detecção da distribuição Linux.  
- Instalação de:  
  - Git  
  - Curl  
  - Build Essentials  
  - FFmpeg  
- Instalação do Rust.  
- Instalação do mdBook.  
- Permissão de execução para todos os scripts em `scripts/`.  
- Verificação da disponibilidade do `ffprobe` para inclusão da duração dos áudios no RSS.  

Ao final será exibida a mensagem:  

```text  
🎉 Instalação concluída!  

Use ./publish.sh para atualizar SUMMARY.md, corrigir quebras de linha,  
commitar alterações e publicar o site.  
```  

---  

# 📝 Personalizando o conteúdo  

Todos os arquivos Markdown ficam em:  

```text  
src/  
```  

O projeto já inclui:  

- `about.md`  
- `RSS.md`  
- `Capa.md`  

Novos posts podem ser criados simplesmente adicionando arquivos `.md` dentro de `src/`.  

O script `update-summary.sh` atualizará automaticamente o `SUMMARY.md`.  

---  

## Configuração do tema  

As configurações abaixo são controladas pelo `.env`:  

- título  
- autor  
- idioma  
- tema claro  
- tema escuro  

Após alterar o `.env`, execute novamente:  

```bash  
./install.sh  
```  

para regenerar o `book.toml`.  

---  

# 🔧 Publicação  

Execute:  

```bash  
./publish.sh  
```  

O script executa automaticamente:  

1. Carrega as variáveis do `.env`.  
2. Renomeia arquivos Markdown conforme seus títulos (`rename-files.sh`).  
3. Atualiza o `SUMMARY.md`.  
4. Corrige datas em blocos de citação.  
5. Corrige quebras de linha.  
6. Gera o site com:  

```bash  
mdbook build  
```  

7. Gera `blog.html` contendo todos os posts.  
8. Gera o feed RSS.  
9. Escreve o domínio personalizado nos arquivos `CNAME`.  
10. Executa `template.sh` (caso exista).  
11. Faz commit e envia tudo para o GitHub através de `git-push.sh`.  

---  

## GitHub Pages  

Configure o repositório em:  

```  
Settings → Pages  
```  

Selecione:  

```  
Branch: gh-pages  
```  

Após o push, o site ficará disponível em:  

```  
https://seu-usuario.github.io/seu-repositorio/  
```  

ou no domínio personalizado definido no `.env`.  

---  

# 🌐 Visualização local  

```bash  
mdbook serve --open  
```  

O servidor será iniciado em:  

```  
http://localhost:3000  
```  

Toda alteração nos arquivos Markdown será refletida automaticamente.  

---  

# 🗂 Estrutura do projeto  

```text  
.  
├── book/                  # Site gerado  
├── src/                   # Arquivos Markdown  
│   ├── about.md  
│   ├── RSS.md  
│   ├── Capa.md  
│   └── ...  
├── scripts/  
│   ├── fix-dates.sh  
│   ├── fix-line-breaks.sh  
│   ├── update-summary.sh  
│   ├── template.sh  
│   ├── rename-files.sh  
│   ├── create-blog.sh  
│   ├── generate-feed.sh  
│   └── git-push.sh  
├── .env  
├── book.toml  
├── install.sh  
├── publish.sh  
└── README.md  
```  

---  

# 🛠 Personalização avançada  

### Temas  

Adicione CSS personalizado na pasta:  

```text  
theme/  
```  

Depois ajuste a geração do `book.toml`.  

### Feed RSS  

O script `generate-feed.sh` utiliza os metadados do `.env`.  

Caso queira alterar o formato do feed, basta editar esse script.  

### Plugins  

Você pode instalar plugins como:  

- mdbook-toc  
- mdbook-mermaid  
- outros plugins compatíveis com mdBook  

Depois adicione-os ao `book.toml`.  

---  

# ❓ FAQ  

### Posso usar outro sistema operacional?  

O instalador foi testado em Debian, Ubuntu e Fedora. Em outras distribuições pode ser necessário adaptar os comandos de instalação.  

---  

### Preciso instalar Rust manualmente?  

Não.  

O `install.sh` instala Rust e mdBook automaticamente.  

---  

### Como adicionar novos posts?  

Crie um arquivo `.md` dentro de `src/`.  

A primeira linha deve ser um título Markdown:  

```md  
# Meu novo post  
```  

Durante a publicação:  

- o arquivo será renomeado conforme o título;  
- será incluído automaticamente no `SUMMARY.md`.  

---  

### O RSS não mostra a duração dos áudios.  

Verifique se `ffprobe` está disponível no sistema.  

Ele é instalado juntamente com o FFmpeg durante a instalação.  

---  

### Como mudar o domínio?  

Altere:  

```bash  
SITE_URL  
DOMAIN  
```  

no `.env` e execute novamente:  

```bash  
./publish.sh  
```  

---  


FavIcon by: <a href="https://www.favicon.cc/?action=icon_list&user_id=267435" title="blue feather">blue feather by sande570 </a>  

&nbsp;<br>​
&nbsp;<br>​
&nbsp;<br>​
&nbsp;<br>​
&nbsp;<br>​
