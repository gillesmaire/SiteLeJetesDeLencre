#! /bin/sh


filedate="content/dates.md"

# IsDate check if a line is a date ie if it starts with "- " sequence
IsDate()
{
   res=`echo $1 | grep "^-" > /dev/null`
   return $res
}

# convertDate convert part of line like "lundi 12 Juin 2025" in "6 12 2025"
convertDate()
{
   date=`echo $*`
   date=`echo $date| sed "s/[Ll]undi //"`
   date=`echo $date| sed "s/[Ma]ardi //"`
   date=`echo $date| sed "s/[Me]ercredi //"`
   date=`echo $date| sed "s/[Jj]eudi //"`
   date=`echo $date| sed "s/[Vv]endredi //"`
   date=`echo $date| sed "s/[Ss]amedi //"`
   date=`echo $date| sed "s/[Dd]imanche //"`
   date=`echo $date| sed "s/[Jj]anvier /01 /"`
   date=`echo $date| sed "s/[Ff][eé]vrier /02 /"`
   date=`echo $date| sed "s/[Mm]ars /03 /"`
   date=`echo $date| sed "s/[Aa]vril /04 /"`
   date=`echo $date| sed "s/[Mm]ai /05 /"`
   date=`echo $date| sed "s/[Jj]uin /06 /"`
   date=`echo $date| sed "s/[Jj]uillet /07 /"`
   date=`echo $date| sed "s/[Aa]o[uû]t /08 /"`
   date=`echo $date| sed "s/[Ss]eptembre /09 /"`
   date=`echo $date| sed "s/[Oo]ctobre /10 /"`
   date=`echo $date| sed "s/[Nn]ovembre /11 /"`
   date=`echo $date| sed "s/[Ds][ée]cembre /12 /"`
   ret=`echo $date | awk  '{print $3 "-" $2 "-" $1 " 23:59:59"}'`
   echo "$ret"
}

# datePast 15 06 2025  return  1 if date is passed 0 is date is not passed
datePassee()
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


i=1
while IFS= read -r line
do
 if IsDate $line
 then
   dateconcert=$(echo "$line" | sed -E 's/.*(\*\*[[:alpha:]]+ +[0-9]{1,2} +[[:alpha:]]+ +[0-9]{4}\*\*).*/\1/' | tr -d '*')
   echo "****\ndate : $dateconcert"
   lieu=`echo "$line" | sed "s/- *\*\*${dateconcert}\*\*//"`
   echo "lieu : $lieu"
   dateForEpoch=`convertDate "${dateconcert}"`
   echo "dateok :${dateForEpoch}"
   d1=`date -d "${dateForEpoch}" +%s`
   d2=`date +%s`
   echo "$d2 $d1"
   nbSecondes=`expr $d2 - $d1`
   echo $nbSecondes
 else
    echo $line
    date1=""
    date2=""
    lieu=""
 fi

 done< ${filedate}
