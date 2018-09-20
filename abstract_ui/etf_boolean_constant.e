note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_BOOLEAN_CONSTANT
inherit
	ETF_BOOLEAN_CONSTANT_INTERFACE
		redefine boolean_constant end
create
	make
feature -- command
	boolean_constant(c: BOOLEAN)
    	do

			model.pretty_print

			if (model.get_pretty_text.has ('?'))
			then

				model.insert_boolean (create{BOOLEAN_CONSTANT}.make (c))
				model.reset_printer
				model.default_update
				model.pretty_print
				model.set_expression (model.get_pretty_text)
				model.set_report (model.report_success)
--			elseif
--				model.report.has_substring ("Error (Expression is already fully specified)")
--			then
----				model.default_update
--				--model.insert_boolean (create{BOOLEAN_CONSTANT}.make (c))
--				model.reset_printer
--				model.default_update
--				model.pretty_print
--				model.set_expression (model.get_pretty_text)
--				model.set_report (model.report_expression_is_already_fully_specified)
			else
				model.insert_boolean (create{BOOLEAN_CONSTANT}.make (c))
				model.reset_printer
				model.default_update
				model.pretty_print
				model.set_expression (model.get_pretty_text)
				model.set_report (model.report_expression_is_already_fully_specified)
			end


			model.reset_printer
			etf_cmd_container.on_change.notify ([Current])
    	end
end
