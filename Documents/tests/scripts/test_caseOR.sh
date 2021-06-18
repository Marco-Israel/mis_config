for n 4 14 24 34
do
  echo -n "$n = "
  case "$n" in
   3? )
     echo -n thirty-
     ;;&   #resume (to find ?4 later )
   "24" )
     echo -n twenty-
     ;&   #fallthru
   "4" | [13]4)
     echo -n four
     ;;&  # resume ( to find teen where needed )
   "14" )
     echo -n teen
  esac
  echo
done
