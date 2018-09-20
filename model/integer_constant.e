note
	description: "Summary description for {INTEGER_CONSTANT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INTEGER_CONSTANT
inherit
	BASIC_EXPRESSION

create
	make

feature -- Constructor

	make(i: INTEGER_64)
		do
			integer:= i
		end

feature -- Attributes

	integer: INTEGER_64

feature -- Methods

	accept(v: VISITOR)
		do
			v.visit_integer (Current)
		end

	output: STRING
		do
			Result:=integer.out
		end
end
