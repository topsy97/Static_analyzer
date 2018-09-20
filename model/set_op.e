note
	description: "Summary description for {SET_ENUMERATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SET_OP
inherit
	EXPRESSION
create
	--make_set_enum
	make
feature -- attributes
	our_set: SET[EXPRESSION]
	is_closed: BOOLEAN
	can_be_closed: BOOLEAN
		do
			Result := our_set.count > 0
		end
feature -- constructor

	make
		do
			is_closed := FALSE
			create our_set.make_empty
		end
feature -- attributes and methods

	add(new: EXPRESSION)
		do
			our_set.extend (new)
		end
	close
		require
			not_closed_yet: not is_closed
			can_close: can_be_closed
		do
			is_closed := true
		ensure
			closed: is_closed
		end

	count: INTEGER
		do
			Result := our_set.count
		end

	output: STRING
		local
			i: INTEGER
			imp: ARRAY[EXPRESSION]
		do
			create imp.make_from_array (our_set.as_array)
			create Result.make_empty

			Result.append ("{")
			from
				i := imp.lower
			until
				i > imp.upper
			loop
				check attached {EXPRESSION} imp[i] as e then
					Result.append (e.output)
				end
				if i < imp.upper then
					Result.append (", ")
				end
				i := i + 1
			end
			Result.append ("}")
		end

	accept (v: VISITOR)
		do
			v.visit_set_enumeration (Current)
		end
end
