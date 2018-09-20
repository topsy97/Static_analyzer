note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_OPEN_SET_ENUMERATION
inherit
	ETF_OPEN_SET_ENUMERATION_INTERFACE
		redefine open_set_enumeration end
create
	make
feature -- command
	open_set_enumeration
--    	local
--			i: INTEGER
    	do
    		model.pretty_print
    		if
    			model.get_pretty_text.has ('?')
    		then
			   -- model.insert_set_op_expression (create {SET_OP}.make)
				model.set_enum_var_true
				--ADD THE BRACES HERE
				model.reset_printer
				model.pretty_print
				model.default_update
				model.set_expression (model.get_pretty_text)
				model.set_report (model.report_success)
			else
				model.default_update
				model.set_expression (model.get_pretty_text)
				model.set_report (model.report_expression_is_already_fully_specified)
			end
			-- perform some update on the model state
--			if model.i >= 0 then
--				i:= model.expression.index_of ('?', 1)


--				model.expression.insert_character (' ', i)

--				model.expression.replace_substring ("{", i, i)
--				model.expression.insert_character (',', i+2)

--				model.set_report (model.report_success)
--				model.default_update
--			end


			etf_cmd_container.on_change.notify ([Current])
    	end

end
