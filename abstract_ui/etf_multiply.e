note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MULTIPLY
inherit
	ETF_MULTIPLY_INTERFACE
		redefine multiply end
create
	make
feature -- command
	multiply
    	do
			model.pretty_print

					if model.get_pretty_text.has ('?') then
						model.insert_binary_op_expression (create {MULTIPLY}.make_multiply)

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

					model.reset_printer
			--model.default_update
			etf_cmd_container.on_change.notify ([Current])
    	end

end
