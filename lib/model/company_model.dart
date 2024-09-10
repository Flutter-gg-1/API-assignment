
class CompanyModel {
  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
  late final String name;
  late final String catchPhrase;
  late final String bs;
  
  CompanyModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}