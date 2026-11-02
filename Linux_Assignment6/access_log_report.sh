#!/bin/bash
awk '{
      total++

      if ( $7 == 200 )
	      successful++
       else if ($7 == 401)
        unauthorized++

    else if ($7 == 403)
        forbidden++

    else if ($7 >= 500 && $7 < 600)
        server_errors++
}
END {
    print "===== ACCESS LOG REPORT ====="
    print ""
    print "Total Requests :", total
    print "Successful     :", successful
    print "Unauthorized   :", unauthorized
    print "Forbidden      :", forbidden
    print "Server Errors  :", server_errors
}' access.log
