note
	description: "Summary description for {NIL_EXPRESSION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NIL_EXPRESSION
inherit
	EXPRESSION
create
	make

feature -- constructor
	make
		do end

feature -- methods

	output: STRING
		do
			Result:="nil"
		end

	accept(v: VISITOR)
		do
			v.visit_nil(Current)
		end
end
