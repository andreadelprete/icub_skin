struct Vector {
  1: list<double> content;
} (
  yarp.name = "yarp::sig::Vector"
)

enum BodyPart {
  UNKNOWN_BODY_PART = 0,
  HEAD = 1,
  TORSO = 2,
  LEFT_ARM = 3
  RIGHT_ARM = 4,
  LEFT_LEG = 5,
  RIGHT_LEG = 6,
  ALL_BODY_PART = 7,
  BODY_PART_SIZE = 8
}

enum SkinPart {
  UNKNOWN_SKIN_PART = 0,
  HAND = 1,
  FOREARM = 2,
  UPPER_ARM = 3,
  FRONT_TORSO = 4,
  ALL_SKIN_PART = 5,
  SKIN_PART_SIZE = 6
}

struct TaxelPose {
  1: Vector position;
  2: Vector normal;
}

service SkinCommand {
  bool calib();

  Vector get_touch_thresholds();

  bool set_binarization(1: bool flag);
  bool get_binarization();

  bool set_smooth_filter(1: bool flag);
  bool get_smooth_filter();

  bool set_smooth_factor(1: double factor);
  double get_smooth_factor();

  bool set_safety_threshold(1: i32 threshold);
  i32 get_safety_threshold();

  bool set_compensation_gain(1: double gain);
  double get_compensation_gain();

  bool set_contact_gain(1: double gain);
  double get_contact_gain();

  bool is_calibrating();

  bool set_pose(1: BodyPart body_part, 2: SkinPart skin_part, 3: i32 taxel_index, 4: TaxelPose pose);
  TaxelPose get_pose(1: BodyPart body_part, 2: SkinPart skin_part, 3: i32 taxel_index);

  bool set_poses_skin_part(1: BodyPart body_part, 2: SkinPart skin_part, 3: list<TaxelPose> poses);
  list<TaxelPose> get_poses_skin_part(1: BodyPart body_part, 2: SkinPart skin_part);

  bool set_poses_body_part(1: BodyPart body_part, 2: list<TaxelPose> poses);
  list<TaxelPose> get_poses_body_part(1: BodyPart body_part);

  bool set_poses_all(1: list<TaxelPose> poses);
  list<TaxelPose> get_poses_all();

  map<string,string> get_info();
}
