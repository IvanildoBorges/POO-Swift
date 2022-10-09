import Foundation

/*  Link:
  https://drive.google.com/file/d/1Eb9uIqZgq1dwZerQYx8XdMQa8ittfNR5/view
*/

/*============================= PROGRAMAÇÃO ORIENTADA A OBJETOS ==========================*/
//--------------------------------------- Structs ----------------------------------------
/*
  Estruturas podem receber suas próprias variáveis e constantes, e suas próprias funções, 
então criadas e usadas como você quiser.
*/
// struct Sport {
//   var name: String
//   var categoria: String
// }

// var tennis = Sport(name: "tênis", categoria: "adulto")
// print("Seu esporte é \(tennis.name) e sua categoria é \(tennis.categoria)")

// //Usando a varivael do struct como variavel regular
// tennis.name = "Lawn tennis"

//---------------------------------------------------------------------------------------
/*
  Que tem uma propriedade name que armazena uma String . Elas são chamadas de
propriedades armazenadas, porque o Swift tem um tipo diferente de propriedade
chamada propriedade computada – uma propriedade que executa código para
descobrir seu valor.
*/
// struct Sport {
//   var name: String
//   var isOlympicSport: Bool
  
//   var olympicStatus: String {
//     if isOlympicSport {
//       return "\(name) is an Olympic sport"
//     } else {
//       return "\(name) is not an Olympic sport"
//     }
//   }
// }

// let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
// print(chessBoxing.olympicStatus)

//---------------------------------------------------------------------------------------
/*
  Os observadores de propriedade permitem que você execute o código antes ou depois
de qualquer alteração de propriedade.  O que queremos que aconteça é que o Swift imprima uma mensagem toda vez que a quantidade mudar, e podemos usar um observador de propriedade didSet para isso. Isso executará algum código toda vez que a quantidade for alterada:
*/
// struct Progress {
//   var task: String
//   var amount: Int {
//       didSet {
//           print("\(task) is now \(amount)% complete")
//       }
//   }
// }

// //Agora podemos criar uma instância dessa estrutura e ajustar seu progresso ao longo
// //do tempo:
// var progress = Progress(task: "Loading data", amount: 0)
// progress.amount = 30
// progress.amount = 80
// progress.amount = 100

//---------------------------------------------------------------------------------------
/*
  Os structs podem ter funções dentro deles, e essas funções podem usar as
propriedades do struct conforme necessário. Funções dentro de estruturas são
chamadas de métodos, mas ainda usam a mesma palavra-chave func.

  Podemos demonstrar isso com uma estrutura City . Isso terá uma propriedade de
population que armazena quantas pessoas estão na cidade, além de um método
collectTaxes() que retorna a contagem de população multiplicada por 1000. Como o
método pertence a City , ele pode ler a propriedade de population da cidade atual.
Aqui está o código:
*/
// struct City {
//   var population: Int
//   func collectTaxes() -> Int {
//     return population * 1000
//   }
// }

// //Esse método pertence ao struct , então o chamamos em instâncias do struct assim:
// let london = City(population: 9_000_000)
// print(london.collectTaxes())

//---------------------------------------------------------------------------------------
/*
  Se uma estrutura tem uma propriedade variável, mas a instância da estrutura foi criada
como uma constante, essa propriedade não pode ser alterada – a estrutura é
constante, portanto, todas as suas propriedades também são constantes,
independentemente de como foram criadas.
  O problema é que quando você cria o struct o Swift não tem ideia se você vai usá-lo
com constantes ou variáveis, então por padrão ele usa a abordagem segura: o Swift
não vai deixar você escrever métodos que alteram propriedades a menos que você
solicite especificamente.
  Quando você deseja alterar uma propriedade dentro de um método, você precisa
marcá-la usando a palavra-chave mutating , assim:
*/
// struct Person {
//   var name: String
//   mutating func makeAnonymous() {
//     name = "Anonymous"
//   }
// }

// // Por alterar a propriedade, o Swift só permitirá que esse método seja chamado em
// //instâncias de Person que são variáveis:
// var person = Person(name: "Ed")
// //print(person.name)
// person.makeAnonymous()
// print(person.name)

//---------------------------------------------------------------------------------------
/*
  Inicializadores são métodos especiais que fornecem maneiras diferentes de criar sua
estrutura. Todos os structs vêm com um por padrão, chamado de inicializador de
membro – isso solicita que você forneça um valor para cada propriedade ao criar o
struct. Você pode ver isso se criarmos uma estrutura User que tenha uma propriedade:
*/
// struct User {
//   var username: String
// }

// //Quando criamos uma dessas estruturas, devemos fornecer um nome de usuário:
// var user = User(username: "twostraws")

/*
  Podemos fornecer nosso próprio inicializador para substituir o padrão. Por exemplo,
podemos querer criar todos os novos usuários como “Anônimos” e imprima uma
mensagem, como esta:
*/
// struct User {
//   var username: String
//   init() {
//     username = "Anonymous"
//     print("Creating a new user!")
//   }
// }

// /*
//   Você não escreve func antes dos inicializadores, mas precisa garantir que todas as
// propriedades tenham um valor antes que o inicializador termine.
// Agora nosso inicializador não aceita parâmetros, precisamos criar a estrutura assim:
// */
// var user = User()
// user.username = "twostraws"

//---------------------------------------------------------------------------------------
/*
  Dentro dos métodos, você obtém uma constante especial chamada self , que aponta
para qualquer instância da estrutura que está sendo usada no momento. Esse valor
self é particularmente útil quando você cria inicializadores que têm os mesmos 
nomes de parâmetro que sua propriedade. Por exemplo, se você cria uma estrutura
Person com uma propriedade name e tenta escrever um inicializador que aceita um 
parâmetro name, self ajuda a distinguir entre a propriedade e o parâmetro – 
self.name se refere à propriedade, enquanto name se refere à propriedade 
parâmetro.
Aqui está isso no código:
*/
// struct Person {
//   var name: String
//   init(name: String) {
//     print("\(name) was born!")
//     self.name = name
//   }
// }

//---------------------------------------------------------------------------------------
/*
  Todas as propriedades e métodos que criamos até agora pertenceram a instâncias
individuais de structs, o que significa que se tivéssemos uma struct Student
poderíamos criar várias instâncias de estudantes, cada uma com suas próprias
propriedades e métodos:
*/
// // struct Student {
// //   var name: String
// //   init(name: String) {
// //     self.name = name
// //   }
// // }
// // let ed = Student(name: "Ed")
// // let taylor = Student(name: "Taylor")

// /*
//   Você também pode pedir ao Swift para compartilhar propriedades e métodos
// específicos em todas as instâncias do struct declarando-os como estáticos.
// Para testar isso, adicionaremos uma propriedade estática à estrutura Student para
// armazenar quantos alunos estão na classe. Cada vez que criamos um novo aluno,
// adicionamos um a ele:
// */
// struct Student {
//   static var classSize = 0
//   var name: String
//   init(name: String) {
//     self.name = name
//     Student.classSize += 1
//   }
// }

// /*
//   Como a estrutura classSize pertence à própria estrutura e não às instâncias da
// estrutura, precisamos lê-la usando Student.classSize :
// */
// print(Student.classSize)

//---------------------------------------------------------------------------------------
/*
  O controle de acesso permite restringir qual código pode usar propriedades e métodos.
Isso é importante porque você pode querer impedir que as pessoas leiam uma
propriedade diretamente, por exemplo.
Poderíamos criar uma estrutura Person que tenha uma propriedade id para armazenar
seu número de seguro social:
*/
// // struct Person {
// //   var id: String
// //   init(id: String) {
// //     self.id = id
// //   }
// // }
// // let ed = Person(id: "12345")

// /*
//   Depois que essa pessoa for criada, podemos tornar seu id privado para que você não
// possa lê-lo de fora do struct - tentar escrever ed.id simplesmente não funcionará.
// Basta usar a palavra-chave private , assim:
// */
// struct Person {
//   private var id: String
//   init(id: String) {
//     self.id = id
//   }
// }

// //Agora apenas métodos dentro de Person podem ler a propriedade id. Por exemplo:
// struct Person {
//   private var id: String
//   init(id: String) {
//     self.id = id
//   }
//   func identify() -> String {
//     return "My social security number is \(id)"
//   }
// }

// let ed = Person(id: "12345")
// print(ed.identify())

//Outra opção comum é public , que permite que todos os outros códigos usem a
//propriedade ou método.