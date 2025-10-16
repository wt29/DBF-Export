dbfile := Directory( '*.dbf' )
for x := 1 to len( dbfile )
 ? dbfile[ x,1 ]
 fn = dbfile[x,1]
 use &fn new
 copy structure extended to tmp
 csv = substr( dbfile[ x,1 ], 1, at( '.', dbfile[x,1] ) -1 ) + ".csv"
 copy to &csv delimited
 use tmp
 csv = substr( dbfile[ x,1 ], 1, at( '.', dbfile[x,1] ) -1 ) + ".stru"
 copy to &csv delimited
 use
 erase tmp.dbf
next 
