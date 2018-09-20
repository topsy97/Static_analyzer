note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_UNION
inherit 
	ETF_UNION_INTERFACE
		redefine union end
create
	make
feature -- command 
	union
    	do
			-- perform some update on the model state
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
    	end

end
