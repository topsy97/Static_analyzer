note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD
inherit
	ETF_ADD_INTERFACE
		redefine add end
create
	make
feature -- command
	add
    	do
			model.pretty_print

			if model.get_pretty_text.has ('?') then
				model.insert_binary_op_expression (create {ADD}.make_add)

				model.reset_printer
				model.pretty_print
				model.default_update
				model.set_expression (model.get_pretty_text)
				model.set_report (model.report_success)
--			else
--				model.default_update
--				model.set_expression (model.get_pretty_text)
--				model.set_report (model.report_expression_is_already_fully_specified)
--			end


--	if model.get_pretty_text.has ('?')and (model.enumerator_variable ~ false) then
--				model.insert_binary_op_expression (create {ADD}.make_add)

--				model.reset_printer
--				model.pretty_print
--				model.default_update
--				model.set_expression (model.get_pretty_text)
--				model.set_report (model.report_success)

	--else
--	if model.get_pretty_text.has ('?')and (model.enumerator_variable ~ true) then
--				model.insert_binary_op_expression (create {ADD}.make_add)
--				model.reset_printer
--				model.pretty_print
--				model.default_update
--				model.set_expression (model.get_pretty_text)
--				model.enumerator.add (model.get_last_expression)
--				model.set_report (model.report_success)
----				io.put_string ("%N")
----				across model.enumerator.our_set as curs
----				loop
----					io.put_string (curs.item.output)
----				end
----				io.put_string ("%N")

		else
				model.default_update
				model.set_expression (model.get_pretty_text)
				model.set_report (model.report_expression_is_already_fully_specified)
			end
			model.reset_printer

			etf_cmd_container.on_change.notify ([Current])

    	end

end
