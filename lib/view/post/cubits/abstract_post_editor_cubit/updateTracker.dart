/// Since we store all fields directly in the cubit we do not get real time updates via the block whenever a field changes
/// this class helps to overcome this issue. It keeps an counter for every field for which we might be interested in listening to updates
/// whenever the field is changed we must increment the counter e.g. [addUpdatePlace]. We can now listen for updates and only filter tor rebuild 
/// whenever the field changed that we are interested in
abstract class PostUpdateTracker{
  int updatePlaceCounter = 0;

  void addUpdatePlace() => updatePlaceCounter++;

}

class EventUpdateTracker extends PostUpdateTracker{

}