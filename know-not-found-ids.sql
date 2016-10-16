
SELECT a FROM (
	
	values ('id-1'), ('id-2'), ('id-fool-not-found'), ('id-4')

--	values (?), (?) ...
) s(a)

WHERE a NOT IN (select id::text from images)
