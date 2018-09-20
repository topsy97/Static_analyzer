note
	description: "Summary description for {OUR_ITERATOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OUR_ITERATOR[G]
inherit
	ITERATION_CURSOR[G]
create {SET_OP}
	make
feature {SET_OP}
		make(c: INDEXABLE_ITERATION_CURSOR[G])
		do
			cursor:= c
		end
feature {NONE}
	cursor: INDEXABLE_ITERATION_CURSOR[G]

feature
	after: BOOLEAN
	do
		Result:= cursor.after
	end

	forth
	do
		cursor.forth
	end

	item: G
	do
		Result:= cursor.item
	end

	is_last:BOOLEAN
	do
		Result:= cursor.is_last
	end
end
