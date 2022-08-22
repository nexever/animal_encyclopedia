class AboutAppModel {
  String app_detail='';
  String app_logo ='';
  String app_name='';
  String app_version='';

  AboutAppModel();

  AboutAppModel.fromMap(Map<String, dynamic> data) {
    app_detail= data['app_detail'] ;
    app_logo = data['app_logo']  ;
    app_name= data['app_name'] ;
    app_version= data['app_version'] ;
   }

  Map<String, dynamic> toMap() {
    return {
      'app_detail': app_detail,
      'app_logo': app_logo,
      'app_name': app_name,
      'app_version': app_version,
    };
  }
}

List<AboutAppModel> aboutAppData = [];