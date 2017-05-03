#! /bin/bash
mysql -uroot -p < database/sql/create/create_dance.sql
mysql -uroot -p < database/sql/populate/populate_dance.sql 
mysql -uroot -p < database/sql/test/test.sql
