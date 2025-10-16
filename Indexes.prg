#include "fileio.ch"
#define CRLF chr( 13 ) + chr( 10 )

external descend
external padr
rddsetdefault( "DBFCDX" )
request DBFFPT
request DBFCDX
set autopen on
fhandle := fcreate( 'indexes.txt' )
dbfile := Directory( '*.dbf' )
for x := 1 to len( dbfile )
 ? dbfile[ x,1 ]
 fn = dbfile[x,1]
 fwrite( fhandle,  FN + CRLF  )
 use &fn index &fn new
 for y=1 to OrdCount()
      fwrite( fhandle, padr( y, 15 ) + padr( ordname(y ), 20 ) + ;
              padr( ordkey(y), 50 ) + CRLF )
  // ? Ordname(y), OrdKey(y)
 next   
 fwrite( fhandle, CRLF  )
 use
next 
quit