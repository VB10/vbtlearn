import 'package:flutter/material.dart';

class IncrementProductCard extends StatefulWidget {
  final Function(int count) onChange;
  final VoidCallback onProductClear;

  const IncrementProductCard({Key key, @required this.onChange, this.onProductClear}) : super(key: key);
  @override
  _IncrementProductCardState createState() => _IncrementProductCardState();
}

class _IncrementProductCardState extends State<IncrementProductCard> {
  int count = 0;

  bool isIncrement;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        decoration: buildBoxDecoration(),
        child: buildRowIncrement(),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: isIncrement != null && isIncrement ? Colors.green : Colors.red,
      border: Border.all(width: 3, color: Colors.black12),
      borderRadius: BorderRadius.circular(15));

  Row buildRowIncrement() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(icon: Icon(Icons.add), onPressed: () => countCalculate(true)),
        Text("$count"),
        IconButton(icon: Icon(Icons.remove), onPressed: () => countCalculate(false)),
      ],
    );
  }

  void countCalculate(bool isIncrement) {
    if (isIncrement)
      count++;
    else
      count--;

    setState(() {
      this.isIncrement = isIncrement;
    });
    if (count <= 0) {
      widget.onProductClear();
    } else {
      widget.onChange(count);
    }
  }
}
