class AnimalsVideosModel {
  String video_detail='';
  String video_logo ='';
  String video_name='';
  String video_url='';

  AnimalsVideosModel();

  AnimalsVideosModel.fromMap(Map<String, dynamic> data) {
    video_detail= data['video_detail'] ;
    video_logo = data['video_logo'] ;
    video_name= data['video_name'] ;
    video_url= data['video_url'] ;
  }

  Map<String, dynamic> toMap() {
    return {
      'video_detail': video_detail,
      'video_logo': video_logo,
      'video_name': video_name,
      'video_url': video_url,
    };
  }
}

List<AnimalsVideosModel> vloggerVideosList = [];