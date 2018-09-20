note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_INTEGER_CONSTANT
inherit
	ETF_INTEGER_CONSTANT_INTERFACE
		redefine integer_constant end
create
	make
feature -- command
	integer_constant(c: INTEGER_64)
    	do
		model.pretty_print

				if (model.get_pretty_text.has ('?'))
				then

					model.insert_integer (create{INTEGER_CONSTANT}.make (c))
					model.reset_printer
					model.default_update
					model.pretty_print
					model.set_expression (model.get_pretty_text)
					model.set_report (model.report_success)

--				if (model.get_pretty_text.has ('?')and (model.enumerator_variable ~ false))
--				then

--					model.insert_integer (create{INTEGER_CONSTANT}.make (c))
--					model.reset_printer
--					model.default_update
--					model.pretty_print
--					model.set_expression (model.get_pretty_text)
--					model.set_report (model.report_success)

--				elseif model.get_pretty_text.has ('?')and (model.enumerator_variable ~ true) then
--					model.insert_integer (create {INTEGER_CONSTANT}.make(c))
--					model.reset_printer
--					model.pretty_print
--					model.default_update
--					model.set_expression (model.get_pretty_text)

--					model.enumerator.add (model.get_pretty_exp)
--					model.set_report (model.report_success)
--					
--					io.put_string ("%N")
--					across model.enumerator.our_set as curs
--					loop
--						io.put_string (curs.item.output)
--					end
--					io.put_string ("%N")

				else
					model.insert_integer (create{INTEGER_CONSTANT}.make (c))
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
