import Foundation

/*  Link:
  https://drive.google.com/file/d/17D42CgUf0ZLJ_Z3lTjDEvrqKanWpdt2Y/view
*/

/*============================= PROGRAMAÇÃO ORIENTADA A OBJETOS ==========================*/
//--------------------------------------- Protocolo ---------------------------------------
/*
  Os protocolos são uma maneira de descrever quais propriedades e métodos algo deve
ter. Você então informa ao Swift quais tipos usam esse protocolo – um processo
conhecido como adoção ou conformidade com um protocolo.
Por exemplo, podemos escrever uma função que aceita algo com uma propriedade id ,
mas não nos importamos precisamente com o tipo de dado usado. Começaremos
criando um protocolo Identifiable , que exigirá que todos os tipos em conformidade
tenham uma string de id que possa ser lida (“get”) ou escrita (“set”):
*/
// protocol Identifiable {
//   var id: String { get set }
// }

// /*
//   Não podemos criar instâncias desse protocolo - é uma descrição, não um tipo por si só.
// Mas podemos criar uma estrutura que esteja de acordo com ela:
// */
// struct User: Identifiable {
//   var id: String
// }

// // Por fim, escreveremos uma função displayID() que aceita qualquer objeto
// // Identifiable :
// func displayID(thing: Identifiable) {
//   print("My ID is \(thing.id)")
// }

//---------------------------------------------------------------------------------------
/*
  Um protocolo pode herdar de outro em um processo conhecido como herança de
protocolo. Ao contrário das classes, você pode herdar de vários protocolos ao mesmo
tempo antes de adicionar suas próprias personalizações.
Vamos definir três protocolos: Payable requer tipos em conformidade para implementar
um método calculateWages() , NeedsTraining requer tipos em conformidade para
implementar um método study() e HasVacation requer tipos em conformidade para
implementar um método takeVacation():
*/
// protocol Payable {
//   func calculateWages() -> Int
// }
// protocol NeedsTraining {
//   func study()
// }
// protocol HasVacation {
//   func takeVacation(days: Int)
// }

// // Agora podemos criar um único protocolo de Employee que os reúne em um protocolo.
// // Não precisamos adicionar nada no topo, então vamos apenas escrever chaves de
// // abertura e fechamento:

// protocol Employee: Payable, NeedsTraining, HasVacation { }

// Agora podemos fazer com que novos tipos estejam em conformidade com esse único
// protocolo, em vez de cada um dos três protocolos individuais.

//---------------------------------------------------------------------------------------
/*
  As extensões permitem que você adicione métodos a tipos existentes, para fazê-los
fazer coisas para as quais não foram originalmente projetados.
Por exemplo, poderíamos adicionar uma extensão ao tipo Int para que ele tenha um
método squared() que retorne o número atual multiplicado por ele mesmo:
*/
// extension Int {
//   func squared() -> Int {
//     return self * self
//   }
// }

// // Para tentar isso, basta criar um inteiro e você verá que agora tem um método
// // squared() :

// let number = 8
// number.squared()

/*
  O Swift não permite adicionar propriedades armazenadas em extensões, portanto, você
deve usar propriedades computadas. Por exemplo, poderíamos adicionar uma nova
propriedade computada isEven a inteiros que retorna true se contiver um número par:
*/
// extension Int {
//   var isEven: Bool {
//     return self % 2 == 0
//   }
// }