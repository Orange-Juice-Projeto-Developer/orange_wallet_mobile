class Convert {
  final _regex = RegExp(r'(?=(?:...)*$)');

  String currency({required valor}) {
    var str = valor.toStringAsFixed(2).split('.');

    final tratar = str[0].split(_regex);
    str[0] = tratar.join('.');

    return str.join(',');
  }
}
