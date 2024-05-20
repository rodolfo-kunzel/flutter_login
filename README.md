# Aplicativo de Login e Registro em Flutter
Este projeto é um aplicativo de login e registro desenvolvido em Flutter, utilizando a API Reqres para operações de login, registro, logout e consulta de informações de usuário. No entanto, devido a algumas limitações impostas pela API, foram necessárias adaptações específicas:

Registro e Login: A API Reqres permite apenas o registro e login de usuários pré-definidos. Para superar essa limitação e demonstrar a funcionalidade completa do aplicativo, foi implementado um sistema que aceita qualquer credencial válida (e-mail e senha validados no front-end) para efetuar o login. Isso permite que a aplicação não se restrinja apenas a um usuário padrão.

Validação de Login: Para simular a validação de login, as credenciais enviadas para um endpoint genérico da API retornam um ID fictício. Esse ID é utilizado para ilustrar a interação com a API e garantir que o fluxo de login funcione como esperado.

Registro de Usuário: Embora a API só permita o registro de usuários pré-definidos, essa funcionalidade foi mantida para mostrar a interação com a API, usando um usuário padrão para registro. (Usuário Padrão => usuário: eve.holt@reqres.in senha: pistol)

Tela Inicial: Após o login, a tela inicial exibe informações de um usuário genérico retornado pela API. Isso garante que sempre haja dados de um usuário exibidos, mesmo que a validação do login seja fictícia.


# Funcionalidades do Aplicativo
## Login
Permite que o usuário faça login com qualquer email e senha válidos, mesmo que a API Reqres não registre novos usuários. Isso foi implementado para proporcionar uma experiência de uso mais ampla e não se restringir a um único usuário padrão.

## Registro
Oferece uma interface para registro de novos usuários. Devido às limitações da API Reqres, apenas usuários pré-definidos podem ser registrados. Essa funcionalidade foi mantida para demonstrar a interação com a API.

## Exibição de Usuário
Após o login, um usuário aleatório já existente na API é exibido na página inicial. Isso garante que sempre haja dados de um usuário disponíveis para visualização, demonstrando a capacidade da aplicação de buscar e exibir informações do usuário.

## Troca de Tema (Light/Dark Mode)
Permite alternar entre os temas claro e escuro. No topo de todas as telas do aplicativo, há um botão de ícone que permite a troca do tema, proporcionando uma melhor experiência visual de acordo com a preferência do usuário.

## Logout
Permite que o usuário saia da aplicação. Ao clicar no botão de logout, o usuário é desconectado e redirecionado para a página inicial do aplicativo


# Estrutura do Projeto
O projeto é dividido em quatro camadas: Data, Domain, Presentation e Core.

## Camada Data
A camada Data é responsável por gerenciar todas as operações de dados, incluindo chamadas de API e conversões de dados. Esta camada inclui:

- Data Sources: No caso desta aplicação é apenas a API.
- DTOs: Objetos usados para transferir dados entre as camadas.
- Repositories: Implementações dos repositórios que interagem com as fontes de dados.

## Camada Domain
A camada Domain contém a lógica de negócios e as regras da aplicação. Esta camada inclui:

- Entities: Objetos que representam os dados principais da aplicação.
- Use Cases: Casos de uso que encapsulam as regras de negócios e interagem com os repositórios.

## Camada Presentation
A camada Presentation é responsável pela interface do usuário e pela interação do usuário com a aplicação. Esta camada inclui:

- Pages: Telas da aplicação, como a tela de login, tela de registro e tela inicial.
- Widgets: Componentes reutilizáveis da interface do usuário.
- Bloc: Gerenciamento de estado usando o padrão BLoC.

## Camada Core
A camada Core contém funcionalidades e utilitários compartilhados entre as outras camadas, como:

- Constants: Constantes usadas em toda a aplicação.
- Exceptions: Exceções personalizadas para tratamento de erros.
- Service Locator: Configuração de injeção de dependência.


# Gerenciamento de Estado com Bloc

O padrão Bloc foi escolhido para gerenciar o estado da aplicação devido aos seguintes benefícios:

## Separação de Interesses
O Bloc promove uma clara separação de interesses, dividindo a lógica de negócios e a interface do usuário em componentes distintos. Isso significa que a lógica de negócios, que pode ser complexa, não está diretamente misturada com o código de interface do usuário. Em vez disso, ela é encapsulada em blocos, que podem ser facilmente testados de forma isolada.

## Escalabilidade
A arquitetura Bloc é escalável, e permite que novos recursos/funcionalidades sejam adicionados à aplicação sem complicar o código existente. Como a lógica de negócios está encapsulada em blocos independentes, é simples adicionar novos blocos ou modificar blocos existentes sem afetar a interface do usuário. 


# Injeção de Dependencias com GetIt

Escolhi utilizar o GetIt para Injeção de dependencias pelas seguintes vantagens:

## Simplicidade e Eficiência
O Get It oferece uma maneira simples e eficiente de gerenciar dependências, sua sintaxe facilita o registro e a resolução de dependências, tornando o código mais compreensível e organizado.

## Modularidade e Escalabilidade
Ajuda na estruturação de um projeto modular, facilitando a adição de novos módulos e funcionalidades

# Testes Unitários
Neste projeto, utilizei a biblioteca mockito para criar mocks das dependências e testar os casos de uso e a camada de dados.

## Para executar os testes unitários

- Instalação das Dependências de Teste
```yaml
    dev_dependencies:
        mockito: ^5.0.16
        build_runner: ^2.1.7
```

- Criação dos Mocks
```sh
    flutter pub run build_runner build
```

- Execução dos Testes
```sh
    flutter test
```