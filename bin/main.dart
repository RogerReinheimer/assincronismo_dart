import 'package:http/http.dart';
import 'dart:convert';

void main() {
  //requestData();
  //requestDataAsync();
  sendDataAsync({
    "id": "NEW001",
    "name": "Flutter",
    "lastName": "Dart",
    "balance": 5000,
  });
}

requestData() {
  String url =
      'https://gist.githubusercontent.com/RogerReinheimer/e31e83040bc48977ae12c92f083cfcda/raw/a8888a28330a9647cc80893d043ae527ef01755f/accounts.json';
  Future<Response> futureResponse = get(Uri.parse(url));
  print(futureResponse);

  //agendamento do 'future', se tiver mais passos fora desse 'THEN' ele vai executar primeiro
  futureResponse.then((Response response) {
    print(response);
    print(response.body);
    List<dynamic> listAccounts = json.decode(response.body);
    Map<String, dynamic> mapCarla = listAccounts.firstWhere(
      (element) => element['name'] == 'Carla',
    );
    print(mapCarla['balance']);
  });

  //essa parte vai ser executada antes do 'then'
  print('last thing a do in the funcion');
}


//essa funcao vai ser diferente, pois ela vai esperar o resultado da requisicao
Future<List<dynamic>> requestDataAsync() async {
  String url =
      'https://gist.githubusercontent.com/RogerReinheimer/e31e83040bc48977ae12c92f083cfcda/raw/a8888a28330a9647cc80893d043ae527ef01755f/accounts.json';
  Response response = await get(Uri.parse(url));
  return json.decode(response.body);
}


//
sendDataAsync(Map<String, dynamic> mapAccount) async {
  List<dynamic> listAccounts = await requestDataAsync();
  listAccounts.add(mapAccount);
  String content = json.encode(listAccounts);
  
  String url =
      'https://gist.githubusercontent.com/RogerReinheimer/e31e83040bc48977ae12c92f083cfcda/raw/a8888a28330a9647cc80893d043ae527ef01755f/accounts.json';

  Response response = await post(Uri.parse(url), body: content);
  print(response.statusCode);
}


  // todo retorno de uma funcao async eh um 'Future'