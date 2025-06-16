#! /bin/sh



datePassee ()
{
   d1=`date --date="$3-$2-$1" +%s`
   d2=`date +%s`
   diff=`expr $d2 - 86400 - $d1 `
   if [ "$diff" -gt 0 ]
   then
      return 1
   else
      return 0
   fi

}

datePassee 17 06 2026
echo $?
datePassee 17 06 2025
echo $?
datePassee 16 06 2025
echo $?
datePassee 15 06 2025
echo $?
datePassee 10 05 2025
echo $?
