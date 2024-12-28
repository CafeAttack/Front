import 'package:cafe_attack/dio_client.dart';
import 'package:cafe_attack/model/EditrecordModel.dart';
import 'package:cafe_attack/MetaData.dart' as customMeta;

class Editrecordcontroller {
  int currentMemberId = customMeta.MetaData.memberId; // 현재 사용자 ID
  /// 새로운 기록 생성
  Future<bool> createNewRecord(int cafeId, Editrecordmodel record) async {
    try {
      // 엔드포인트 설정
      String endpoint = '/record/$currentMemberId/$cafeId/new';

      // POST 요청
      var response = await DioClient.postRequest(endpoint, record.toJson());

      // 상태 코드 확인
      if (response.statusCode == 200) {
        print('새로운 기록 생성 성공: ${response.data}');
        return true;
      } else {
        print(
            '새로운 기록 생성 실패: ${response.statusCode} - ${response.statusMessage}');
        return false;
      }
    } catch (e) {
      print('기록 생성 에러: $e');
      return false;
    }
  }

  /// 기존 기록 수정
  Future<bool> updateExistingRecord(
      int cafeId, int visitId, Editrecordmodel updatedRecord) async {
    try {
      // 엔드포인트 설정
      String endpoint = '/record/$currentMemberId/$cafeId/$visitId';

      // PUT 요청
      var response =
          await DioClient.patchRequest(endpoint, updatedRecord.toJson());

      // 상태 코드 확인
      if (response.statusCode == 200) {
        print('기존 기록 수정 성공: ${response.data}');
        return true;
      } else {
        print(
            '기존 기록 수정 실패: ${response.statusCode} - ${response.statusMessage}');
        return false;
      }
    } catch (e) {
      print('기록 수정 에러: $e');
      return false;
    }
  }
}
