
if( typeof module !== 'undefined' )
require( 'wmathconcepts' );

var _ = wTools;

 var box = _.vector.fromArray( [ 0, 0, 2, 2 ] );
 var box = _.box.boundingSphereGet( null, box );

 console.log( box );


debugger;
