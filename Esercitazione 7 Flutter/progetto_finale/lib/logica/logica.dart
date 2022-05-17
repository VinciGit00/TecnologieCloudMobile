import 'package:http/http.dart' as http;

Future<void> postData(String text) async {
  var response = await http.post(
    Uri.parse(
        "https://tkwzligz16.execute-api.us-east-1.amazonaws.com/POSTPROJECT"),
    body: text,
  );

  if (response.statusCode == 200) {
    print("---------------------------------------------");
    print(response.body);
    print("---------------------------------------------");
  } else {
    print("---------------------------------------------");
    print(response.statusCode.toString());
    print("---------------------------------------------");
  }
}

Future<String> getData() async {
  var response = await http.get(
    Uri.parse(
        "https://ug23pnnj6b.execute-api.us-east-1.amazonaws.com/GETPROJECT"),
    headers: {"authorizationToken": 'abc123'},
  );

  if (response.statusCode == 200) {
    String res = response.body;
    res = res.replaceAll(RegExp(r'\\n'), "\n");
    res = res.replaceAll(RegExp(r'\\'), "");
    return res;
  } else {
    return response.statusCode.toString();
  }
}
