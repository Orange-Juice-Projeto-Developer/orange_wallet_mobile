class Convert {

  static String currency({required valor}) {

    final regex = RegExp(r'(?=(?:...)*$)');
    
    var str = valor.toStringAsFixed(2).split('.');

    final tratar = str[0].split(regex);
    str[0] = tratar.join('.');

    return str.join(',');
  }
}
