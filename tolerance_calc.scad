// From http://forum.openscad.org/fe-Tolerance-based-arc-approximation-tp14212p14933.html
//
// returns a value for $fa
// value is calculated from the acceptable linear distance error $fe,
// note: $fs must be set to a small value so that it has no effect,
// e.g. if $fe=0.1 & $fs=0.01 then the $fa=fa(r) will ensure that the
//   distance mid facet to the actual required radius = 0.1
// never returns more than 45 deg => circle -> octagon (if $fe>0 and not $fn>0)
// if $fe<=0 or is undefined function returns the "standard" OpenSCAD combination
//   of $fa & $fs [C code fragment: fmax(fmin(360.0 / fa, r*2*M_PI / fs), 5)]
// if $fn>0 it takes priority, fa() returns 360/max($fn,3)
function fa(r)=$fn>0?360/($fn>3?$fn:3):
               $fe>0?$fe<r?min(45,2*acos(1-$fe/r)):45:
               360/max(min(360/($fa>0.01?$fa:0.01),
                   2*PI*r/($fs>0.01?$fs:0.01)),5);

$fa = 5;
// $fn = 30;
$fs=0.01;
$fe=0.01;
