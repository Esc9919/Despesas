import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction tr;
  final void Function(String p1) onRemove;

  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black,
  ];

  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(colors.length);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor, //Theme.of(context).primaryColor,
          radius: 30,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                'R\$${widget.tr.value.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                onPressed: () => widget.onRemove(widget.tr.id),
                icon: const Icon(Icons.delete_forever),
                label: const Text(
                  'Excluir',
                  style: TextStyle(color: Colors.red),
                ),
              )
            : IconButton(
                onPressed: () => widget.onRemove(widget.tr.id),
                color: Colors.red,
                icon: const Icon(Icons.delete_forever),
              ),
      ),
    );
  }
}
