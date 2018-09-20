note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_IMPLY
inherit
	ETF_IMPLY_INTERFACE
		redefine imply end
create
	make
feature -- command
	imply
    	do
			-- perform some update on the model state
			model.pretty_print

			if model.get_pretty_text.has ('?') then
				model.insert_binary_op_expression (create {IMPLY}.make_imp)

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
			etf_cmd_container.on_change.notify ([Current])
    	end

end
