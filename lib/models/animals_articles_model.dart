class Articles {
  String animalId='';
  String animalImage1 ='';
  String animalImage2 ='';
  String animalImage3 ='';
  String name='';
  String other_name='';
  String detail='';
  String animalcolor ='';
  String video_img_url ='';
  String video_url ='';

  String scientific_name='';
  String family='';
  String kingdom ='';
  String height ='';
  String weight ='';

  String life_span ='';
  String location ='';
  String no_of_species ='';




  Articles();
  Articles.fromMap(Map<String, dynamic> data) {
    animalId= data['animalId'] ;
    animalImage1 = data['animalImage1']  ;
    animalImage2 = data['animalImage2']  ;
    animalImage3 = data['animalImage3']  ;
    name= data['name'] ;
    other_name= data['other_name'] ;
    detail= data['detail'] ;
    animalcolor= data['animalcolor'];
    video_img_url= data['video_img_url'] ;
    video_url= data['video_url'];

    scientific_name= data['scientific_name'];
    family= data['family'] ;
    kingdom= data['kingdom'] ;
    height= data['height'] ;
    weight= data['weight'];
    life_span= data['life_span'] ;
    location= data['location'];
    no_of_species= data['no_of_species'];

  }

  Map<String, dynamic> toMap() {
    return {
      'animalId': animalId,
      'animalImage1': animalImage1,
      'name': name,
      'other_name': other_name,
      'detail': detail,
      'animalcolor': animalcolor,
      'video_img_url': video_img_url,
      'video_url': video_url,
    };
  }
}

List<Articles> articlesForDisplay = [];