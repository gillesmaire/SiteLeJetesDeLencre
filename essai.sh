#! /bin/sh



nbSecondes ()
{
   d1=date -s $1
   d2=`date
   e1=d1 +%s
   e2=d2 +%s
   nbsec=$($e2 - $e1)
   print "nb sec :%d\n" nbsec
}
