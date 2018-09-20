note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_SUM
inherit
	ETF_SUM_INTERFACE
		redefine sum end
create
	make
feature -- command
	sum
    	do
			-- perform some update on the model state
			model.pretty_print

			if model.get_pretty_text.has ('?') then
				model.insert_unary_op_expression (create {SUM}.make_sum)

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
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
    	end

end
