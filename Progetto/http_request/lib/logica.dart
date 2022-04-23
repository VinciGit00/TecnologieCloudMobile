import 'package:http/http.dart' as http;

Future<void> postData(String text) async {

  var response = await http.post(
    Uri.parse("https://kv5epkkf2c.execute-api.us-east-1.amazonaws.com/PostPROVA"),
    headers: {},
    body: text,
  );

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print(response.statusCode.toString());
  }
}

Future<String> getData() async {
  var response = await http.get(
    Uri.parse("https://y3od21zbh9.execute-api.us-east-1.amazonaws.com/test/customer"),
    headers: {"authorizationToken": 'abc123'},
  );

  if (response.statusCode == 200) {
    String res = response.body;
    res = res.replaceAll(RegExp(r'\\n'), "\n");
    res = res.replaceAll(RegExp(r'\\'), "");
    res = res.replaceAll(RegExp(r'"'), "");
    return res;
  } else {
    return response.statusCode.toString();
  }
}
