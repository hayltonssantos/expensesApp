import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final void Function(String) onRemove;

  TransactionList(this.transaction, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          420, //onrigatorio para ter scroll e o ListView puro cria todas as estancias ao mesmo tempo temos q eu usar o builder
      child: transaction.isEmpty? Column(
        children: <Widget>[
          Text(
            'Nenhuma Transação Cadastrada!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 20,), //espaçmento
          Container(
            height: 200,
            child: Image.asset('assets/images/waiting.png',
            fit: BoxFit.cover),
          )
        ],
        )  : ListView.builder(
        itemCount: transaction.length, //tamanho da lista em qnt
        itemBuilder: (ctx, index) { //constroi a lista conforme a necessidade
          final tr = transaction[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('R\$${tr.value}')
                    ),
                ),
              ),
            
              title: Text(
                tr.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(tr.date),
              ),
            
              trailing: Container(
                child: IconButton(
                  icon: Icon(
                    Icons.remove_circle_outlined,
                    color: Colors.red,
                  ),
                  onPressed: () => {
                    onRemove(tr.id)
                  },
                ),
              ),
            ),
          );
          
        }
      ),
    );
  }
}
