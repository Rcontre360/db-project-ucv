-- IMPORTANT: Be careful!! This is a TablesKiller that will delete all your bd :).
-- If you have something else that is not dummy test data I wont recommend running this. Also backup your schema code ;)
-- autor: the internet

DO $$ 
DECLARE 
    _tbl text; 
BEGIN 
    FOR _tbl IN (SELECT tablename FROM pg_tables WHERE schemaname = current_schema()) LOOP 
        EXECUTE 'DROP TABLE IF EXISTS ' || _tbl || ' CASCADE'; 
    END LOOP; 
END $$;

-- IMPORTANT: Be careful!! Next script is the cousin of the script above. Its called DataKiller.
-- If you have something else that is not dummy test data I wont recommend running this
-- autor: the internet

DO $$ 
DECLARE 
    _tbl text; 
BEGIN 
    FOR _tbl IN (SELECT tablename FROM pg_tables WHERE schemaname = current_schema()) LOOP 
        EXECUTE 'TRUNCATE TABLE ' || _tbl || ' RESTART IDENTITY CASCADE'; 
    END LOOP; 
END $$;
