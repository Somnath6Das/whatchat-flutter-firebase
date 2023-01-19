class MeModel {
  final String firstname;
  final String lastname;
  final String avatar;
  final String city;
  final String relationship;
  final String gender;
  final String job_title;
  final String job_area;
  final bool story;
  final String status;
  final List<String> stories;

  MeModel(
      {required this.firstname,
      required this.lastname,
      required this.avatar,
      required this.city,
      required this.relationship,
      required this.gender,
      required this.job_title,
      required this.job_area,
      required this.status,
      required this.story,
      required this.stories});

 factory MeModel.fromJson(Map<String, dynamic> data) => MeModel (
      firstname: data['firstname'],
      lastname: data['lastname'],
      avatar: data['avatar'],
      city: data['city'],
      relationship: data['relationship'],
      gender: data['gender'],
      job_title: data['job_area'],
      job_area: data['job_title'],
      status: data['status'],
      story: data['story'],
      stories: List.from(data['stories']));
}
