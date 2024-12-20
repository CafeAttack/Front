import 'package:cafe_attack/dio_client.dart';
import 'package:cafe_attack/model/MemberMenuModel.dart';
import 'package:get/get.dart';
import 'package:cafe_attack/MetaData.dart' as customMeta;

class MemberMenuController extends GetxController{
  var Membermenu = MemberMenuModel().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMemberMenuFromJson();
  }

  void fetchMemberMenuFromJson() async {
    try{
      isLoading(true);
      int currentMemberId = customMeta.MetaData.memberId;

      print("현재 멤버 ID: $currentMemberId");

      var response = await DioClient.getRequest("/member/$currentMemberId/menu");
      if(response.statusCode == 200){
        Membermenu.value = MemberMenuModel.fromJson(response.data);
      }
      print("memberMenuData: ${Membermenu.value.data}");
      isLoading(false);
    }catch(e){
      print("Error: $e");
    }
  }
}