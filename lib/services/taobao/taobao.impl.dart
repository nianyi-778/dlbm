import 'taobao.dart';
import 'package:dlbm/utils/request.dart';

class TaobaoServiceImpl implements TaobaoService {
  AxiosClient client = AxiosClient();

  @override
  Future<Map<String, dynamic>> taobaoList() async {
    Map<String, dynamic> result = await client.request(
      method: "get",
      url: '/taobao/material/recommend',
    );
    return result;
  }
}
