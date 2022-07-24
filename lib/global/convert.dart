// Classe específica para conversão de valores utilizada no app

class Convert {

  // Função que converte qualquer valor double para o valor da moeda corrente, 
  // com as devidas pontuações e vírgulas, com a utilização de RegExp para 
  // definir o split

  static String currency({required double valor}) {
    final regex = RegExp(r'(?=(?:...)*$)');

    var str = valor.toStringAsFixed(2).split('.');

    final tratar = str[0].split(regex);
    str[0] = tratar.join('.');

    return str.join(',');
  }

  // Função que aplica tratamento à data capturada pelo banco de dados, a fim
  // de mostrar dia e mês quando a data é do ano corrente, ou mostrar a data
  // completa no caso de a transação ser de outro ano
  
  static String date({required String date}) {
    // Formato recebido do back-end:
    // "date": "2022-07-09T00:17:54.575Z"

    // Converte o double para string, já separando dia, mês e ano para fins de
    // comparação
    var dateString =
        date.toString().substring(0, 10).split('-').reversed.toList();
    
    // Recupera a data atual para comparação
    var currentDate =
        DateTime.now().toString().substring(0, 10).split('-').reversed.toList();

    // Verifica se o ano da transação é o ano corrente
    if (dateString[2] == currentDate[2]) {
      // Se for, remove o ano da lista
      dateString.removeAt(2);
      // Verifica o mês e o substitui ele escrito por extenso
      switch (dateString[1]) {
        case '01':
          dateString[1] = 'de janeiro';
          break;
        case '02':
          dateString[1] = 'de fevereiro';
          break;
        case '03':
          dateString[1] = 'de março';
          break;
        case '04':
          dateString[1] = 'de abril';
          break;
        case '05':
          dateString[1] = 'de maio';
          break;
        case '06':
          dateString[1] = 'de junho';
          break;
        case '07':
          dateString[1] = 'de julho';
          break;
        case '08':
          dateString[1] = 'de agosto';
          break;
        case '09':
          dateString[1] = 'de setembro';
          break;
        case '10':
          dateString[1] = 'de outubro';
          break;
        case '11':
          dateString[1] = 'de novembro';
          break;
        default:
          dateString[1] = 'de dezembro';
          break;
      }
    } else {
      // Junta a data com o ano para usar no app
      return dateString.join('/');
    }
    // Junta a data sem o ano para utilizar no app
    return dateString.join(' ');
  }
}
