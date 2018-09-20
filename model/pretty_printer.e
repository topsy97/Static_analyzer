note
	description: "Summary description for {PRETTY_PRINTER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PRETTY_PRINTER

inherit

	VISITOR
--	OUR_ITERATOR[G]

create
	make

feature {NONE} -- Constructor

	make
		do
			create text.make_empty
			create curr_expression.make
		end

feature {ETF_MODEL} --hidden

	reset
		do
			make
		end

feature -- Queries

	visit_current (e: CURRENT_EXPRESSION)
		do
			text.append (e.output)
		end

	visit_nil (e: NIL_EXPRESSION)
		do
			text.append (e.output)
		end

	visit_integer (e: INTEGER_CONSTANT)
		do
			text.append (e.integer.out)
		end

	visit_add (e: ADD)
		do
			text.append ("(")
			e.left.accept (Current)
			text.append (" + ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_subtract (e: SUBTRACT)
		do
			text.append ("(")
			e.left.accept (Current)
			text.append (" - ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_multiply (e: MULTIPLY)
		do
			text.append ("(")
			e.left.accept (Current)
			text.append (" * ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_division (e: DIVISION)
		do
			text.append ("(")
			e.left.accept (Current)
			text.append (" / ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_boolean (e: BOOLEAN_CONSTANT)
		do
			text.append (e.boolean.out)
		end

	visit_or (e: O_R)
		do
			text.append ("(")
			e.left.accept (Current)
			text.append (" || ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_and (e: A_N_D)
		do
			text.append ("(")
			e.left.accept (Current)
			text.append (" && ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_implies (e: IMPLY)
		do
			text.append ("(")
			e.left.accept (Current)
			text.append (" => ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_gt (e: GT)
		do
			text.append ("(")
			e.left.accept (Current)
			text.append (" > ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_lt (e: LT)
		do
			text.append ("(")
			e.left.accept (Current)
			text.append (" < ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_equal (e: EQUAL)
		do
			text.append ("(")
			e.left.accept (Current)
			text.append (" = ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_set_enumeration (e: SET_OP)
		do
			text.append ("{")
			across
				e.our_set as cursor
			loop
				--across the enumeration array, each expression that is not the last has a comma after
				cursor.item.accept(current)
				if
					not cursor.after  --.is_last
				then
					text.append (",")
				end
			end
			-- for the last element,check if it is closed
				if
					not e.is_closed --and not found_next_input
				then
					if
						e.count > 0
					then
						text.append (",")
					end
					text.append (curr_expression.output)
					--text.append ("?")
				end
			text.append ("}")
		end

	visit_union (e: UNION)
		do
			text.append ("(")
			e.left.accept (Current)
			text.append (" \/ ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_intersect (e: INTERSECT)
		do
			text.append ("(")
			e.left.accept (Current)
			text.append (" /\ ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_difference (e: DIFFERENCE)
		do
			text.append ("(")
			e.left.accept (Current)
			text.append (" \ ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_negative (e: NEGATIVE)
		do
			text.append ("(- ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_negation (e: NEGATION)
		do
			text.append ("(! ")
			e.right.accept (Current)
			text.append (")")
		end

	visit_sum (e: SUM)
		do
--			text.append ("(+ ")
--			e.op.accept (Current)
--			text.append (")")
		end

	visit_forall (e: FORALL)
		do
--			text.append ("(&& ")
--			e.operand.accept (Current)
--			text.append (")")
		end

	visit_exists (e: EXISTS)
		do
--			text.append ("(|| ")
--			e.operand.accept (Current)
--			text.append (")")
		end

feature -- Queries

	text: STRING
	curr_expression: CURRENT_EXPRESSION

end

