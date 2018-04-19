test:
	REUSE_DB=1 ./manage.py test

setup:
	pip install -r requirements.txt
	psql -c 'DROP database IF EXISTS phl_neargreen;'
	psql -c 'DROP database IF EXISTS phl_neargreen_test;'
	psql -c 'DROP ROLE IF EXISTS phl_neargreen_user;'
	psql -c 'create user phl_neargreen_user;'
# don't love this but superuser is needed in order to add postgres extensions...
	psql -c 'ALTER USER phl_neargreen_user SUPERUSER;'
	psql -c 'create database phl_neargreen owner phl_neargreen_user;'
	python manage.py migrate
	# mkdir -p csv_files
	# python manage.py csv_ingest
