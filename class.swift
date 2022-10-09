import Foundation

/*  Link:
  https://drive.google.com/file/d/13EDHrtqkDB5VGk69Fo023voX2NdNXNM1/view
*/

/*============================= PROGRAMAÇÃO ORIENTADA A OBJETOS ==========================*/
//--------------------------------------- Classes ----------------------------------------

/*
  As classes são semelhantes a structs, pois permitem que você crie novos tipos com
propriedades e métodos, mas elas têm cinco diferenças importantes e vou orientá-lo
em cada uma dessas diferenças, uma de cada vez.
A primeira diferença entre classes e structs é que as classes nunca vêm com um
inicializador de membro. Isso significa que, se você tiver propriedades em sua classe,
deverá sempre criar seu próprio inicializador.
Por exemplo:
*/
// class Dog {
//   var name: String
//   var breed: String
//   init(name: String, breed: String) {
//     self.name = name
//     self.breed = breed
//   }
// }

// //Criar instâncias dessa classe parece exatamente como se fosse uma estrutura:

// let poppy = Dog(name: "Poppy", breed: "Poodle")
// print(poppy.name, poppy.breed)

/*
  A segunda diferença entre classes e structs é que você pode criar uma classe baseada
em uma classe existente – ela herda todas as propriedades e métodos da classe
original e pode adicionar suas próprias no topo.
Isso é chamado de herança de classe ou subclasse, a classe da qual você herda é
chamada de classe “pai” ou “super”, e a nova classe é chamada de classe “filho”.
Aqui está a classe Dog que acabamos de criar:
*/
// class Dog {
//   var name: String
//   var breed: String
//   init(name: String, breed: String) {
//     self.name = name
//     self.breed = breed
//   }
// }

/*
  Poderíamos criar uma nova classe baseada naquela chamada Poodle . Ele herdará as
mesmas propriedades e inicializador que o Dog por padrão:
*/
// class Poodle: Dog { }

/*
  No entanto, também podemos dar ao Poodle seu próprio inicializador. Sabemos que
sempre terá a raça “Poodle”, para que possamos fazer um novo inicializador que
precise apenas de uma propriedade name . Melhor ainda, podemos fazer o inicializador
do Poodle chamar o inicializador do Dog diretamente para que aconteça a mesma
configuração:
*/
// class Poodle: Dog {
//   init(name: String) {
//     super.init(name: name, breed: "Poodle")
//   }
// }

/*
  Por motivos de segurança, o Swift sempre faz você chamar super.init() de classes
filhas – caso a classe pai faça algum trabalho importante quando for criada.
*/

//---------------------------------------------------------------------------------------
/*
  As classes filhas podem substituir os métodos pai por suas próprias implementações –
um processo conhecido como substituição. Aqui está uma classe Dog trivial com um
método makeNoise() :
*/
// // class Dog {
// //   func makeNoise() {
// //     print("Woof!")
// //   }
// // }
// /*
//   Se criarmos uma nova classe Poodle que herda de Dog , ela herdará o método
// makeNoise() . Então, isso imprimirá “Woof!”:
// */
// // class Poodle: Dog { }
// // let poppy = Poodle()
// // poppy.makeNoise()

// /*
//   A substituição do método nos permite alterar a implementação de makeNoise() para a
// classe Poodle .
// O Swift exige que usemos override func em vez de apenas func ao substituir um
// método - isso impede que você substitua um método por acidente, e você receberá um
// erro se tentar
// substituir algo que não existe na classe pai:
// */
// class Poodle: Dog {
//   override func makeNoise() {
//     print("Yip!")
//   }
// }
// let poppy = Poodle()
// poppy.makeNoise()
//Com essa alteração, poppy.makeNoise() imprimirá “Yip!” em vez de “Uau!”.

//---------------------------------------------------------------------------------------
/*
  Embora a herança de classe seja muito útil – e de fato grande parte das plataformas da
Apple exijam que você a use – às vezes você deseja impedir que outros
desenvolvedores construam sua própria classe com base na sua.
Swift nos dá uma palavra-chave final apenas para este propósito: quando você
declara uma classe como final, nenhuma outra classe pode herdar dela. Isso significa
que eles não podem substituir seus métodos para alterar seu comportamento – eles
precisam usar sua classe do jeito que foi escrita.
Para tornar uma classe final , basta colocar a palavra-chave final antes dela, assim:
*/
// final class Dog {
//   var name: String
//   var breed: String
//   init(name: String, breed: String) {
//     self.name = name
//     self.breed = breed
//   }
// }

//---------------------------------------------------------------------------------------
/*
  A terceira diferença entre classes e structs é como elas são copiadas. Quando você
copia um struct, tanto o original quanto a cópia são coisas diferentes – mudar um não
mudará o outro. Quando você copia uma classe, tanto a original quanto a cópia
apontam para a mesma coisa, portanto, alterar uma altera a outra.
Por exemplo, aqui está uma classe Singer simples que tem uma propriedade name com
um valor padrão:
*/
// class Singer {
//   var name = "Taylor Swift"
// }

// //Se criarmos uma instância dessa classe e imprimirmos seu nome, obteremos “TaylorSwift”:
// var singer = Singer()
// print(singer.name)

// //Agora vamos criar uma segunda variável a partir da primeira e alterar seu nome:
// var singerCopy = singer
// singerCopy.name = "Justin Bieber"

// /*
//   Devido à forma como as classes funcionam, tanto singer quanto singerCopy apontam
// para o mesmo objeto na memória, então quando imprimirmos o nome do cantor
// novamente veremos “Justin Bieber”:
// */
// print(singer.name)

/*
  Por outro lado, se Singer fosse uma estrutura, teríamos “Taylor Swift” impresso uma
segunda vez:
*/
// struct Singer {
//   var name = "Taylor Swift"
// }

//---------------------------------------------------------------------------------------
/*
  A quarta diferença entre classes e structs é que as classes podem ter
desinicializadores – código que é executado quando uma instância de uma classe é
destruída.
Para demonstrar isso, aqui está uma classe Person com uma propriedade name , um
inicializador simples e um método printGreeting() que imprime uma mensagem:
*/
// class Person {
//   var name = "John Doe"
//   init() {
//     print("\(name) is alive!")
//   }
//   func printGreeting() {
//     print("Hello, I'm \(name)")
//   }
// }

// /*
//   Vamos criar algumas instâncias da classe Person dentro de um loop, porque cada vez
// que o loop dá uma volta, uma nova pessoa será criada e destruída:
// */
// for _ in 1...3 {
//   let person = Person()
//   person.printGreeting()
// }

/*
  E agora para o desinicializador. Isso será chamado quando a instância Person estiver
sendo destruída:
*/
// class Person {
//   var name = "John Doe"
//   init() {
//     print("\(name) is alive!")
//   }
//   deinit {
//     print("\(name) is no more!")
//   }
//   func printGreeting() {
//     print("Hello, I'm \(name)")
//   }
// }

// for _ in 1...3 {
//   let person = Person()
//   person.printGreeting()
// }