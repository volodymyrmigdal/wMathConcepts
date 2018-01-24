( function _Sphere_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  //if( typeof wBase === 'undefined' )
  if( typeof wBase === 'undefined' )
  try
  {
    try
    {
      require.resolve( '../../../../dwtools/Base.s' )/*fff*/;
    }
    finally
    {
      require( '../../../../dwtools/Base.s' )/*fff*/;
    }
  }
  catch( err )
  {
    require( 'wTools' );
  }

  var _ = wTools;

  _.include( 'wTesting' );

  require( '../cvector/Base.s' );
  require( '../cvector/Base.s' );
  require( '../geometric/Sphere.s' );

}

//

var _ = wTools.withArray.Float32;
var Space = _.Space;
var vector = _.vector;
var vec = _.vector.fromArray;
var avector = _.avector;
var sqrt = _.sqrt;
var Parent = wTools.Tester;

_.assert( sqrt );

// --
// test
// --

function is( test )
{

  test.description = 'array'; //

  test.shouldBe( _.box.is( [] ) );
  test.shouldBe( _.box.is([ 0,0 ]) );
  test.shouldBe( _.box.is([ 1,2,3,4 ]) );
  test.shouldBe( _.box.is([ 0,0,0,0,0,0 ]) );

  test.description = 'vector'; //

  test.shouldBe( _.box.is( _.vector.fromArray([]) ) );
  test.shouldBe( _.box.is( _.vector.fromArray([ 0,0 ]) ) );
  test.shouldBe( _.box.is( _.vector.fromArray([ 1,2,3,4 ]) ) );
  test.shouldBe( _.box.is( _.vector.fromArray([ 0,0,0,0,0,0 ]) ) );

  test.description = 'not box'; //

  test.shouldBe( !_.box.is([ 0 ]) );
  test.shouldBe( !_.box.is([ 0,0,0 ]) );

  test.shouldBe( !_.box.is( _.vector.fromArray([ 0 ]) ) );
  test.shouldBe( !_.box.is( _.vector.fromArray([ 0,0,0 ]) ) );

  test.shouldBe( !_.box.is( 'abc' ) );
  test.shouldBe( !_.box.is( { center : [ 0,0,0 ], radius : 1 } ) );
  test.shouldBe( !_.box.is( function( a,b,c ){} ) );

}

//

function isEmpty( test )
{

  test.description = 'empty'; //

  test.shouldBe( _.box.isEmpty([]) );
  test.shouldBe( _.box.isEmpty([ 0,0 ]) );
  test.shouldBe( _.box.isEmpty([ 0,0,0,0,0,0 ]) );
  test.shouldBe( _.box.isEmpty([ 1,1 ]) );
  test.shouldBe( _.box.isEmpty([ 5,0,5,0 ]) );
  test.shouldBe( _.box.isEmpty([ -3,0,5,-3,0,5 ]) );

  test.shouldBe( _.box.isEmpty([ 0,0,0,1 ]) );
  test.shouldBe( _.box.isEmpty([ 0,-1 ]) );
  test.shouldBe( _.box.isEmpty([ 0,0,0,-1 ]) );
  test.shouldBe( _.box.isEmpty([ 0,0,5,0 ]) );

  test.shouldBe( _.box.isEmpty([ 0,-Infinity ]) );
  test.shouldBe( _.box.isEmpty([ +Infinity,+Infinity,+Infinity,-Infinity,-Infinity,-Infinity ]) );
  test.shouldBe( _.box.isEmpty([ 0,0,0,Infinity ]) );

  test.shouldBe( _.box.isEmpty([ 0.1,-Infinity ]) );
  test.shouldBe( _.box.isEmpty([ 0,0,0.1,-Infinity ]) );

  test.description = 'not empty'; //

  test.shouldBe( !_.box.isEmpty([ 0,1 ]) );

  test.shouldBe( !_.box.isEmpty([ 0,+Infinity ]) );
  test.shouldBe( !_.box.isEmpty([ -Infinity,0,0,+Infinity ]) );

  test.shouldBe( !_.box.isEmpty([ 0.1,+Infinity ]) );
  test.shouldBe( !_.box.isEmpty([ 0,0.00001,0.1,+Infinity ]) );

}

//

function isZero( test )
{

  test.description = 'zero'; //

  test.shouldBe( _.box.isZero([]) );
  test.shouldBe( _.box.isZero([ 0,0 ]) );
  test.shouldBe( _.box.isZero([ 0,0,0,0,0,0 ]) );
  test.shouldBe( _.box.isZero([ 1,1 ]) );
  test.shouldBe( _.box.isZero([ 5,0,5,0 ]) );
  test.shouldBe( _.box.isZero([ -3,0,5,-3,0,5 ]) );

  test.description = 'not zero'; //

  test.shouldBe( !_.box.isZero([ 0,1 ]) );
  test.shouldBe( !_.box.isZero([ 0,0,0,1 ]) );

  test.shouldBe( !_.box.isZero([ 0,-1 ]) );
  test.shouldBe( !_.box.isZero([ 0,0,0,-1 ]) );
  test.shouldBe( !_.box.isZero([ 0,0,5,0 ]) );

  test.shouldBe( !_.box.isZero([ 0,-Infinity ]) );
  test.shouldBe( !_.box.isZero([ +Infinity,+Infinity,+Infinity,-Infinity,-Infinity,-Infinity ]) );

  test.shouldBe( !_.box.isZero([ 0,Infinity ]) );
  test.shouldBe( !_.box.isZero([ 0,0,0,Infinity ]) );

  test.shouldBe( !_.box.isZero([ 0.1,-Infinity ]) );
  test.shouldBe( !_.box.isZero([ 0,0,0.1,-Infinity ]) );

}

//

function isNil( test )
{

  test.description = 'nil'; //

  test.shouldBe( _.box.isNil([ +Infinity,+Infinity,-Infinity,-Infinity ]) );
  test.shouldBe( _.box.isNil([ +Infinity,+Infinity,+Infinity,-Infinity,-Infinity,-Infinity ]) );

  test.shouldBe( _.box.isNil([ +1,+1,-2,-5 ]) );
  test.shouldBe( _.box.isNil([ +1,+1,+1,-2,-3,-4 ]) );

  test.description = 'not nil'; //

  test.shouldBe( !_.box.isNil([ 0,Infinity ]) );
  test.shouldBe( !_.box.isNil([ 0,0,0,Infinity ]) );

  test.shouldBe( !_.box.isNil([ Infinity,Infinity ]) );
  test.shouldBe( !_.box.isNil([ 0,0,0.1,Infinity ]) );

}

//

function make( test )
{

  test.description = 'src undefined'; //

  var src = undefined;
  var got = _.box.make( src );
  var expected = [ 0,0,0,0,0,0 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src null'; //

  var src = null;
  var got = _.box.make( src );
  var expected = [ 0,0,0,0,0,0 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src 2'; //

  var src = 2;
  var got = _.box.make( src );
  var expected = [ 0,0,0,0 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src array'; //

  var src = [ 0,1,2,3 ];
  var got = _.box.make( src );
  var expected = [ 0,1,2,3 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src vector'; //

  var src = _.vector.fromArray([ 0,1,2,3 ]);
  var got = _.box.make( src );
  var expected = [ 0,1,2,3 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

}

//

function makeZero( test )
{

  test.description = 'src undefined'; //

  var src = undefined;
  var got = _.box.makeZero( src );
  var expected = [ 0,0,0,0,0,0 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src null'; //

  var src = null;
  var got = _.box.makeZero( src );
  var expected = [ 0,0,0,0,0,0 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src 2'; //

  var src = 2;
  var got = _.box.makeZero( src );
  var expected = [ 0,0,0,0 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src array'; //

  var src = [ 0,1,2,3 ];
  var got = _.box.makeZero( src );
  var expected = [ 0,0,0,0 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src vector'; //

  var src = _.vector.fromArray([ 0,1,2,3 ]);
  var got = _.box.makeZero( src );
  var expected = [ 0,0,0,0 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

}

//

function makeNil( test )
{

  test.description = 'src undefined'; //

  var src = undefined;
  var got = _.box.makeNil( src );
  var expected = [ +Infinity,+Infinity,+Infinity,-Infinity,-Infinity,-Infinity ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src null'; //

  var src = null;
  var got = _.box.makeNil( src );
  var expected = [ +Infinity,+Infinity,+Infinity,-Infinity,-Infinity,-Infinity ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src 2'; //

  var src = 2;
  var got = _.box.makeNil( src );
  var expected = [ +Infinity,+Infinity,-Infinity,-Infinity ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src array'; //

  var src = [ 0,1,2,3 ];
  var got = _.box.makeNil( src );
  var expected = [ +Infinity,+Infinity,-Infinity,-Infinity ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src vector'; //

  var src = _.vector.fromArray([ 0,1,2,3 ]);
  var got = _.box.makeNil( src );
  var expected = [ +Infinity,+Infinity,-Infinity,-Infinity ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

}

//

function zero( test )
{

  test.description = 'src undefined'; //

  var src = undefined;
  var got = _.box.zero( src );
  var expected = [ 0,0,0,0,0,0 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src null'; //

  var src = null;
  var got = _.box.zero( src );
  var expected = [ 0,0,0,0,0,0 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src 2'; //

  var src = 2;
  var got = _.box.zero( src );
  var expected = [ 0,0,0,0 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'dst array'; //

  var dst = [ 0,1,2,3 ];
  var got = _.box.zero( dst );
  var expected = [ 0,0,0,0 ];
  test.identical( got,expected );
  test.shouldBe( got === dst );

  test.description = 'dst vector'; //

  var dst = _.vector.fromArray([ 0,1,2,3 ]);
  var got = _.box.zero( dst );
  var expected = _.vector.fromArray([ 0,0,0,0 ]);
  test.identical( got,expected );
  test.shouldBe( got === dst );

  test.description = 'dst array 1d'; //

  var dst = [ 0,1 ];
  var got = _.box.zero( dst );
  var expected = [ 0,0 ];
  test.identical( got,expected );
  test.shouldBe( got === dst );

}

//

function nil( test )
{

  test.description = 'src undefined'; //

  var src = undefined;
  var got = _.box.nil( src );
  var expected = [ +Infinity,+Infinity,+Infinity,-Infinity,-Infinity,-Infinity ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src null'; //

  var src = null;
  var got = _.box.nil( src );
  var expected = [ +Infinity,+Infinity,+Infinity,-Infinity,-Infinity,-Infinity ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src 2'; //

  var src = 2;
  var got = _.box.nil( src );
  var expected = [ +Infinity,+Infinity,-Infinity,-Infinity ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'dst array'; //

  var dst = [ 0,1,2,3 ];
  var got = _.box.nil( dst );
  var expected = [ +Infinity,+Infinity,-Infinity,-Infinity ];
  test.identical( got,expected );
  test.shouldBe( got === dst );

  test.description = 'dst vector'; //

  var dst = _.vector.fromArray([ 0,1,2,3 ]);
  var got = _.box.nil( dst );
  var expected = _.vector.fromArray([ +Infinity,+Infinity,-Infinity,-Infinity ]);
  test.identical( got,expected );
  test.shouldBe( got === dst );

  test.description = 'dst array 2d'; //

  var dst = [ 1,3 ];
  var got = _.box.nil( dst );
  var expected = [ +Infinity,-Infinity ];
  test.identical( got,expected );
  test.shouldBe( got === dst );

}

//

function centeredOfSize( test )
{

  test.description = 'src undefined'; //

  var src = undefined;
  var got = _.box.centeredOfSize( src,2 );
  var expected = [ -1,-1,-1,+1,+1,+1 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src null'; //

  var src = null;
  var got = _.box.centeredOfSize( src,2 );
  var expected = [ -1,-1,-1,+1,+1,+1 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src 2'; //

  var src = 2;
  var got = _.box.centeredOfSize( src,2 );
  var expected = [ -1,-1,+1,+1 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'dst array'; //

  var dst = [ 0,1,2,3 ];
  var got = _.box.centeredOfSize( dst,2 );
  var expected = [ -1,-1,+1,+1 ];
  test.identical( got,expected );
  test.shouldBe( got === dst );

  test.description = 'dst vector'; //

  var dst = _.vector.fromArray([ 0,1,2,3 ]);
  var got = _.box.centeredOfSize( dst,2 );
  var expected = _.vector.fromArray([ -1,-1,+1,+1 ]);
  test.identical( got,expected );
  test.shouldBe( got === dst );

  test.description = 'dst array 2d'; //

  var dst = [ 1,3 ];
  var got = _.box.centeredOfSize( dst,2 );
  var expected = [ -1,+1 ];
  test.identical( got,expected );
  test.shouldBe( got === dst );

  /* */

  test.description = 'src undefined, implicit size'; //

  var src = undefined;
  var got = _.box.centeredOfSize( src );
  var expected = [ -0.5,-0.5,-0.5,+0.5,+0.5,+0.5 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src null, implicit size'; //

  var src = null;
  var got = _.box.centeredOfSize( src );
  var expected = [ -0.5,-0.5,-0.5,+0.5,+0.5,+0.5 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src 2, implicit size'; //

  var src = 2;
  var got = _.box.centeredOfSize( src );
  var expected = [ -0.5,-0.5,+0.5,+0.5 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'dst array, implicit size'; //

  var dst = [ 0,1,2,3 ];
  var got = _.box.centeredOfSize( dst );
  var expected = [ -0.5,-0.5,+0.5,+0.5 ];
  test.identical( got,expected );
  test.shouldBe( got === dst );

  test.description = 'dst vector, implicit size'; //

  var dst = _.vector.fromArray([ 0,1,2,3 ]);
  var got = _.box.centeredOfSize( dst );
  var expected = _.vector.fromArray([ -0.5,-0.5,+0.5,+0.5 ]);
  test.identical( got,expected );
  test.shouldBe( got === dst );

  test.description = 'dst array 2d, implicit size'; //

  var dst = [ 1,3 ];
  var got = _.box.centeredOfSize( dst );
  var expected = [ -0.5,+0.5 ];
  test.identical( got,expected );
  test.shouldBe( got === dst );

  /* */

  test.description = 'src undefined with sizes in array'; //

  var src = undefined;
  var got = _.box.centeredOfSize( src,[ 1,2,4 ] );
  var expected = [ -0.5,-1,-2,+0.5,+1,+2 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src null with sizes in array'; //

  var src = null;
  var got = _.box.centeredOfSize( src,[ 1,2,4 ] );
  var expected = [ -0.5,-1,-2,+0.5,+1,+2 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'src 2 with sizes in array'; //

  var src = 2;
  var got = _.box.centeredOfSize( src,[ 2,4 ] );
  var expected = [ -1,-2,+1,+2 ];
  test.identical( got,expected );
  test.shouldBe( got !== src );

  test.description = 'dst array with sizes in array'; //

  var dst = [ 0,1,2,3 ];
  var got = _.box.centeredOfSize( dst,[ 2,4 ] );
  var expected = [ -1,-2,+1,+2 ];
  test.identical( got,expected );
  test.shouldBe( got === dst );

  test.description = 'dst vector with sizes in array'; //

  var dst = _.vector.fromArray([ 0,1,2,3 ]);
  var got = _.box.centeredOfSize( dst,[ 2,4 ] );
  var expected = _.vector.fromArray([ -1,-2,+1,+2 ]);
  test.identical( got,expected );
  test.shouldBe( got === dst );

  test.description = 'dst array 2d with sizes in array'; //

  var dst = [ 1,3 ];
  var got = _.box.centeredOfSize( dst,[ 4 ] );
  var expected = [ -2,+2 ];
  test.identical( got,expected );
  test.shouldBe( got === dst );

}

//

function boxFromBox( test )
{

  debugger;

  test.description = 'trivial'; //

  var expected = [ 0.5,0.5,0.5,sqrt( 0.5 ) ];
  var bbox = [ 0,0,0,0,0,0 ];
  var bbox = [ 0,0,0,1,1,1 ];

  _.box.fromBox( bbox,bbox );
  test.equivalent( bbox,expected );

  var expected = vec( expected );
  var bbox = vec([ 0,0,0,0,0,0 ]);
  var bbox = vec( bbox );

  _.box.fromBox( bbox,bbox );
  test.equivalent( bbox,expected );

  test.description = 'same sizes, different position'; //

  var expected = [ -2.5,0.5,5.5,sqrt( 0.5 ) ];
  var bbox = [ 0,0,0,0,0,0 ];
  var bbox = [ -3,0,5,-2,1,6 ];

  _.box.fromBox( bbox,bbox );
  test.equivalent( bbox,expected );

  var expected = vec( expected );
  var bbox = vec([ 0,0,0,0,0,0 ]);
  var bbox = vec( bbox );

  _.box.fromBox( bbox,bbox );
  test.equivalent( bbox,expected );

  test.description = 'different sizes, different position'; //

  var expected = [ -2,0.5,7,sqrt( 5 ) ];
  var bbox = [ 0,0,0,0,0,0 ];
  var bbox = [ -3,0,5,-1,1,9 ];

  _.box.fromBox( bbox,bbox );
  test.equivalent( bbox,expected );

  var expected = vec( expected );
  var bbox = vec([ 0,0,0,0,0,0 ]);
  var bbox = vec( bbox );

  _.box.fromBox( bbox,bbox )
  test.equivalent( bbox,expected );

  test.description = 'bad arguments'; //

  if( !Config.debug )
  return;

  function shouldThrowError( rname )
  {

    test.shouldThrowErrorSync( () => _.avector[ rname ]() );
    test.shouldThrowErrorSync( () => _.avector[ rname ]( [ 1,2 ] ) );
    test.shouldThrowErrorSync( () => _.avector[ rname ]( [ 1,2 ],[ 3 ] ) );
    test.shouldThrowErrorSync( () => _.avector[ rname ]( [ 1,2 ],[ 3,4 ],[ 5 ] ) );
    test.shouldThrowErrorSync( () => _.avector[ rname ]( [ 1,2 ],[ 3,4 ],1 ) );
    test.shouldThrowErrorSync( () => _.avector[ rname ]( [ 1,2 ],[ 3,4 ],undefined ) );
    test.shouldThrowErrorSync( () => _.avector[ rname ]( [ 1,2 ],[ 3,4 ],'1' ) );
    test.shouldThrowErrorSync( () => _.avector[ rname ]( [ 1,2,3,4 ],[ 1,2,3,4,5 ] ) );
    test.shouldThrowErrorSync( () => _.avector[ rname ]( [ 1,2,3 ],[ 1,2,3,4,5,6 ] ) );

    test.shouldThrowErrorSync( () => _.vector[ rname ]() );
    test.shouldThrowErrorSync( () => _.vector[ rname ]( vec([ 1,2 ]) ) );
    test.shouldThrowErrorSync( () => _.vector[ rname ]( vec([ 1,2 ]),vec([ 3 ]) ) );
    test.shouldThrowErrorSync( () => _.vector[ rname ]( vec([ 1,2 ]),vec([ 3,4 ]),vec([ 5 ]) ) );
    test.shouldThrowErrorSync( () => _.vector[ rname ]( vec([ 1,2 ]),vec([ 3,4 ]),1 ) );
    test.shouldThrowErrorSync( () => _.vector[ rname ]( vec([ 1,2 ]),vec([ 3,4 ]),undefined ) );
    test.shouldThrowErrorSync( () => _.vector[ rname ]( vec([ 1,2 ]),vec([ 3,4 ]),'1' ) );
    test.shouldThrowErrorSync( () => _.vector[ rname ]( vec([ 1,2,3,4 ]),vec([ 1,2,3,4,5 ]) ) );
    test.shouldThrowErrorSync( () => _.vector[ rname ]( vec([ 1,2,3 ]),vec([ 1,2,3,4,5,6 ]) ) );

  }

  shouldThrowError( 'boxFromBox' );

  debugger;
}

// --
// proto
// --

var Self =
{

  name : 'Math.Box',
  silencing : 1,
  // verbosity : 7,
  // debug : 1,

  tests :
  {

    is : is,
    isEmpty : isEmpty,
    isZero : isZero,
    isNil : isNil,

    make : make,
    makeZero : makeZero,
    makeNil : makeNil,

    zero : zero,
    nil : nil,
    centeredOfSize : centeredOfSize,

  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

} )( );
