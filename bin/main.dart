import 'package:http/http.dart';

void main() {
  //print('Hello, World!');
  requestData();
}

requestData() {
  String url =
      'https://gist.githubusercontent.com/RogerReinheimer/e31e83040bc48977ae12c92f083cfcda/raw/a8888a28330a9647cc80893d043ae527ef01755f/accounts.json';
  Future<Response> futureResponse = get(Uri.parse(url));
  print(futureResponse);
  futureResponse.then(
    (Response response) {
      print(response);
      print(response.body);
    },
  );
}
