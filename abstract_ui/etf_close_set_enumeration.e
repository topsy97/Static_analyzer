note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_CLOSE_SET_ENUMERATION
inherit
	ETF_CLOSE_SET_ENUMERATION_INTERFACE
		redefine close_set_enumeration end
create
	make
feature -- command
	close_set_enumeration
--		local
--			i: INTEGER
    	do
    		model.pretty_print
    		if
    			model.get_pretty_text.has ('?')
    		then
			   -- model.insert_set_op_expression (create {SET_OP}.make)
				model.set_enum_var_false
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
--			-- perform some update on the model state
--			if model.i >=0 then
--				if model.expression.at (model.expression.count) ~ ',' then
--					from
--						i:=model.expression.count-3
--					until
--						i > model.expression.count
--					loop
--						model.expression.remove (i)
--					end
--					model.expression.append ("}")
--					model.set_report (model.report_success)
--				end
--				model.default_update
--			end

			etf_cmd_container.on_change.notify ([Current])
    	end

end
