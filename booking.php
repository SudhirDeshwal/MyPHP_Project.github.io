<?php
include_once 'startsession.php';
include_once 'utils.php';
include_once 'logging.php';
include_once 'db.php';
include_once 'bookCar.php';
include_once 'sendemail.php';

if (isset($_POST['book_trip']) && isset($_SESSION['userid'])) {

  $bookingCode = bookingCodeGen();
  $result = createNewBooking($_POST['tripid'], $_SESSION['userid'], $_POST['adults'], $_POST['children'], $_POST['notes'], $_POST['costtotal'],  $bookingCode);

  if ($result) {
    $userName = getUsername($_SESSION['userid']);
    if (sendBookingEmail($_SESSION['email'], $userName, $bookingCode)) {
      header('location: bookingsucess.php?code=' . $bookingCode);
    }
  }
} else {
}


if (isset($_GET['trip_id'])) {
  $trip = getTrip($_GET['trip_id']);
} else {
  if (isset($_POST['tripid'])) {
    $trip = getTrip($_POST['tripid']);
  } else {
    header('location: trip_list.php');
  }
}

?>

<?php include 'navbar.php'; ?>

<div class="container">
  <div class="row shadow p-3 mb-3 mt-3 bg-white rounded">
    <div class="col">
      <?php
      echo generateCar(getImagesForCar($trip['trip_id']));
      ?>
    </div>
    <div class="col">
      Description: <?= $trip['short_description']; ?>
    </div>
  </div>

  <div class="row shadow p-3 mb-2  bg-white rounded">
    <div class="col">
      Booking Details
      <?php
      if (isset($_SESSION['email'])) {
        include_once 'bookingform.php';
      } else {
        include_once 'loginrequired.php';
      }
      ?>
    </div>

  </div>

</div>


<?php include 'footer.php'; ?>