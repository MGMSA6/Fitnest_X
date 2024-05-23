import 'gallery.dart';

class GallerySet {
  final String date;
  final List<Gallery> gallery;

  GallerySet(this.date, this.gallery);

  static List<GallerySet> getGallerySetData() {
    final List<GallerySet> gallerySet = [
      GallerySet("2 June", getData1()),
      GallerySet("5 May", getData2()),
    ];
    return gallerySet;
  }

  static List<Gallery> getData1() {
    final List<Gallery> meals = [
      Gallery("assets/images/arm_raises.png"),
      Gallery("assets/images/cobra_stretch.png"),
      Gallery("assets/images/jumping_jack.png"),
      Gallery("assets/images/push_ups.png")
    ];
    return meals;
  }

  static List<Gallery> getData2() {
    final List<Gallery> meals = [
      Gallery("assets/images/skipping.png"),
      Gallery("assets/images/squats.png"),
      Gallery("assets/images/warm_up.png"),
      Gallery("assets/images/rest_drink.png")
    ];
    return meals;
  }
}
