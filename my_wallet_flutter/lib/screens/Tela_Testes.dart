// import 'package:flutter/material.dart';

// class ListaTransferencia extends StatefulWidget {

//   @override
//   State<StatefulWidget> createState() {
//     return ListaDeTransferenciaState();
//   }
// }

// class ListaDeTransferenciaState extends State<ListaTransferencia> {

//   final List<Transferencia> _transferencias = [];
  
//   @override
//   Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//         title: const Text("Wy Wallet"),
//       ),
//     body:
//       ListView.builder(
//         itemCount: _transferencias.length,
//         itemBuilder: (context, indice) {
//           final transferenciaFeita = _transferencias[indice];
//           return ItemTranferencia(transferenciaFeita);
//         },
//       ),
//      floatingActionButton: FloatingActionButton(
//       child: const Icon(Icons.add),
//       onPressed: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return Formulario();
//         })).then(
//           (transferenciaRecebida) {
//             setState(() {
//             _transferencias.add(transferenciaRecebida);
//             });
//             debugPrint('Criando transferência');
//           },
//         );
//       },
//     ),
//   );
//   }
// }

// class ItemTranferencia extends StatelessWidget {

// final Transferencia _transferencia;

//   const ItemTranferencia(this._transferencia, {super.key});
  
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//      child: 
//         ListTile(
//           leading: const Icon(Icons.monetization_on),
//           title: Text(_transferencia.valor.toString()),
//           subtitle: Text(_transferencia.conta.toString()),
//         )
//     );
//   }
// }

// class Transferencia {
//   final double valor;
//   final String conta;

//   Transferencia(this.valor, this.conta);
// }

// class Formulario extends StatelessWidget {

//   final TextEditingController _controladorNomeConta = TextEditingController();
//   final TextEditingController _controladorValorTransferencia = TextEditingController();

//   Formulario({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("Formulario para Transferencia"),
//         ),
//       body:
//          Column(
//               children: [
//                 EditorDeTexto(
//                     controlador: _controladorNomeConta,
//                     nomeCampo: "Nome da conta",
//                     dica: "Joãozinho",
//                     ),
//                 EditorDeTexto(
//                     controlador: _controladorValorTransferencia,
//                     nomeCampo: "Valor da Transferencia",
//                     dica: "0.00",
//                     icone: Icons.monetization_on,
//                     ),
//                 ElevatedButton(
//                   onPressed: () {
//                     _criarTransferencia(context);
//                     },
//                   child: const Text("Confirmar"),
//                   ),
//               ],
//             ),
//     );
//   }

//   void _criarTransferencia(BuildContext context) {
//     final String? nomeConta = _controladorNomeConta.text;
//     final double? valorTransferencia =
//         double.tryParse(_controladorValorTransferencia.text);
//     if (nomeConta != null && valorTransferencia != null) {
//       final transferenciaCriada = Transferencia(valorTransferencia, nomeConta);
//       Navigator.pop(context, transferenciaCriada);
//     }
//   }
// }

// class EditorDeTexto extends StatelessWidget {
//   const EditorDeTexto({super.key, required this.controlador, required this.nomeCampo, required this.dica, this.icone});

//   final TextEditingController controlador;
//   final String nomeCampo;
//   final String dica;
//   final IconData? icone;

//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//               padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
//               child: TextField(
//                 controller: controlador,
//                 style: const TextStyle(
//                   fontSize: 24.00
//                 ),
//                 decoration: InputDecoration(
//                   icon:icone != null ? Icon(icone) : null,
//                   labelText: nomeCampo,
//                   hintText: dica,
//                 ),
//               ),
//             );
//   }
// }