function get_threaded_insert_plain_d(size) = lookup(size, [
  [ 3.00,  5.00],
]);

// The total length, i.e., including the flange.
function get_threaded_insert_plain_h(size) = lookup(size, [
  [ 3.00,  9.3],
]);


function get_threaded_insert_plain_flange_d(size) = lookup(size, [
  [ 3.00,  7.35],
]);

function get_threaded_insert_plain_flange_h(size) = lookup(size, [
  [ 3.00,  0.8],
]);


module threaded_insert_plain(size=3) {
  d = get_threaded_insert_plain_d(size);
  h = get_threaded_insert_plain_h(size);
  flange_d = get_threaded_insert_plain_flange_d(size);
  flange_h = get_threaded_insert_plain_flange_h(size);
  color("DarkKhaki", 0.75) {
    cylinder(d=flange_d, h=flange_h);
    cylinder(d=d, h=h);
  }
}
